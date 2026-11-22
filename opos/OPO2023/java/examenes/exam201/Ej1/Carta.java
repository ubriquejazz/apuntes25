/**
 * Clase Carta
 * @file https://github.com/DiscoDurodeRoer/ejercicios-java-youtube/tree/master/poo/poo%2005
 * @author Disco Duro de Roer
 */

public class Carta {
    
    //Atributos
    private int numero; // 1-7, 9, 10, 11
    private String palo;
    
    //Constantes 
    public static final String[] PALOS={"ESPADAS", "OROS", "COPAS", "BASTOS"};
    public static final int LIMITE_NUMERO=12;

    //Constructor
    public Carta(int numero, String palo) {
        this.numero = numero; 
        this.palo = palo; 
    }

    @Override
    public String toString() {
        return "numero=" + numero + ", palo=" + palo;
    }
    
}
