/*  Escribe un programa al que le pasamos un array de enteros y nos  
    muestra una gráfica de barras VERTICAL por pantalla.
    Ej.: [4, 8, 9, 1, 5]
*/

public class Main
{
    public static void main(String[] args)
    {
        int[] a = {4, 7, 3, 1, 1, 3, 5};
        graficaBarras(a);
    }

    public static void graficaBarras(int[] a)
    {
        int i, j, max;
        max = maxArray(a);

        for (i = max; i > 0; i--) {
            for (j = 0; j < a.length; j++) {
                if (a[j] >= i) {
                    System.out.print("█ ");
                }
                else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }

        for(j = 0; j < a.length; j++) {
            System.out.print(a[j] + " ");
        }
        System.out.println();
    }

    private static int maxArray(int[] a)
    {
        int max = a[0];
        for(int i=1; i<a.length; i++) {
            if(a[i] > max) {
                max = a[i];
            }
        }
        return max;
    }
}
