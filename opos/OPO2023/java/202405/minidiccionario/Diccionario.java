import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Diccionario {
    private HashMap<String, String> m = new HashMap<String, String>();
    private String filename;

    public Diccionario(String filename) {
        this.filename = filename;
        this.load();
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder();
        str.append("Código\tNombre\n------\t-------------\n");
        for (Map.Entry pareja: m.entrySet()) { 
            str.append(pareja.getKey() + "\t"); 
            str.append(pareja.getValue()); 
            str.append("\n");
        }
        return str.toString();
    }

    public boolean contiene(String codigo) {
        if (m.containsKey(codigo)) { 
            return true;
        }
        return false;
    }

    public String get(String codigo) {
        return m.get(codigo);
    }

    public void load() {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] datos = linea.split(":");
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
}
