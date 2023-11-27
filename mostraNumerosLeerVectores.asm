; multi-segment executable file template.

data segment
    ve db 0,0,0,0,0,0,0,0,0,0
    vc db 0,0,0,0,0,0,0,0,0,0
    enter db 10, 13, 36
    num db 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:                   

    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov di, offset vc
    mov si, offset ve
    otro:
    mov ax, 0
    mov cx, 0
    mov bx, 0
    mov dx, 1
    ciclo:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 32
    jz ciclosd
    cmp al, 13
    jz finlec
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
    mov [si], bl
    inc si
    inc [di]
    jmp otro
    finlec: 
    mov [si], bl
    inc si
    inc [di]
    
    mov cx, 0
    mov cl,[di]
    push cx
    mov [di], 0
    
    
    lea dx, enter
    mov ah, 9
    int 21h      
    
    mov di, offset vc
    otro2:
    mov ax, 0
    mov cx, 0
    mov bx, 0
    mov dx, 1
    ciclo2:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 32
    jz ciclosd2
    cmp al, 13
    jz finlec2
    mov ah, 0
    sub ax, 30h
    mov cx, ax     
    mov ax, bx
    mov dx, 10
    mul dx
    mov bx, ax
    add bx, cx
    jmp ciclo2
    ciclosd2:
    mov [di], bl
    inc di
    jmp otro2
    finlec2: 
    mov [di], bl
    inc di   
    mov ax, 0
    mov cx, 0
    mov bx, 0
    mov dx, 0
    
    pop cx
    
    mov si, offset num
    mov [si], cl  
    mov si, offset ve
    mov di, offset vc
    
    add di, cx
    
    dec di
    mov ax, 0
    mov bx, 0
    push bx
    mov dx, 0
    multip: 
    mov al, [si]
    inc si
    mov bl, [di]
    dec di
    mul bx
    mov bx, cx
    pop cx
    add cx, ax
    push cx
    mov ax, 0
    mov cx, bx
    loop multip
    mov al, [si]
    inc si
    mov bl, [di]
    dec di
    mul bx
    mov bx, cx
    pop cx
    add cx, ax
    push cx
    mov ax, 0
    mov cx, bx
    
    pop bx
    ; -----------
    lea dx, enter
    mov ah, 9       
    int 21h
    
    mov ax, 0
    mov cx, 0
    mov dx, 0
    
    mov ax, bx
    mov bx, ax
    mov cx, bx
    mov si, offset num
    mov [si], 0
    ciclosdd:
      mov dx, 0
      mov ax, bx
      mov bx, 10
      cmp ax, 10
      jc menor
      div bx
      inc [si]
      mov bx, ax
      add dl, 48
      mov bx, ax
      mov dh, 0
      push dx
    loop ciclosdd
    
    
    menor:
    add al, 48 
    mov ah, 0
    push ax
    inc [si]
    mov cl, [si]
    
    
    mostrar3: 
    mov ax, 0
    pop ax
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    loop mostrar3
    
    
    mov ax, 4c00h ; exit to operating system.
        int 21h    
ends

end start ; set entry point and stop the assembler.
