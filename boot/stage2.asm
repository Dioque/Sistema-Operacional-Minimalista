[BITS 16]
[ORG 0x0000]

start:
    cli                 ; Desabilita interrupções
    call enable_A20     ; Habilita linha A20 para acessar memória acima de 1MB
    call load_GDT
    call enter_protected_mode

hang:
    jmp hang            ; Se algo der errado, trava aqui

; ------------------------------
; Habilitar A20
enable_A20:
    in al, 0x92
    or al, 00000010b    ; seta bit 1 (A20)
    out 0x92, al
    ret

; ------------------------------
; Carregar GDT
load_GDT:
    lgdt [gdt_descriptor]
    ret

; ------------------------------
; Entrar no modo protegido
enter_protected_mode:
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    jmp CODE_SEG:init32  ; Salta com flush no pipeline

; ------------------------------
; Código 32 bits
[BITS 32]

init32:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000

    ; Carregar o kernel para 0x00100000 (linear)
    mov edi, 0x00100000   ; destino na RAM
    mov ah, 0x02
    mov al, 20            ; setores a ler
    mov ch, 0
    mov cl, 7             ; setor inicial (ajuste conforme seu layout)
    mov dh, 0
    mov dl, 0x80          ; HD

    xor bx, bx
    int 0x13

    jmp 0x00100000        ; pula pro kernel


; ------------------------------
; GDT
gdt_start:
    dq 0x0000000000000000         ; null
    dq 0x00CF9A000000FFFF         ; code segment (base=0, limit=4GB)
    dq 0x00CF92000000FFFF         ; data segment (base=0, limit=4GB)
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ 0x08
DATA_SEG equ 0x10
