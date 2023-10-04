; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    v db 0,0,0,0,0, 0
    salto db 10, 13, 36    
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
    
    mov ax, 0
    push ax
    mov cx, 0
    mov bx, 0
    mov dx, 1
    mov si, offset v
    ciclo:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 13
    jz ciclosd
    mov ah, 0
    sub ax, 30h
    mov [si], al
    inc si
    mov cx, ax     
    mov ax, bx
    mov dx, 10
    mul dx
    mov bx, ax
    add bx, cx
    pop ax
    inc ax
    push ax
    jmp ciclo
    ciclosd:
    lea dx, salto
    mov ah, 9
    int 21h
    mov dx, 0
    mov ax, 0
    pop cx
    push cx
    mov ax, 0
    push ax
    lea si, v
    jmp mostrar
    par:
       ;suma
       pop dx
       mov ah, 0
       add dx, ax
       push dx
       jmp continua
    mostrar:
      mov al, [si]
      inc si
      
      push ax
      mov dx, 0
      mov bx, 2
      mov ax, cx
      div bx
      cmp dx, 1
      pop ax
      jz par
      continua:
    loop mostrar
    
    mov ax, 0
    pop ax
    add al, 48
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    
    lea dx, salto
    mov ah, 9
    int 21h
    
    pop cx
    push cx
    mov ax, 0
    push ax
    mov bx, 0
    mov dx, 0
    lea si, v
    jmp impares
    impar:
    mov ah, 0
    mov dx, 0
    pop dx
    add dx, ax
    push dx
    jmp sigue
    impares:
     mov al, [si]
      inc si
      
      push ax
      mov dx, 0
      mov bx, 2
      mov ax, cx
      div bx
      cmp dx, 0
      pop ax
      jz impar
     sigue:
    loop impares
    
    mov ax, 0
    pop ax
    add al, 48
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h
    
    lea dx, salto
    mov ah, 9
    int 21h
   
    
    
    mov ax, 0
    mov bx, 0
    mov dx, 0
    
    
    
    
    
    
    
    
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
