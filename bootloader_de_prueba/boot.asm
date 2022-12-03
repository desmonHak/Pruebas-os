[bits 16]
jmp start



start:
    mov ah, 0x00
    mov al, 0x00
    int 0x10

    mov ah, 0x0e
    mov al, 'H'
    int 0x10


times 510 -( $ - $$ ) db 0
dw 0xaa55