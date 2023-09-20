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

    ; asignar un valor a bx para luego imprimir en pantalla
    mov bx, 655 
    
                    
    mov ax, bx
    mov bx, ax
    mov cx, 3
    ciclo:
        mov ax, bx
        mov bx, 10   
        div bx
        mov bx, ax
        ;add dl, 48
        ;mov bx, ax
        ;mov ah, 2
        ;mov dh, 0
        ;mov dl, dl
        ;int 21h
    loop ciclo
    
    menor:
    add al, 48
    mov ah, 2
    mov dh, 0
    mov dl, al
    int 21h 
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
