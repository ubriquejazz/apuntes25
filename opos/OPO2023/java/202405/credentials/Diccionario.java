import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

public class Diccionario {
    private HashMap<String, String> m = new HashMap<String, String>();
    private String filename;

    public Diccionario(String filename) {
        this.filename = filename;
        this.load();
    }

    public void load() {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] datos = linea.split("@");
                if (datos.length == 2) {
                    m.put(datos[0], datos[1]);
                } else {
                    System.err.println("Error: formato incorrecto en la línea: " + linea);
                }
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }

    @Override
    public String toString() {
        return m.toString();
    }

    public boolean check(String user, String password) {
        if (m.containsKey(user) && m.get(user).equals(password))
            return true;
        return false;
    }
}
