/*  palabrasImpares a la que le pasamos una cadena de caracteres y 
    nos devuelve otra cadena de caracteres con el resultado.
    Ej.: “El perro de San Roque” -> "perro San Roque"
*/

public class Main
{
    public static void main(String[] args) {
        String s = "El perro de San Roque no tiene rabo";
        System.out.println(palabrasImpares(s));
    }

    public static String palabrasImpares(String s){
        int i;
        String[] trozos = s.split(" ");
        String res = "";
        String t;

        for(i = 0; i < trozos.length; i++) {
            t = trozos[i];
            if(t.length() % 2 == 1) {
                res = res + t + " ";
            }
        }
        return res.substring(0, res.length()-1);
    }
}
