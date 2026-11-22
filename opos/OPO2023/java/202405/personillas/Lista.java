import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Lista {

    private ArrayList<Persona> listaDePersonas = new ArrayList<>();
    private String nombreDelArchivo = ""; 

    public Lista(String nombreDelArchivo) {
        this.nombreDelArchivo = nombreDelArchivo;
        this.load();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Persona persona : listaDePersonas) {
            sb.append(persona);
            sb.append("---\n");
        }
        return sb.toString();
    }

    public void add(Persona p) {
        listaDePersonas.add(p);
    }

    public void load() {
        try (BufferedReader br = new BufferedReader(new FileReader(nombreDelArchivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                // Suponiendo que cada línea del archivo tiene el formato: nombre, dni, telefono, email
                String[] datos = linea.split(",");
                if (datos.length == 4) {
                    String dni = datos[0];
                    String nombre = datos[1];
                    String telefono = datos[2];
                    float high = Float.parseFloat(datos[3]);
                    Persona persona = new Persona(nombre, dni, telefono, high);
                    listaDePersonas.add(persona);
                } else {
                    System.err.println("Error: formato incorrecto en la línea: " + linea);
                }
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }

    public void save() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(nombreDelArchivo))) {
           
            for (Persona persona : listaDePersonas) {
                bw.write(persona.getDni());

            }
            
        } catch (IOException e) {
            System.err.println("Error al escribir el archivo: " + e.getMessage());
        }
    }

    public Persona buscar (String dni) {
        for (Persona persona : listaDePersonas) {
            if (persona.getDni().equals(dni)) {
                return persona;
            }
        }
        return null;
    }

    public boolean remove (String dni) {
        for (Persona persona : listaDePersonas) {
            if (persona.getDni().equals(dni)) {
                listaDePersonas.remove(persona);
                return true;
            }
        }
        return false;
    }


}
