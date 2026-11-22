import java.util.Arrays;

/*  Esta función deberá separar los números negativos y positivos que hay dentro del array, 
    los negativos queden al principio y los positivos queden al final, pero manteniendo el orden  
    El array original no debe sufrir modificaciones. Ej.: [5, 2, -1, -2] -> [-1, -2, 5, 2] 
    [4, -5, 1, -8, 2, -1] -> [-5, -8, -1, 4, 1, 2]
*/

public class Main
{
    public static void main(String[] args)
    {
        int[] a = {5,2,-1,-2};
        int[] b = {4,-5,1,-8,2,-1};

        System.out.println(Arrays.toString(b));
        System.out.println(Arrays.toString(separaNegativosPositivos3(b)));
    }

    public static int[] separaNegativosPositivos(int[] a)
    {
        int i, j;
        int[] b = new int[a.length];

        j = 0;
        for(i = 0; i < a.length; i++) {
            if(a[i] < 0) {
                b[j] = a[i];
                j++;
            }
        }

        for(i = 0; i < a.length; i++) {
            if(a[i] >= 0) {
                b[j] = a[i];
                j++;
            }
        }
        return b;
    }

    public static int[] separaNegativosPositivos2(int[] a)
    {
        int i, j, temp;
        int[] b = a.clone();

        for(i = 0; i < b.length - 1; i++) {
            for(j = 0; j < b.length - 1; j++) {
                if (b[j] >= 0 && b[j+1] < 0) {
                    temp = b[j];
                    b[j] = b[j+1];
                    b[j+1] = temp;
                }
            }
        }
        return b;
    }

    public static int[] separaNegativosPositivos3(int[] a)
    {
        int[] b = new int[a.length];
        int i, j, p1, p2;

        i = 0;
        j = a.length-1;
        p1 = 0;
        p2 = a.length-1;

        while(p1 < p2) {
            if(a[i] < 0) {
                b[p1] = a[i];
                p1++;
            }

            if(a[j] >= 0) {
                b[p2] = a[j];
                p2--;
            }
            i++;
            j--;
        }
        return b;
    }
}
