/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjemploHerencia3;

import java.time.LocalDateTime;

/**
 *
 * @author Usuario
 */
public class Vigilante implements Trabajador{
    private String dni;
    private String nombre;
    private String nroCuenta;
    private int nroArma;
    private int nroLicencia;
    private int nroProyectiles;
    
    public Vigilante(String dni, String nombre, String nroCuenta, int nroArma, int nroLicencia, int nroProyectiles){
        this.dni=dni;
        this.nombre=nombre;
        this.nroCuenta=nroCuenta;
        this.nroArma=nroArma;
        this.nroLicencia = nroLicencia;
        this.nroProyectiles = nroProyectiles;
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
    
    public int getNroArma() {
        return nroArma;
    }

    public void setNroArma(int nroArma) {
        this.nroArma = nroArma;
    }

    public int getNroLicencia() {
        return nroLicencia;
    }

    public void setNroLicencia(int nroLicencia) {
        this.nroLicencia = nroLicencia;
    }

    public int getNroProyectiles() {
        return this.nroProyectiles;
    }
    
    public String disparar(int nP){
        this.nroProyectiles-=nP;
        return "Le acabo de disparar a Dieguito "+nP+" proyectiles";
    }
    
    public double calcularNomina(){
        return 1000+500;
    }
    
    public void cambiarArma(){
        this.nroArma = (int)(Math.random()*100+1);
    }

    public String toString() {
        return "Vigilante{dni=" +dni+ ", nombre=" + nombre + ", nroCuenta=" + nroCuenta + ", nroArma=" + nroArma + ", nroLicencia=" + nroLicencia + ", nroProyectiles=" + nroProyectiles + '}';
    }

    public String fichar() {
        LocalDateTime hoy = LocalDateTime.now();
        return nombre+" ha fichado a " +hoy.toString();
    }
}
