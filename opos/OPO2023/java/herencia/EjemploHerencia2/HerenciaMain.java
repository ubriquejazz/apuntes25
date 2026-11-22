/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjemploHerencia2;

/**
 *
 * @author Usuario
 */
public class HerenciaMain {
    public static void main(String argv[]){
        Vigilante v = new Vigilante("11111111A", "Fran", "ES200000000", 1, 1, 3);
        System.out.println(v.toString());

        Administrativo a = new Administrativo("22222222B","Amalia","ES0390493",40,"L-V de 9:00 a 14:00 horas");
        System.out.println(a.toString());

        Conservador c = new Conservador("33333333C", "Paco", "ES39304304");
        System.out.println(c.toString());

        Vigilante v1 = new Vigilante("44444444D", "Juan", "ES200000000", 1, 1, 3);
        Administrativo a1 = new Administrativo("55555555E","Antonio","ES0390493",40,"L-V de 9:00 a 14:00 horas");
        Conservador c1 = new Conservador("66666666F", "Manolo", "ES39304304");
        // Trabajador trabaj = new Trabajador("66666666F", "Manolo", "ES39304304");  // abstract; cannot be instantiated
        
        Trabajador[] trabajadores = {v,a,c,v1,a1,c1};
        
        System.out.println("LISTADO DE VIGILANTES:");
        for(Trabajador trabajador : trabajadores){
            if(trabajador instanceof Vigilante){
                System.out.println(trabajador.toString());
            }
        }
    }
}
