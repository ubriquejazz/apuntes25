import java.util.Scanner;

public class NuevaPersona {

    public static Persona usuario(Scanner sc) {
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
        System.out.print("DNI: ");
        String dni = sc.nextLine();
        System.out.print("Tlf: ");
        String telefono = sc.nextLine();
        System.out.print("Altura: ");
        float high = sc.nextFloat();
        return new Persona(nombre, dni, telefono, high);
    }

	public static void main(String[] args) {
    	if (args.length != 1) {
            System.out.println("Introduce una persona en la lista de personas");
        	System.out.println("Uso: java examen <nombre_del_archivo>");
        	System.exit(1);
    	}

        // Cargar los datos del archivo CSV
        Lista miLista = new Lista(args[0]);

        // Inputs
        Scanner sc = new Scanner(System.in);
        Persona p = usuario(sc);
        miLista.add(p);

        // Respaldar archivo CSV
        String respuesta = "";
        do {
            System.out.print("Desea grabarlo en " + args[0] + " (Yes/No)?");
            respuesta = sc.next();
        } while (!respuesta.equals("N") && !respuesta.equals("Y"));
        if (respuesta.equals("Y")) {
            miLista.save();
            System.out.println("La persona con dni " + p.getDni() + " ha sido grabada");
        }
    }
}
