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
public class Administrativo implements Trabajador{
    private String dni;
    private String nombre;
    private String nroCuenta;
    private int nroHoras;
    private String horario;
    
    public Administrativo(String dni, String nombre, String nroCuenta, int nroHoras, String horario){
        this.dni=dni;
        this.nombre=nombre;
        this.nroCuenta = nroCuenta;
        this.nroHoras=nroHoras;
        this.horario = horario;
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

    public int getNroHoras() {
        return nroHoras;
    }

    public void setNroHoras(int nroHoras) {
        this.nroHoras = nroHoras;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String toString() {
        return "Administrativo{dni=" +dni+ ", nombre=" + nombre + ", nroCuenta=" + nroCuenta+ ", nroHoras=" + nroHoras + ", horario=" + horario+ '}';
    }



    public String fichar() {
        LocalDateTime hoy = LocalDateTime.now();
        return nombre+" ha fichado a " +hoy.toString();
    }

    public double calcularNomina() {
        return 1000;
    }
}