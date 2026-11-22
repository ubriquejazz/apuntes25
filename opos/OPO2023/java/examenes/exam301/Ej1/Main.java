import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/*  Sopa de letras: crea una matriz siempre que las dimensiones sean cuadradas 
    SONIAMDIAAJ
    REMIAJOLORS
    SEROLODGCIW
    CARMENZSUOJASDJALDJAD
    LAURAQPLXHC
*/

public class Main
{
    private static void escribeArrayBi(char[][] sopa){
        for(int i=0;i<sopa.length;i++) {
            System.out.println(Arrays.toString(sopa[i]));
        }
    }

    public static void main(String[] args){
        char[][] sopa = leeSopaLetras(args[0]);
        escribeArrayBi(sopa);
    }

    private static char[][] leeSopaLetras(String fichero)
    {
        List<String> lineas = new ArrayList<>();
        String linea;

        try {
            FileReader fr = new FileReader(fichero);
            BufferedReader br = new BufferedReader(fr);
            linea = br.readLine();
            while (linea != null) {
                lineas.add(linea);
                linea = br.readLine();
            }
            br.close();
            fr.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        // lineas is already populated from the file
        boolean ok = true;
        char[][] sopa;

        int filas = lineas.size();
        int columnas = lineas.get(0).length();

        for (int i = 1; i < filas; i++) {
            if (lineas.get(i).length() != columnas) {
                ok = false;
                i = lineas.size();
            }
        }

        if(ok) {
            sopa = new char[filas][columnas];
            for(int i = 0; i < filas; i++) {
                for(int j = 0; j < columnas; j++) {
                    sopa[i][j] = lineas.get(i).charAt(j);
                }
            }
        }
        else {
            sopa = new char[0][0];
        }
        return sopa;
    }
}
