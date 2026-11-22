public  class Comercial is Empleado { 

    private double ventas; 
   
    public Comercial () {
        super(dni, nombre, apellido, sueldoBase);
        this.ventas = ventas;
    }

    public setVentas(double nuevo) {
        this.ventas = nuevo;
    }

    public getSueldo() {
        return this.getSueldoBase() + 0.1 * this.ventas;
    }

}
