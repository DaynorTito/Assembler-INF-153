lea si, v
    mostrar:
    
    mov dl, [si]
    cmp dl, 0
    jz sig
    cmp dl, 10
    jc men
    mov ax, dx
    mov dx, 0
    mov bx, 10
    div bx
    mov bx, dx
    add al, 30h
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    mov dx, bx
    men:
    add dl, 30h
    mov ah, 2
    mov dh, 0
    int 21h
    
    mov al, 32
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    sig:    
    inc si
    cmp [si], "$"
    jz fin
    jmp mostrar
    
    fin:
