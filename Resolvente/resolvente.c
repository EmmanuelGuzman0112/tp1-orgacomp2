#include <stdio.h>
#include <ctype.h>

int F_RESOLVENTE(float var_x1, float var_x2, float var_x3);

int main()
{
    float var_x0;
    float var_x1;
    float var_x2;

    printf("Ingrese el valor de x^2 \n");
    scanf("%f", &var_x2);
    printf("El número que ingreso es: %f \n", var_x2);

    printf("Ingrese el valor de x^1 \n");
    scanf("%f", &var_x1);
    printf("El número que ingreso es: %f \n", var_x1);

    printf("Ingrese el valor de x^0 \n");
    scanf("%f", &var_x0);
    printf("El número que ingreso es: %f \n", var_x0);  

    F_RESOLVENTE(var_x2, var_x1, var_x0);

    return 0;
}