import java.util.*;

public class Plantilla { 
    
    private List<Empleado> empleados;

    public Plantilla() {
        empleados = new ArrayList<Empleado>();
    }
    
    public contratarEmpleado(Empleado e) {
        empleados.add(e);
    }

    public List<Empleado> getEmpleadosPorNombre(String filtro) {
        List<Empleado> aux = new ArrayList<Empleado>();
        for (Empleado emp : empleados) 
            if (emp.getNombre().contains(filtro)) 
                aux.add(emp);
        return aux;
    }

    public static main (String[] args) {

        Plantilla plantilla = new Plantilla();

        // Técnico de categoría 1 y 2
        plantilla.contratarEmpleado(new Tecnico("11111111H", "Alejandro", "Fernández", 1000, 1)); // Técnico de categoría 2
        plantilla.contratarEmpleado(new Tecnico("22222222J", "Jerónima", "Jiménez", 1000, 2));
        
        // Comercial
        Comercial comercial = new Comercial("33333333P", "Desiderio", "Durán", 800);
        comercial.setVentas(2000);
        Plantilla.contratarEmpleado(comercial);
        for (Empleado e: plantilla.getEmpleadosPorNombre("er")) {
            System.out.println(e.getNombre() + " " + e.getApellidos() + ": " + e.getSueldo());
        }
    }
}