;%include "io.inc"

extern printf

section .data

var_a dd 5.7
var_b dd -7.0
var_c dd -5.5


resultadoCuadratica dq 0.0
resultadoDenominador dq 0.0
MenosUno dw -1
MenosCuatro dw -4
Dos dw 2
formato_x1 db "El resultado x1 es %f", 10, 0   
formato_x2 db "El resultado x2 es %f", 10, 0   

resultadoConMas dq 0.0
resultadoConMenos dq 0.0

section .text
;global CMAIN
global F_RESOLVENTE
;CMAIN:
    mov ebp, esp; for correct debugging
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
F_RESOLVENTE:
;ENTER
push ebp
mov ebp, esp
    
    fld dword[ebp + 8]
    FST dword[var_a]
    
    fld dword[ebp + 12]
    FST dword[var_b]
    
    fld dword[ebp + 16]
    FST dword[var_c]    
    
    ;A PARTIR DE ACA    
    ;CALCULO 2*a
    mov eax, Dos
    fild word[eax]    
    mov eax, var_a
    fld dword[eax]
    
    fmulp st1
    FST qword[resultadoDenominador]

    
    ;CALCULO -4*a*c
    fild word [MenosCuatro]
    mov eax, var_a
    fld dword[eax]
    
    mov eax, var_c
    fld dword[eax]
    
    fmulp st1 ;Mult a y c
    
    fmulp st1 ;Mult (a*c) y -4
        
    
    ;calculo b al cuadrado
    mov edx, var_b    
    FLD dword[edx]
    FLD dword[edx]    
    FMULP st1
    
    faddp st1 ;Resto (b al cuadrado) y (-4*a*c)
    
    fsqrt ;Raiz cuadrada

    FST qword[resultadoCuadratica]


    ;CALCULO (-b + resultadoCuadratica) / resultadoDenominador 
    mov eax, MenosUno
    fild word[eax]
    mov edx, var_b    
    FLD dword[edx]
    FMULP st1
    
    FADDP st1;SUMO(-b y resultadoCuadratica)
    
    FLD QWORD[resultadoDenominador] ;
    fdivp st1;(-b + resultadoCuadratica) / resultadoDenominador
    
    FST qword[resultadoConMas]
    ;AUX;muestro por pantalla
    mov eax, resultadoConMas;
    push dword [eax+4]
    push dword [eax]
    push formato_x2
    call printf
    add ESP, 12
    
    ;CALCULO (-b - resultadoCuadratica) / resultadoDenominador   
    mov eax, MenosUno
    fild word[eax]
    mov edx, var_b    
    FLD dword[edx]
    FMULP st1
    
    FLD QWORD[resultadoCuadratica] ;    
    FSUBP st1;SUMO(-b y resultadoCuadratica)
    FLD QWORD[resultadoDenominador] ; 
    fdivp st1;(-b + resultadoCuadratica) / resultadoDenominador
    
    FST qword[resultadoConMas]
    ;AUX;muestro por pantalla
    mov eax, resultadoConMas;
    push dword [eax+4]
    push dword [eax]
    push formato_x1
    call printf
    add ESP, 12    
    
;LEAVE
mov ebp, esp 
pop ebp

ret
    