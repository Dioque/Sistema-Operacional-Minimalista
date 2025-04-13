[BITS 16]
[ORG 0x7C00]

call LoadSystem

LoadSystem:
    mov ah, 0x02         ; Função de leitura de disco
    mov al, 10           ; Número de setores (ajuste conforme necessário)
    mov ch, 0            ; Cilindro 0
    mov cl, 10           ; Setor 10 (onde o segundo bootloader está)
    mov dh, 0            ; Cabeçote 0
    mov dl, 0x80         ; Disco rígido
    mov bx, 0800h        ; Segmento ES (onde o segundo bootloader será carregado)
    mov es, bx
    mov bx, 0000h        ; Offset 0 (ES:BX = 0800h:0000h)
    int 13h

    ; Salta para o segundo bootloader que foi carregado para 0x0800:0x0000
    jmp 0800h:0000h

times 510 - ($-$$) db 0
dw 0xAA55