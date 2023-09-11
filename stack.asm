; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    
    ; texto, simbolo $ al final
    hola db "hola$"
    
    linea db 10, 13, 36 
    
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
    
    ; leer n entre 3 y 9
    ; lee n caacteres e imprimirlos invertidos
    mov ah, 1 ; siempre se lee en al
    int 21h
    sub al, 30h
    
    mov bl, al
    ; en al esta el numero leido
    mov cx, ax
    mov ch, 0
    mov dx, cx
    
    ciclo:
       lea dx, linea
       mov ah, 9
       int 21h
       
       mov ah, 1
       int 21h
       sub ah, 30h 
       
       add ax, 4
       push ax
       
    loop ciclo
        
    lea dx, linea
       mov ah, 9
       int 21h
    mov cl, bl
    mov ch, 0
    ciclos:
      mov bx, 0
      pop bx
      sub bl, 4
      mov ah, 2
      mov dh, 0
      mov dl, bl
      int 21h
      
    loop ciclos
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
