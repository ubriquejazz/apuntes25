public class ListadoPersonas {

	public static void main(String[] args) {
    	if (args.length != 1) {
            System.out.println("Imprimir el contenido de la lista de personas");
        	System.out.println("Uso: java examen <nombre_del_archivo>");
        	System.exit(1);
    	}

        // Cargar los datos del archivo CSV
        Lista miLista = new Lista(args[0]);
        System.out.println(miLista);
    }
}
