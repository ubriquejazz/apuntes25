import java.util.*;

public class program12 // libreria
{
    private ArrayList<Libro> libros;   // vector 0 .. (n-1)
    
    // private LinkedList libros;  // lista 1 .. n
    
    // private TreeSet libros;     // conjunto (no duplicados)
    // no libros.size, libros.get(i) --> recorrer con for (Libro libro : libros)
    
    public program12() {
        libros = new ArrayList<Libro>();
    }

    public void inserta(Libro nuevo) {
        if (libros.contains(nuevo) == true) {
            System.out.println("Ya existe");
            return;
        }
        libros.add(nuevo);
    }
    
    public void ordenar() {
        System.out.println("Ordenando...");
        Collections.sort(libros);
    }
    
    public void muestra() {
        for (int i=0; i<libros.size(); i++) {
            Libro book = libros.get(i);
            System.out.println( book.getTitulo() + " " + 
                                book.getPrecio() + " euros");
        }
    }
    
    public void borrar(String isbn) {
        int pos = -1;
        for (int i=0; i<libros.size() && pos != -1; i++) {
            Libro book = libros.get(i);
            if (book.getISBN().equals(isbn) == true)
                pos = i;
        }
        if (pos == -1)
            return;
        else
            libros.remove(pos);
    }
    
    
    
    public static void main_01(String args[]) {
        program12 biblio = new program12();
        Libro hamlet = new Libro("2233445566", "Hamlet", "Shakespeare", 19.99);
        biblio.inserta(hamlet);
        
        Libro quijote = new Libro("1122334455", "Quijote", "Cervantes", 10.00); 
        biblio.inserta(quijote);
        
        biblio.muestra();
        biblio.ordenar();
        biblio.muestra();
    }

    public static void main(String[] args){
		program12 libreria = new program12();
		Libro l1 = new Libro("1111", "Libro 1", "Autor 1", 18);
		Libro l2 = new Libro("2222", "Libro 2", "Autor 2", 180);
		Libro l3 = new Libro("3333", "Libro 3", "Autor 3", 30);
		Libro l4 = new Libro("4444", "Libro 4", "Autor 4", 12);
		libreria.inserta(l1);
		libreria.inserta(l2);
		libreria.inserta(l3);
		libreria.inserta(l4);
		System.out.println("Libros ordenados cronológicamente");
		System.out.println(libreria.toString());
		libreria.ordena();
		System.out.println("Libros ordenados por precio");
		System.out.println(libreria.toString());
		
		libreria.borrarLibro("3333");
		System.out.println("Libros tras eliminación del libro '3333'");
		System.out.println(libreria.toString());
}
