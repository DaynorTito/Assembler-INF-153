
data segment
    ; add your data here!
    pkey db "press any key...$"
    
    v db 0,0,0,0,0,0,0,0,0,0
    
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
    mov ah, 0
    sub ax, 30h
    push ax
    inc [si]
    mov cx, ax     
    mov ax, bx
    mov dx, 10
    mul dx
    mov bx, ax
    add bx, cx
    jmp ciclo
    ciclosd:
               
    mov cx, 0
    mov cx, [si]
    dec cx
    mov ax, 0
    mov bx, 0
    mov dx, 0
    pop ax
    mov si, offset v
    mov [si], 0
    contar:
      pop bx 
      cmp bx, ax
      jz igual
      jmp continua
      igual:
      inc [si]
      continua:
      mov ax, bx 
    loop contar
    
    mov cx, 0
    mov cl, [si]
    
    add cx, 48 
    
    lea dx, enter
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dh, 0
    mov dl, cl
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
