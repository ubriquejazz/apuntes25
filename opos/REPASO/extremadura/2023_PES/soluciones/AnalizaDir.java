import java.io.File;

public class AnalizaDir {

    public static int numeroNiveles(String ruta) {
        File directorio = new File(ruta);

        // Comprobación básica
        if (!directorio.exists() || !directorio.isDirectory()) {
            return -1; // Error: no existe o no es un directorio
        }

        return nivelesDesde(directorio);
    }

    // Método recursivo auxiliar
    private static int nivelesDesde(File dir) {
        File[] contenido = dir.listFiles();
        if (contenido == null || contenido.length == 0) {
            return 1; // Solo este nivel, se ha acabado
        }

        int maxNivel = 1; // Nivel actual
        for (File archivo : contenido) {
            if (archivo.isDirectory()) {
                int profundidad = 1 + nivelesDesde(archivo);
                if (profundidad > maxNivel) {
                    maxNivel = profundidad;
                }
            }
        }

        return maxNivel;
    }

    // Ejemplo de uso
    public static void main(String[] args) {
        String directorio = "miCarpeta"; // ejemplo
        int profundidad = numeroNiveles(directorio);
        System.out.println("Nivel más profundo: " + profundidad);
    }
}
