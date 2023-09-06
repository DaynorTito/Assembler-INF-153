; imprimir ña serie fibonacci en letras sinedo a=0, b=1, c=2, ... , z=25
; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key..."
    mensaje db "este es un nuevo CICLO",13,10,"$"
    espacio db " ",13,10,"$"
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
     
    mov al, 1
    int 21h
     
    mov cl, al
    
    
    mov al, 0   ; a
    mov bh, 1     ; b
    mov bl, 0     ; c    
    
   ciclo:
   add al, 65
   mov ah, 2      
   mov dh, 0
   mov dl, al
   int 21h        ; output string at ds:dx
   sub al, 65
   mov bl, al
   add bl, bh
   mov al, bh
   mov bh, bl
             
   loop ciclo
      
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
