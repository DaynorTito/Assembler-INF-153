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
   
    ; comparador en assembler
    ; realiza la resta de dos operadores sin afetar aninguno de esto
    mov cx, 4
    mov bx, 5
    cmp cx, bx
    ; si cx>bx entonces cf = 0 zf = 0
    ; si cx = bx entonces cf = 0 y zf = 1
    ; si cx<bx entonves cf = 1 y zf = 0
     
    
    jz igual
    jc menor
    ; jmp -> goto, ir a alguna etiqueta sin ninguna condicion
    igual:
         mov ax, 3
    menor:
         mov ax, 2
         
    ; stack o pila
    ; stack segment 702 / 712, stack pointer
    ; push para agregar valores a la pila
    ; pop para eliminar el ultimo elemento
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
