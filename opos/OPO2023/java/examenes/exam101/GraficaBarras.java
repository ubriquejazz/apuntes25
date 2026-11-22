/*  Escribe un programa al que le pasamos un array de enteros y nos  
    muestra una gráfica de barras HORIZONTAL por pantalla.
    Ej.: [4, 8, 9, 1, 5]
*/

public class GraficaBarras
{
    public static void main(String[] args)
    {
        int[] a = {4, 7, 3, 10, 3, 5};
        graficaBarras(a);
    }

    public static void graficaBarras(int[] a)
    {
        int i, j, max;
        max = maxArray(a);

        for (i=0; i< a.length; i++) {
            System.out.printf("%02d ",  a[i]);
            for (j=a[i]; j>0; j--) {
                System.out.print("█");
            }
            System.out.println("\n");
        } 
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