# tp1-orgacomp2
# TP I - Resolvente en ASM + ejercicios obligatorios

## Resolvente
Indicaciones para utilizar el programa.
El usuario tendra que ejecutar por bash el archivo "ejecutable" de la siguiente forma:
./ejecutable


Luego, tendra que ingresar un numero entero o decimal para x1, x2 y x3 (EN ESE ORDEN) y teclear enter.
Aclaracion: si el usuario ingresa un entero, este se convertira en decimal (respectando su valor), por ejemplo ingresa 10, el programa le mostrara por pantalla que ingreso 10.000000


Por ultimo, al terminar de ingresar el numero para x3, el programa mostrara los resultados:

  El resultado x1 es "resultado"
  
  El resultado x2 es "resultado"


Un ejemplo de ejecucion
  "Ingrese el valor de x^2"
  -5
  "El numero que ingreso es: -5.000000"
  "Ingrese el valor de x^1"
  7.5
  "El numero que ingreso es: 7.500000"
  "Ingrese el valor de x^0"
  4
  "El numero que ingreso es: 4.000000"
  
  "El resultado x2 es -0.417262"
  "El resultado x1 es 1.917262"
  
  
(Ademas, voy a dejar una captura de pantalla con el programa corriendo con este ejemplo)
Los comandos que utilice para compilar son:
  nasm -f elf32 resolvente.asm -o resolvente.o
  gcc -m32 resolvente.c resolvente.o -o ejecutable
  ./ejecutable
  
  
Comentarios de como realice el ejercicio:
  Primero resolvi 2xa y lo guarde en una variable resultadoDenominador.
  Segundo resolvi el contenido de la raiz: primero -4*a*c y luego bxb.
  Tercero calcule la raiz cuadratica y lo guarde en una variable resultadoCuadratica.

  Ultimos dos pasos:
    Calculo x2 de esta manera: (-b + resultadoCuadratica) / resultadoDenominador y lo guardo en la variable resultadoConMas y muestro en pantalla.
    Calculo x1 de esta manera: (-b - resultadoCuadratica) / resultadoDenominador y lo guardo en la variable resultadoConMenos y muestro en pantalla.
  


## La carpeta "Ejercicios obligatorios" contiene los ejercicios pedidos:
○ Ejercicio 4 - Gestión de memoria.
○ Ejercicio 6 - Gestión de memoria.
○ Ejercicio 7 - Gestión de memoria.
○ Ejercicio 4 - FPU.
