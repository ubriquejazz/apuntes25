import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Test {

    //atributos
    private List<Pregunta> preguntas;
    private int puntosTotales;
    private int preguntaActual;

    //Constructor
    public Test() {
        preguntas = new ArrayList<>();
        puntosTotales = 0;
        preguntaActual = 0;
    }

    //Getter
    public List<Pregunta> getPreguntas() {
        return preguntas;
    }

    public int getPreguntaActual() {
        return preguntaActual;
    }

    public int getPuntosTotales() {
        return puntosTotales;
    }

    public Pregunta siguientePregunta() {
        //cojo la siguiente pregunta, si es distinto de null, paso la siguiente
        Pregunta p = preguntas.get(preguntaActual);
        if (p != null) {
            preguntaActual++;
        }
        return p;
    }

    public void reiniciarTest() {
        preguntaActual = 0;
        puntosTotales = 0;
    }

    public void realizarTest() {
        if (preguntas.isEmpty()) {
            System.out.println("No hay preguntas");
        } 
        else {
            Scanner teclado = new Scanner(System.in);
            int i = 0;
            while (i < preguntas.size()) {
                Pregunta p = preguntas.get(i);
                p.mostrarPregunta();

                System.out.println("Introduce la respuesta");
                int respuesta = teclado.nextInt(); 
                if (p.comprobarRespuesta(respuesta)) {
                    System.out.println("Has acertado");
                    puntosTotales++;
                } 
                else {
                    System.out.println("No has acertado");
                }
                i++;
            }
        }
        System.out.println("Has obtenido " + puntosTotales + " puntos");
    }

    public boolean cargarFichero(String fichero) throws FileNotFoundException, IOException {        
        String textoPregunta = "";
        int opcionCorrecta = 0;
        boolean pregunta = false, respuesta = false, retVal = true;
        List<Respuesta> listaRespuestas = new ArrayList<>();

        BufferedReader br = new BufferedReader(new FileReader(fichero));
        String linea;
        while ((linea = br.readLine()) != null) {

            if (linea.startsWith(";P;")) {
                textoPregunta = linea.substring(3);
                pregunta = true; //marco que ya tengo la pregunta
            } 
            else if (pregunta && linea.startsWith(";R;")) {
                opcionCorrecta = Integer.parseInt(linea.substring(3).trim());
                respuesta = true; //marco que ya tengo la respuesta
            } 
            else if (pregunta) {
                listaRespuestas.add(new Respuesta(linea)); //añado 
                if (listaRespuestas.size() > 4) {
                    System.out.println("Una pregunta tiene mas de 4 respuestas!");
                    retVal = false;
                    break;
                }
            }

            //Si tenemos marcado la pregunta, la respuesta y hay al menos 2 opciones
            if (pregunta && respuesta && listaRespuestas.size() >= 2) {

                //marcamos la respuesta correcta
                listaRespuestas.get(opcionCorrecta - 1).setCorrecta(true);

                //añado la pregunta y reseteo flags para la proxima pregunta
                Pregunta p = new Pregunta(textoPregunta, listaRespuestas);
                preguntas.add(p);
                pregunta = false;
                respuesta = false;
                listaRespuestas = new ArrayList<>();
            }
        }
        br.close();
        return retVal;
    }

    public static void main(String[] args) {
        
        Test t=new Test();
        try {
            t.cargarFichero(args[0]);    
            t.realizarTest();
        } 
        catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
