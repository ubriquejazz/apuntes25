import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/*  Escribe el programa a la que le pasamos un array que contiene resultados 
    de fútbol y nos devuelve un entero correspondiente a la mayor racha de 
    victorias seguidas. El array contendrá parejas de números de los cuales el primero
    serán los goles que ha marcado nuestro equipo y el segundo los goles que ha recibido
    El programa contará cuantas victorias consecutivas hay y nos devolverá la mayor racha.
*/

public class MejorRacha {

    public static final int PARTIDAS = 20;

    public static void procesa(int[][] tabla) {
        int racha =0, mejorRacha =0;
        int posNueva =0, posMejor =0;
        for (int i = 0; i < PARTIDAS; i++) {
            if ( tabla[i][0] > tabla[i][1] ) {
                posNueva = i;
                racha++;
            } 
            else {
                if (racha > mejorRacha) {
                    mejorRacha = racha;
                    posMejor = posNueva;
                }
                racha = 0;
            }
            // System.out.println(i + ": " + tabla[i][0] + " " + tabla[i][1] + " " + posMejor);
        }
        System.out.println("victorias consecutivas " + mejorRacha);
        System.out.println("posicion donde empieza " + (posMejor - mejorRacha + 1));
    }

    public static void main(String[] args) {
        int[][] tabla = new int[PARTIDAS][2];
        int i = 0;

        if (args.length != 1) {
            System.out.println("Este programa calcula la mejor racha en un fichero.");
            System.out.println("Uso del programa: java MejoraRacha FICHERO");
            System.exit(-1); // sale del programa
        }
        
        try {
            FileReader fr = new FileReader(args[0]);
            BufferedReader br = new BufferedReader(fr);
            String linea = br.readLine();
            while (linea != null) {
                String[] parte = linea.split("-");
                tabla[i][0] = Integer.parseInt(parte[0]);
                tabla[i][1] = Integer.parseInt(parte[1]);
                i = i+1;
                linea = br.readLine();
            } 
            br.close();
            procesa(tabla);

        } catch (IOException e) {
            System.out.println("Error de lectura.");
        }
    }

}