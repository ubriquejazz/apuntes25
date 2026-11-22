package sql.202306.JDBC;

import java.sql.Connection;
import java.sql.Statement;

public class jdbc03 {

    public void main() {
        try {
            String url = “jdbc:sqlite:/home/user/data.db”
            Connection con = DriverManager.getConnection(url);
        } catch (Exception) {
            System.out.println(e.getMessage());
        }
    }
}

public void modificaEdadJugadores(Connection con, String BDNombre) {
    
}

public void mdoficaEquipo(Connection con, String BDNombre) {

}