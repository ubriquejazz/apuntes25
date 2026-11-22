public class Libro implements Comparable
{
    private String ISBN;
    private String titulo;
    private String autor;
    private double precio;
    
    public Libro(String ISBN, String titulo, String autor, double precio) {
        this.ISBN = ISBN;
        this.titulo = titulo;
        this.autor = autor;
        this.precio = precio;
    }
    
    public Libro clonar() {
        // Libro nuevo = new Libro(this.ISB, this.titulo, this.autor, this.precio);
        try {
            return (Libro)this.clone();
        }
        catch (CloneNotSupportedException e) {
            return null;
        }
    }
    
    public String getISBN() {
        return this.ISBN;
    }
    
    public String getTitulo() {
        return this.titulo;
    }
    
    public String getAutor() {
        return this.autor;
    }
    
    public double getPrecio() {
        return this.precio;
    }
    
    public boolean equals(Object otro) {
        
        if (otro == null) 
            return false;
        if (this == otro)
            return true;
        
        try {
            Libro otroLibro = (Libro)otro;
            return this.ISBN.equals(otroLibro.getISBN());
        } 
        catch (Exception e) {
            return false;
        }
        /*
        if (this.getISBN().compareTo(otroLibro.getISBN()) == 0) {
            return true;
        }
        return false;
        */ 
    }
    
    public int compareTo(Object otro) {
        int retVal = -2;
        try {
            Libro otroLibro = (Libro)otro;
            if (this.precio == otroLibro.getPrecio())
                retVal = 0;
            else if (this.precio> otroLibro.getPrecio())
                retVal = 1;
            else
                retVal = -1;
        } catch (Exception e) {
            System.out.println("Error");
        }
        return retVal;
    }
}
