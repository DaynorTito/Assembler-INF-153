; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    
    ; texto, simbolo $ al final
    hola db "hola$" 
    
    ; para imprimir un salto de linea
    enter db, 10, 13, 36
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
    
    ; reiniciar variables en 0 direccionamiento inmediato
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
    
    inc ax ; incrementa en 1
    dec ax  ; decrementa en 1   
    
    
    add ax, bx  ;adicionar/decrementar bx al registro ax
    add al, bh
    sub cx, dx  ; adiciona/decrementa subregistros
    sub bl, ah  ;
                
    
    ; Multiplicaciones/divisiones
    ; los resultados seimpre se almacenan en el registro ax
    ; Ejemplo multiplicacion ax*=bx
    
    mov ax, 5
    mov bx, 2
    mul bx   ; bx, cx, dx, el resultado siempre se almacena en ax
    ; para subregistros
    
    mov al, 5
    mov bl, 2
    mul bl    ; el resultado siempre se almacena en al
    
    ; Divisiones
    ; regsitros
    mov ax, 0
    mov dx, 0
    
    mov ax, 123
    mov bx, 10
    div bx   ; ax/=bx el rsto se almacena en dx
       ; sub regsitros
       
    mov al, 23
    mov bl, 10
    div bl ; el resto se va a la parte alta de la memoria
       ; y el cociente se almacena en bl
    
    
    
    ;Ciclos
    mov cx, 10 ; cantidad de iteraciones
    ciclo:
      ; codigo
      ; hola mundo
      lea dx, hola
      mov ah, 9
      int 21h ; interrupcion para: leer, mostrar, recibir datos
      
      ; imprimir salto de linea
      lea dx, enter
      mov ah, 9
      int 21h
      
    loop ciclo:
    
    ;Imprimir caracteres   
    
    mov dh, 0
    mov dl, 36     ; ascci $
    
    int 21h
    
                
    
    ; add your code here
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
               

