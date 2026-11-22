/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjemploHerencia3;

import EjemploHerencia.*;
import java.time.LocalDateTime;

/**
 *
 * @author Usuario
 */
public class Conservador implements Trabajador{
    
    private String dni;
    private String nombre;
    private String nroCuenta;
    
    public Conservador(String dni, String nombre, String nroCuenta){
        this.dni=dni;
        this.nombre=nombre;
        this.nroCuenta = nroCuenta;
    }
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNroCuenta() {
        return nroCuenta;
    }

    public void setNroCuenta(String nroCuenta) {
        this.nroCuenta = nroCuenta;
    }

    public String toString() {
        return "Conservador{dni=" +dni+ ", nombre=" + nombre + ", nroCuenta=" + nroCuenta+ '}';
    }

    public double calcularNomina() {
        return 1000;
    }

    public String fichar() {
        LocalDateTime hoy = LocalDateTime.now();
        return nombre+" ha fichado a " +hoy.toString();
    }
}
