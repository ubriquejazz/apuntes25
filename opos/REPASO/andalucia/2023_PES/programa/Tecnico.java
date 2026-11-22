public class Tecnico is Empleado { 

    private int categoria;

    public Tecnico () {
        super(dni, nombre, apellido, sueldoBase);
        this.categoria = categoria;
    }

    public getSueldo() {
        return this.getSueldoBase() + 100 * this.categoria;
    }
}
