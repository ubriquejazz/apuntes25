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
public class Administrativo extends Trabajador{
    private int nroHoras;
    private String horario;
    
    public Administrativo(String dni, String nombre, String nroCuenta, int nroHoras, String horario){
        super(dni,nombre,nroCuenta);
        this.nroHoras=nroHoras;
        this.horario = horario;
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

    @Override
    public String toString() {
        return "Administrativo{" +super.toString()+ ", nroHoras=" + nroHoras + ", horario=" + horario+ '}';
    }
}