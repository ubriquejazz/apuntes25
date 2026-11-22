public class BuscaPersona {
    
	public static void main(String[] args) {
    	if (args.length != 2) {
            System.out.println("Buscar la persona por su DNI");
        	System.out.println("Uso: java examen <nombre_del_archivo> <dni_a_buscar>");
        	System.exit(1);
    	}

        // Cargar los datos del archivo CSV
        Lista miLista = new Lista(args[0]);

        // Buscar la persona por su DNI
        String dni = args[1];
        Persona p = miLista.buscar(dni);
        if (p == null) {
            System.out.println("Persona " + dni + " no encontrada.");
        }
        else {
            System.out.println("Persona " + p.getDni() + " encotrada!");
            System.out.println(p);
        }
    }
}
