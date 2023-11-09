; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    
    v db 0, 0, 0, 0, 0, 0, 0, 0, 0
    vf db "$" 
    vec db 0 dup(100)
    enter db 10, 13, 36
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov si, offset v
    jmp leer
    nuevo:
    mov si, offset vec
    mov si, bx
    cmp [si], 1
    jz leer
    push bx
    mov [si], 1
    mov si, offset v
    inc [si]
    leer:
    mov ax, 0
    mov cx, 0
    mov bx, 0
    mov dx, 1
    ciclo:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 13
    jz ciclosd
    cmp al, 32
    jz nuevo
    mov ah, 0
    sub ax, 30h
    mov cx, ax     
    mov ax, bx
    mov dx, 10
    mul dx
    mov bx, ax
    add bx, cx
    jmp ciclo
    ciclosd:
    mov si, offset vec
    mov si, bx
    cmp [si], 1
    jz siguiente
    mov [si], 1    
    push bx
    mov si, offset v
    inc [si]
    siguiente:
    mov si, offset v
    mov ax, 0
    mov cx, 0
    mov cl, [si]
    mov bx, cx
    mov [si], 0
    
    copiar:
    pop ax
    mov [si], al
    inc si
    loop copiar
    

    lea dx, enter
    mov ah, 9
    int 21h
    
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
     lea si, v
    cicloo:
    
    mov di, si 
    inc di
    ciclo2:
    mov bl, [si]
    mov bh, [di]
    cmp bh, bl
    jc cambiar
    jmp continuar
    cambiar:
    mov [si], bh
    mov [di], bl
    continuar:
    inc di
    cmp [di], "$"
    jz sigE
    jmp ciclo2
    
    sigE:
    add si, 2
    cmp [si], "$"
    jz finordenamiento
    dec si
    jmp cicloo
    finordenamiento:
    mov cx, 0
    mov bx, 0
    mov ax, 0
    mov dx, 0
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
            
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
