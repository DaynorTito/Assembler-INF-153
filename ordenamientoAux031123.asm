; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    v db 2, 1, 4, 3 
    vf db "$" 
    enter db 10, 13, 36
    
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

    lea si, v
    ciclo:
    
    mov di, si 
    inc di
    ciclo2:
    mov bl, [si]
    mov bh, [di]
    cmp bh, bl
    jc cambiar
    jmp continuar
    cambiar:
    mov [si], bh
    mov [di], bl
    continuar:
    inc di
    cmp [di], "$"
    jz sigE
    jmp ciclo2
    
    sigE:
    add si, 2
    cmp [si], "$"
    jz finordenamiento
    dec si
    jmp ciclo
    finordenamiento:
    
    lea si, v
    mostrar:
    
    mov dl, [si]
    add dl, 30h
    mov ah, 2
    int 21h    
    inc si
    cmp [si], "$"
    jz fin
    jmp mostrar
    
    fin:
    
    lea dx, enter
    mov ah, 9
    int 21h
             
    lea si, v
    ciclo3:
    
    mov di, si 
    inc di
    ciclo23:
    mov bl, [si]
    mov bh, [di]
    cmp bh, bl
    jnz cambiar3
    jmp continuar3
    cambiar3:
    mov [si], bh
    mov [di], bl
    continuar3:
    inc di
    cmp [di], "$"
    jz sigE3
    jmp ciclo23
    
    sigE3:
    add si, 2
    cmp [si], "$"
    jz finordenamiento3
    dec si
    jmp ciclo3
    finordenamiento3:
    
    lea si, v
    mostrar3:
    
    mov dl, [si]
    add dl, 30h
    mov ah, 2
    int 21h    
    inc si
    cmp [si], "$"
    jz fin2
    jmp mostrar3
    
    fin2:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
