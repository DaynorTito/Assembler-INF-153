; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "FIN DEL PROGRAMA $"
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
              
    ; para multiplicar dos resgitros
    ; el resultado estara en AX
    ; se multiplicara con otro registro con MUL
    ; si se realiza ena multiplicacion muy grande
    ;   ax se reiniciara en 0 y la parte desbordada esta en DX          
    mov ax, 65538
    mov bx, 5
    mul bx
    
    
    ; para la division de dso resgitros
    ; el dividendo debe estar en AX y e divisor debe estar en Otro resgitro
    ; dividir con mul, (divisor)
    ; al manejar 8 bits, asegurarse de que la parte alta este en 0, bh para residuo, bl para divison
    ;   el resto de la division entre registros el residuo se almacena en DX
    ; SI la division es en subregsitros el residuo ya no estara en DX
    mov ax, 16
    mov bx, 3
    div bx  
    
    ; para simular un if, se usa cmp registro, valor o registro
    ; jc menor
    ; jz iguales
    ; jnz mayor
    
    cmp ax, bx
    ; la comparacion activa a las etiquetas y despues se pueden modificar los valores
    ;  sin importar que ahora los valores no sean iguales
    jz menor
    jnz mayor
    ; si el flujo llega aqui los los vaores son iguales
    jc iguales    
    ; aqui e flujo nunca llegara
    menor:
      lea dx. pkey
      mov ah, 9
      int 21h 
      jmp finProg
    
    mayor:
      lea dx. pkey
      mov ah, 9
      int 21h 
      jmp finProg
      
    iguales:
      lea dx. pkey
      mov ah, 9
      int 21h 
      jmp finProg
      
    ; al final de cada etiqueta se debe de poner jum etiqueta
     
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
