; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    v db 0 ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0
    par db 0,0,0,0,0,0,0,0,0,0
    impar db 0,0,0,0,0,0,0,0,0,0
    var db 0 
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
    
    
    mov cx, 0
    mov si, offset V
    ciclo:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 13
    jz ciclosd
    mov [si], al
    inc si
    inc cx
    jmp ciclo 
    ciclosd:
   
    
    push cx
    
    mov ax, cx
    mov bx, 2
    div bx
    mov cx, ax 
    mov si, offset impar
    mov di, offset v
    push cx
    ver:
    mov bl, [di]
    mov [si], bl
    inc si
    inc di 
    loop ver
    
    pop bx
    pop cx
    sub cx, bx
    mov si, offset par
    ver2:
    mov bl, [di]
    mov [si],bl
    inc si
    inc di
    loop ver2
    
    lea dx, enter
    mov ah, 9
    int 21h
    
    
    mov ax, 0
    
    mov si, offset impar
    mov di, offset par
    mov bx, 1
    mostrar:
    
    cmp bx, 1
    jz impars
    jmp pars
    impars:
    mov al, [si]
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    inc si
    cmp [si], 0
    mov bx, 0
    jz fin
    jmp conti
    pars:
    mov al, [di]
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    inc di
    cmp [di], 0
    mov bx, 1
    jz fin
    jmp conti
    conti:
    jmp mostrar
    
    fin:
    mov al, [di]
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
