[BITS 16]
[ORG 0x0000]

start:
    mov ah, 0x00
    int 0x16

    mov ah, 0x0E
    int 0x10

    jmp start
