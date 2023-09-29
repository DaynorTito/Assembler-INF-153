; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    var dw 2
    num dw 0
    
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

    ; para leer un numero de varios digitos
    mov bx, 10
    mov ax, 0
    mov cx, 0
    ciclo:
       mov num, ax
       mov dx, 0
       mov ah, 1
       int 21h
       cmp al, 13
       jz finum
       sub al, 30h
       mov cl, al
       mov ax, num
       mul bx
       add al, cl
    jmp ciclo
    ; el numero estara en dw num
    finum:

    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
