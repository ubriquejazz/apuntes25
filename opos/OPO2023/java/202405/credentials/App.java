import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {

        if (args.length != 1) {
            System.err.println("Usage: java -jar credentials.jar <file>");
            System.exit(-1);
        }

        Diccionario miDict = new Diccionario(args[0]);

        Scanner sc = new Scanner(System.in);

        System.out.print("Usr: ");
        String usr = sc.nextLine();
        System.out.print("Pwd: ");
        String pwd = sc.nextLine();
        if (miDict.check(usr, pwd)) { 
            System.out.println("Hello " + miDict);
        } else {
            System.out.println("El usuario o la contrasena introducido no son correctos."); 
        }
    }
}
