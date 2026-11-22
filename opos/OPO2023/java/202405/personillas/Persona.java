public class Persona {
    private String nombre;
	private String dni;
	private String telefono;
	private float altura;

	public Persona(String nombre, String dni, String telefono, float altura) {
    	this.nombre = nombre;
    	this.dni = dni;
    	this.telefono = telefono;
    	this.altura = altura;
	}

    @Override
    public String toString() {
        return "nombre=" + nombre + "\ndni=" + dni + "\ntelefono=" + telefono + "\naltura=" + altura + "\n";
    }

    public String getDni() {
        return dni;
    }

	public String getNombre() {
		return nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public float getAltura() {
		return altura;
	}

}
