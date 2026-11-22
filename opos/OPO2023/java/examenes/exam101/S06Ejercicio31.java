import java.util.Scanner;

/*  Realizar un programa que simule el juego de los dados.
    Si en la primera tirada obtienes un 7, ganas la partida y doblas 
    tu apuesta pero si obtienes un 7 pierdes todo el dinero apostado:
    En otro caso tienes que seguir tirando, hasta conseguir el número 
    obtenido en la primera tirada (ni 3, ni 7). Si en algún momento 
    obtienes un 7, perderás la partida automáticamente
*/

import java.util.Scanner;
import java.util.Random;

public class S06Ejercicio31 {

    private static int TirarDados(Random rdm) {

        int dado1 = (int) (rdm.nextInt(6) + 1);
        int dado2 = (int) (rdm.nextInt(6) + 1);
        int suma = dado1 + dado2;

        System.out.println("Dado 1: " + dado1);
        System.out.println("Dado 2: " + dado2);
        System.out.println("Suma: " + suma); 
        return suma; 
    }

    public static void main(String[] args) {

        Scanner s = new Scanner(System.in);
        System.out.print("Cuanto dinero quiere apostar? ");
        int dinero = Integer.parseInt(s.nextLine());

        // Math.random() * 6 + 1
        Random rdm = new Random();
        int suma = TirarDados (rdm);

        switch (suma) {
        case 3:
            System.out.println("¡Enhorabuena! ¡Ha ganado otros " + dinero + " €!");
            System.out.println("¡Ahora tiene " + dinero * 2 + " €!");
            break;
        case 7:
            System.out.println("Lo siento, ha perdido todo su dinero 😢");
            break;
        default:  
            System.out.print("Tiene que seguir tirando, debe conseguir el ");
            System.out.println(suma + " para ganar.");
            System.out.println("Si obtiene un 7, perderá la partida.");
            System.out.println("Pulse INTRO para tirar los dados.");
            s.nextLine();        
            boolean partidaTerminada = false;
            do {
                int nuevaSuma = TirarDados(rdm);
                if ((nuevaSuma) == suma) {
                    System.out.println("Enhorabuena! Ha ganado otros " + dinero + " euros!");
                    System.out.println("Ahora tiene " + dinero * 2 + " euros!");
                    partidaTerminada = true;
                }      
                else if (nuevaSuma == 7) {
                    System.out.println("Lo siento, ha perdido todo su dinero 😢");
                    partidaTerminada = true;
                }
                // else if (nuevaSuma == 3)
                // entiendo que esa opcion no tiene sentido
                else {
                    System.out.println("Continúe jugando.");
                    System.out.println("Pulse INTRO para tirar los dados.");
                    s.nextLine();
                }
            }  while(!partidaTerminada);   // partidaTerminada == true

            break;
        }
    }

}
