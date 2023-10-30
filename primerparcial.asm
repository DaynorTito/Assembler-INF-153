; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    v db 0, 0, 0, 0, 0, 0, 0, 0, 0
    
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

    ; leer un numero N 0<N<1000
    ; e imprinir los primeros 66 digistos de
    ; 1/N
    
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 1
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
    
    mov cx, 0
    push bx
    
    mov dx, 0
    mov ax, 1
    
    div bx
    
    mov bx, ax
    ; dx el resto
    push dx
    mov cx, 66  
    
    imprime:
      pop bx
      
      mov dx, 0
      
       
      mov ax, bx
      mov bx, 10
      mul bx
      mov bx, ax 
      

      mov dx, 0
      mov ax, bx
      pop bx
      div bx
      push bx
      push dx
      
      add al, 48
      mov ah, 2
      mov dh, 0
      mov dl, al
      int 21h
      
      mov al, 32
      mov ah, 2
      mov dh, 0
      mov dl, al
      int 21h
        
    loop imprime  
      
     
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.     

