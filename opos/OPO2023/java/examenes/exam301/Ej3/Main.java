import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

// detecta datos consecutivos en un array usando listas

public class Main
{
    public static void main(String[] args)
    {
        int[] array1 = {1,2,3,3,3,1,2,4,4,4,4,4,1,2,3,3,3,3,2,1,1,1};
        int[] array2 = detectaConsecutivos(array1);
        System.out.println(Arrays.toString(array1));
        System.out.println(Arrays.toString(array2));
    }

    private static int[] detectaConsecutivos(int[] array)
    {
        List<Integer> lista = new ArrayList<>();
        int[] resultado;
        int n = array[0];
        int veces = 1;

        for (int i = 1; i < array.length; i++) {
            if (array[i] == n) {
                veces++;
                if (veces == 3) {
                    lista.add(n);
                }
            }
            else {
                n = array[i];
                veces = 1;
            }
        }

        resultado = new int[lista.size()];
        for (int i = 0; i < lista.size(); i++) {
            resultado[i] = lista.get(i);
        }
        return resultado;
    }
}

