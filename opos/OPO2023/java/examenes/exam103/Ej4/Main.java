/*  función a la que le pasamos una cadena de caracteres y nos devuelve
    un entero, que será el número de diptongos que hay en la cadena.
*/

public class Main {

    public static void main(String[] args)
    {
        String s = "Puede caer una bien buena";
        System.out.println(s + ": " + cuentaDiptongos(s) + " diptongos");
    }

    public static boolean esVocal(char c)
    {
        String vocales = "aeiouAEIOUáéíóúÁÉÍÓÚüÜ";
        if (vocales.indexOf(c) != -1){
            return true;
        }
        else {
            return false;
        }
    }

    public static boolean esVocalDebil(char c)
    {
        String vocales = "iuIUüÜ";
        return vocales.indexOf(c) != -1;
    }

    public static int cuentaDiptongos(String s)
    {
        int i;
        int cont = 0;

        for (i = 0; i < s.length() - 1; i++) {
            if ( esVocal(s.charAt(i)) && esVocal(s.charAt(i+1)) && (esVocalDebil(s.charAt(i)) || esVocalDebil(s.charAt(i+1))) )
                cont++;
        }
        return cont;
    }
}
