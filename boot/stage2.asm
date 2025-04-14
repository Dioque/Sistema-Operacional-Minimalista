[BITS 16]
[ORG 0x8000]


; Constantes
CODE_SEG equ 0x08
DATA_SEG equ 0x10
boot_drive equ 0x7DFD

start:

    ; Debug - mostra 'S' se carregado corretamente
    mov ah, 0x0E
    mov al, 'S'
    int 0x10  ; Deve mostrar 'S' na tela se carregado corretamente
    
    ; Configura segmentos
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    
    
    ; Carrega kernel (20 setores) - DEVE SER FEITO ANTES do modo protegido!
    mov ah, 0x02
    mov al, 20
    mov ch, 0
    mov cl, 6       ; Setor após o stage2
    mov dh, 0
    mov dl, [0x7C00 + boot_drive]
    mov bx, 0x1000  ; Carrega kernel em 0x1000
    int 0x13
    jc disk_error
    
    ; Habilita A20
    call enable_A20
    
    ; Carrega GDT
    lgdt [gdt_descriptor]
    
    ; Modo protegido
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    
    jmp CODE_SEG:init32

[BITS 32]
[extern _start]
init32:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x90000
    ; call _start
    jmp 0x1000      ; Pula para o kernel

enable_A20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

disk_error:
    mov si, error_msg
    call print_string
    jmp $

print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp print_string
.done:
    ret

gdt_start:
    dq 0
    dq 0x00CF9A000000FFFF
    dq 0x00CF92000000FFFF
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

error_msg db "Disk error!", 0

times 510 - ($-$$) db 0
dw 0xAA55