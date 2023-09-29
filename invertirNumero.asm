; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$" 
    enter db 10,13,36
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
       mov ah, 1
       int 21h
       cmp al, 13
       jz finum
       sub al, 30h
       mov ah, 0
       push ax
       inc cx
    jmp ciclo
    ; el numero estara en dw num
    finum:
        lea dx,enter
        mov ah, 9
        int 21h
    
    mostrar:
       pop bx
       mov al, bl
       add al, 48
       mov ah, 2
       mov dh, 0
       mov dl, al
       int 21h
    loop mostrar
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
