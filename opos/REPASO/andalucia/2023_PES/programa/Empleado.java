class abstract Empleado {

    private String dni, nombre, apellido;
    private double sueldoBase;

    public Empleado() {
        this.sueldoBase = sueldoBase;
    }

    public double getSueldoBase() {
        return this.sueldoBase;
    }

    public abstract getSueldo();
}