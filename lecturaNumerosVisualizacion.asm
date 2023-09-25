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
    ; poner en bx el valor en haxadeciaml del valor que se esta leendo

    ;leer un numero de varias cifras, leer caracteres
    ;   hasta que se introduzca un enter  
    ; cuando el al sea 0b acabara la lectura
    mov ax, 0
    mov cx, 0
    mov bx, 0
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
    mov ax, bx
    mov bx, ax
    mov cx, bx
    ciclosdd:
      mov dx, 0
      mov ax, bx
      mov bx, 10
      cmp ax, 10
      jc menor
      div bx
      
      mov bx, ax
      add dl, 48
      mov bx, ax
      mov ah, 2
      mov dh, 0
      mov dl, dl
      int 21h
    loop ciclosdd
    
    
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
