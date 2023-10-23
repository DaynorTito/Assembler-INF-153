; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    v db 0,0,0,0,0,0,0,0,0
    
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

    ;de 1 hasta 9 digitos,imprimelos residuos
     ; para leer un numero de varios digitos
     
     
     
    mov si, offset v
   
     
    mov ax, 0
    mov [si], 0 
    inc si
    push ax
    seguir:
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
    jz finlectura
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
    mov ax, 0
    pop ax
    cmp ax, 0
    jz primera
    jmp luego
    primera:
    push bx
    jmp seguir
    luego:
    mov cx, 0
    mov dx, 0
    push bx
    cmp ax, bx
    jc menor
    jmp mayor
    menor:
    mov cx, ax
    mov ax, bx
    mov bx, cx
    div bx
    jmp print
    mayor:
    div bx
    print:
           
           
           
    mov al,dl
    mov [si],al
    inc si
    
    
    jmp seguir  
        
    finlectura:
    mov cx, 0
    mov dx, 0
    cmp ax, bx
    jc menorf
    jmp mayorf
    menorf:
    mov cx, ax
    mov ax, bx
    mov bx, cx
    div bx
    jmp printf
    mayorf:
    div bx
    printf: 
    
    mov al,dl
    mov [si], al
    inc si
    
   
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
