import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/*  Le pasamos un array bidimensional que contendrá enteros y nos devuelve un entero. 
    El array representará un tablero del juego Conecta 4 (pero lo vamos a hacer con 3)
    - las fichas del jugador 1 se representan con el número 1, 
    - las del jugador 2 con el número 2, 
    - las casillas no ocupadas, con un 0.
    
    Las líneas se podrán conseguir en horizontal o en vertical (no diagonales).
    Se supone que no van a ganar dos jugadores a la vez, así que no tenéis que comprobar 
    este escenario (comprobad primero un jugador y si ése ya gana, pues ya dais el resultado; 
    si no gana, pues ya comprobáis el otro).
*/

public class ConectaTres {

    public static final int N = 3;

    public static void pintaFila(int[] fila) {
        for (int i=0; i< N; i++) {
            System.out.print(" " + fila[i]);
        }
        System.out.println();
    }

    public static void pinta(int[][] tabla) {
        for (int i = 0; i < N; i++) {
            pintaFila(tabla[i]);
        }
    }

    public static int procesaFila(int[] fila, int user) {
        int result = 0;
        for (int i = 0; i < N; i++) {
            if ( (fila[0] == user) && (fila[1] == user) && (fila[2] == user))
                result = user;
        }
        return result;
    }

    public static int procesa(int[][] tabla, int user) {
        int result = 0;
        for (int i = 0; i < N; i++) {
            //pintaFila(tabla[i]);
            result += procesaFila(tabla[i], user);
        }

        int[] col = new int[N]; // recorro por columnas
        for (int j = 0; j < N; j++) {
            for (int i = 0; i < N; i++) {
                col[i] = tabla[i][j];
            }
            //pintaFila(col);
            result += procesaFila(col, user);
        }
        return result;
    }

    public static void main(String[] args) {
        int[][] tabla = new int[N][N];
        int i = 0;

        if (args.length != 1) {
            System.out.println("Este programa simula el conecta4 de un fichero.");
            System.out.println("Uso del programa: java ConectaTres FICHERO");
            System.exit(-1); // sale del programa
        }

        try {
            FileReader fr = new FileReader(args[0]);
            BufferedReader br = new BufferedReader(fr);
            String linea = br.readLine();
            while (linea != null) {
                
                String[] parte = linea.split(";");
                tabla[i][0] = Integer.parseInt(parte[0]);
                tabla[i][1] = Integer.parseInt(parte[1]);
                tabla[i][2] = Integer.parseInt(parte[2]);
                i = i+1;
                linea = br.readLine();
            } 
            br.close();
            pinta(tabla);

            if (procesa(tabla,2) == 2)
                System.out.println ("Gana el jugador 2");
            else if (procesa(tabla,1) == 1)
                System.out.println ("Gana el jugador 1");
            else
                System.out.println ("La partida queda en empate");
        } 
        catch (IOException e) {
            System.out.println("Error de lectura.");
        }
    }
}