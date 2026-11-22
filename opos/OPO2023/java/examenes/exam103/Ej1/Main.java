/*  La función deberá imprimir por pantalla los elementos sean comunes a los tres arrays
    es decir, que estén en el primero y también en el segundo y también en el tercero.
*/
public class Main {

    public static void main(String[] args)
    {
        int a1[] = {1,3,3,5,7};
        int a2[] = {2,3,3,3,3,4,5,6,7};
        int a3[] = {1,2,3,3,3,3,4,5};
        elementosComunes3(a1, a2, a3);
    }

    public static void elementosComunes3(int[] a, int[] b, int[] c) {
        for (int i = 0; i < a.length; i++) {
            if (contieneElemento(b, a[i]) && contieneElemento(c, a[i])) {
                System.out.println(a[i]);
            }
        }
    }

    public static boolean contieneElemento(int[] a, int elemento) {
        int i;
        boolean esta = false;
        for(i = 0; i < a.length; i++)
        {
            if(a[i] == elemento) {
                esta = true;
                i = a.length;
            }
        }
        return esta;
    }
}
