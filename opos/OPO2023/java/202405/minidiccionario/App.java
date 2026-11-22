import java.util.HashMap;
import java.util.Map;

public class App {

    public static void ejemplo() {
        HashMap<Integer, String> m = new HashMap<Integer, String>();

        m.put(924, "Amalia Núñez"); 
        m.put(921, "Cindy Nero"); 
        m.put(700, "César Vázquez"); 
        m.put(219, "Víctor Tilla");

        //System.out.println("Hello, World = " + m);
        System.out.println("Todas las entradas del diccionario extraídas con entrySet:"); 
        //System.out.println(m.entrySet());
        for (Map.Entry pareja: m.entrySet()) { 
            System.out.println(pareja); 
        }

        System.out.println("Código\tNombre\n------\t-------------");
        for (Map.Entry pareja: m.entrySet()) { 
            System.out.print(pareja.getKey() + "\t\t"); 
            System.out.println(pareja.getValue()); 
        }

        int codigoIntroducido = 219;
        if (m.containsKey(codigoIntroducido)) { 
            System.out.print("El código " + codigoIntroducido + " corresponde a "); 
            System.out.println(m.get(codigoIntroducido)); 
        } else {
            System.out.print("El código introducido no existe."); 
        }
    }
    
    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            System.out.println("Mini Diccionario");
            System.out.println("Uso: java app <fichero.csv> <ingles>"); 
            System.exit(-1);
        }
        Diccionario miDict = new Diccionario(args[0]);
        //System.out.println(miDict);
        String codigoIntroducido = args[1];
        if (miDict.contiene(codigoIntroducido)) { 
            System.out.print("El código " + codigoIntroducido + " corresponde a "); 
            System.out.println(miDict.get(codigoIntroducido)); 
        } 
        else {
            System.out.print("El código introducido no existe."); 
        }

    }
}
