%include "io.inc"

section .data
puntero dd 3333.0, 1.5, 2.8, 4.4
lenArrayNumbers dq 4

resultado dq 0.0
formato db "El resultado: es %f", 10, 0  

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov edx, puntero ;EDX sera el puntero al vector

    push dword[lenArrayNumbers]
    push edx 
    
    call SUMA_VF
    add esp, 8
    
    ;Muestro el resultado
    push dword [eax+4]
    push dword [eax]
    push formato
    call printf
    add ESP, 12
    ;
    
    ret
    
SUMA_VF:
    ;ENTER
    push ebp
    mov ebp, esp

    mov edx, [ebp + 8];
    mov eax, [ebp + 12];  
    
    
    FLD dword[edx]
    
    TOP:
        add  edx,4 ;Muevo el puntero al siguiente num
        FLD dword[edx]
        FADDP       
        
        sub  eax, 1 ;Decremento el puntero
        jnz  TOP;Si el puntero no es cero, sigo el loop

    FIN: 
        FST qword[resultado]

mov eax, resultado;MUEVO EN EAX PARA DEVOLVER EL RESULTADO

;LEAVE
mov ebp, esp 
pop ebp

ret
