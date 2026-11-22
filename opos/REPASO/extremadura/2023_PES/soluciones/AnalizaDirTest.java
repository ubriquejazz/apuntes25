import org.junit.jupiter.api.*;
import java.io.File;
import java.io.IOException;

public class AnalizaDirTest {

    private static final String BASE = "testData";

    @BeforeAll
    static void setup() throws IOException {
        // Crear estructura de pruebas
        new File(BASE).mkdir(); // nivel 0
        new File(BASE + "/soloArchivos").mkdir();
        new File(BASE + "/soloArchivos/f1.txt").createNewFile();

        new File(BASE + "/vacio").mkdir();

        new File(BASE + "/anidado").mkdir(); // nivel 0
        new File(BASE + "/anidado/n1").mkdir(); // nivel 1
        new File(BASE + "/anidado/n1/n2").mkdir(); // nivel 2
        new File(BASE + "/anidado/n1/n2/n3").mkdir(); // nivel 3

        new File("archivo.txt").createNewFile(); // fuera del árbol, para prueba negativa
    }

    @AfterAll
    static void tearDown() {
        borrarDirectorio(new File(BASE));
        new File("archivo.txt").delete();
    }

    private static void borrarDirectorio(File file) {
        if (file.isDirectory()) {
            for (File sub : file.listFiles()) {
                borrarDirectorio(sub);
            }
        }
        file.delete();
    }

    @Test
    void testDirectorioNoExiste() {
        assertEquals(-1, AnalizaDir.numeroNiveles("noExiste"));
    }

    @Test
    void testRutaEsArchivo() {
        assertEquals(-1, AnalizaDir.numeroNiveles("archivo.txt"));
    }

    @Test
    void testDirectorioVacio() {
        assertEquals(1, AnalizaDir.numeroNiveles(BASE + "/vacio"));
    }

    @Test
    void testDirectorioSoloArchivos() {
        assertEquals(1, AnalizaDir.numeroNiveles(BASE + "/soloArchivos"));
    }

    @Test
    void testDirectorioAnidado() {
        assertEquals(4, AnalizaDir.numeroNiveles(BASE + "/anidado"));
    }
}

class Ayuda {

    | Caso de prueba | Descripción                            | Resultado esperado   |
    | -------------- | -------------------------------------- | -------------------- |
    | 1              | Directorio que no existe               | -1                   |
    | 2              | Ruta que es un archivo                 | -1                   |
    | 3              | Directorio vacío                       | 1                    |
    | 4              | Directorio con solo archivos           | 1                    |
    | 5              | Directorio con subdirectorios anidados | Profundidad correcta |

}
