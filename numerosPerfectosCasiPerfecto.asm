; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key... $"
    perfecto db "Es un numero perfecto$"
    noperfecto db "NO es un numero perfecto$"
    casiperfecto db "Es un numero casi perfecto$"
    noescasipp db "No es un numero casi perfecto$"
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

    ciclo:
    mov ah, 1
        int 21h
    mov ah, 0
    cmp al, 13
    jz ciclosd
    sub ax, 30h
    mov cx, ax     
    mov ax, bx
    mov dx, 10
    mul dx
    mov bx, ax
    add bx, cx
    jmp ciclo
    
    ciclosd:
    push bx         
    mov ax, bx
    mov bx, 2
    div bx
    mov cx, ax
    pop ax
    mov bx, 0
    mov dx, 0
    jmp divisor
    
    iguales:
      push cx
      inc bx
    jmp continua
    
    divisor:
    push ax
    div cx
    cmp dx, 0
    pop ax
    jz iguales
    
    continua:
    mov dx, 0
    loop divisor
    
    mov cx, bx
    mov bx, 0
    mostrar:
      mov dx, 0
      pop dx
      add bx, dx
    loop mostrar
    cmp ax, bx
    jz igual
    mov cx, bx
    dec bx
    cmp ax, bx
    jz escasipp
    inc cx
    cmp ax, cx
    jz escasipp
    jmp noescasippp
    
    
    ;cmp ax, bx
    
    ;jz igual
    ;jmp noigual
    igual:
    lea dx, perfecto
    mov ah, 9
    int 21h        ; output string at ds:dx
    jmp fin
    
    ;noigual:
    ;lea dx, noperfecto
    ;mov ah, 9
    ;int 21h
    
    
    escasipp:
    lea dx, casiperfecto
    mov ah, 9
    int 21h
    jmp fin
    
    noescasippp:
    lea dx, noescasipp
    mov ah, 9
    int 21h
    
    fin:
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
