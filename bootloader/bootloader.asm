[BITS 16]
[ORG 0x7C00]

call start
jmp 0800h:0000h

start:
    mov ah, 0x00
    int 0x16

    mov ah, 0x0E
    int 0x10

hang:
    jmp hang

LoadSystem:
    mov ah, 02h    ; Função de leitura de disco
    mov al, 5      ; Número de setores (ajuste conforme necessário)
    mov ch, 0      ; Cilindro 0
    mov cl, 2      ; Setor 2 (o bootloader está no setor 1)
    mov dh, 0      ; Cabeçote 0
    mov dl, 80h    ; Disco rígido (80h = primeiro HD)
    mov bx, 0800h  ; Segmento ES (onde o kernel será carregado)
    mov es, bx
    mov bx, 0000h  ; Offset 0 (ES:BX = 0800h:0000h)
    int 13h
    ret

times 510 - ($-$$) db 0
dw 0xAA55