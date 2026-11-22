#include <stdio.h>
#include <conio.h>

void P1(int);

void main()
{
    clrscr();
    P1(6);
    getch();
}

void P1(int a)
{
    if (a>0) {
        printf("%d\n", a);
        P1(a-1);
    }
    else
        printf("Fin1, ");
    printf("%d\n", a);
    printf("Fin2\n");
}

/*  Cuál será la salida por pantalla al invocar dicho método
    6, 5, 4, 3, 2, 1, Fin, 0, Fin1
    1, Fin2, 2, Fin2, 3, Fin2, 4, Fin2, 5, Fin2, 6, Fin2
*/

/*  Procedimiento recursivo necestia :
        1. Caso base: condicion para salir recursividad
        2. Resolucion caso base (a > 0)
        3. Progreso: no mismo valor en cada llamada P1(a-1)

    Iteracion   a       Imprimir    Pila(*)
    P1(6)       6       6           P1(6)
    P1(5)       5       5           P1(5), P1(6)
    P1(4)       4       4           P1(4), P1(5), P1(6)
    P1(3)       3       3           P1(3), P1(4), P1(5), P1(6)
    P1(2)       2       2           P1(2), P1(3), P1(4), P1(5), P1(6)
    P1(1)       1       1           P1(1), P1(2), P1(3), P1(4), P1(5), P1(6)
    P1(0)       0       Fin, 0
                        Fin de verdad
*/