; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
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
    mov cx, 0
    mov bx, 0
    mov dx, 1
    push bx
    ciclo:
    mov ax, 0
    mov ah, 1
    int 21h
    cmp al, 13
    jz ciclosd
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
    mov ax, bx
    mov bx, 10
    mov cx, 10
    
    obtener:
    mov dx, 0
    cmp ax, bx
    jc findiv
    div bx
    push dx
    loop obtener
    
    findiv:
    push ax
    mov bx, 10
    sub bx, cx
    mov cx, bx
    mov ax, 0
    mov bx, cx
    mov dx, 0
    pop ax
    cmp cx, 0
    jz mostrarax
    
    componer:
    pop bx
    
    ;ver si el digito bx, esta en ax
    push ax
    push cx
    push bx
    mov cx, 10
    mov bx, 10
    descomp:
      mov dx, 0
      cmp ax, 10
      jc findes
      div bx
      pop bx
      cmp dx, bx
      pop cx
      pop ax
      jz siesta
      jmp noesta
    loop descomp:
    findes:
    pop bx
    cmp ax, bx
    pop cx
    pop ax
    jz siesta
    jmp noesta
    noesta:
    push bx
    mov bx, 10
    mul bx
    pop bx
    add ax, bx
    siesta:
    loop componer
    
    mostrarax:
    mov bx, ax
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
