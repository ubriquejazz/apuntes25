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
public class Vigilante extends Trabajador{
    private int nroArma;
    private int nroLicencia;
    private int nroProyectiles;
    
    public Vigilante(String dni, String nombre, String nroCuenta, int nroArma, int nroLicencia, int nroProyectiles){
        super(dni,nombre,nroCuenta);
        this.nroArma=nroArma;
        this.nroLicencia = nroLicencia;
        this.nroProyectiles = nroProyectiles;
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

    public double calcularNomina() {
        return 1000+500;
    }
    
    @Override
    public String toString() {
        return "Vigilante{" +super.toString()+ ", nroArma=" + nroArma + ", nroLicencia=" + nroLicencia + ", nroProyectiles=" + nroProyectiles + '}';
    }
}
