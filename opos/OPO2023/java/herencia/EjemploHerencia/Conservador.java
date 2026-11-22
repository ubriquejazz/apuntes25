/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjemploHerencia;

/**
 *
 * @author Usuario
 */
public class Conservador extends Trabajador{
    
    public Conservador(String dni, String nombre, String nroCuenta){
        super(dni,nombre,nroCuenta);
    }

    @Override
    public String toString() {
        return "Conservador{" + super.toString()+ '}';
    }
}
