; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key..."
    mensaje db "este es un nuevo CICLO",13,10,"$"
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

    ; add your code here 
    mov cx, 5
  ciclo:
              
    lea dx, mensaje
    mov ah, 9
    int 21h        ; output string at ds:dx
    loop ciclo
      
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
