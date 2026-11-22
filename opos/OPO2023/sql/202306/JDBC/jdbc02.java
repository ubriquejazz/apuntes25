package sql.202306.JDBC;

import java.sql.Connection;
import java.sql.Statement;

public class jdbc02 {

    public void main() {
        try {
            String url = “jdbc:sqlite:/home/user/data.db”
            Connection con = DriverManager.getConnection(url);
        } catch (Exception) {
            System.out.println(e.getMessage());
        }
    }
}

public void cargaEquipo(Connection con, String BDNombre) {
    Statement stmt = con.createStatement();
    stmt.executeUpdate( "insert into " + BDNombre + ".Equipo VALUES(" +
            " 1, 'Estepona', 'Malaga', '29680')");
    stmt.executeUpdate( "insert into " + BDNombre + ".Equipo VALUES(" +
            " 2, 'Alcorcon', 'Madrid', '28080')");
    stmt.executeUpdate( "insert into " + BDNombre + ".Equipo VALUES(" +
            " 3, 'Ubrique', 'Cadiz', '11600')");
    stmt.close();
}

public void cargaJugador(Connection con, String BDNombre) {
    Statement stmt = con.createStatement();
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 1, 1, 'Jose Antonio', 10)");
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 2, 1, 'Luis', 3)");

    // Cargando datos del Alcorcon
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 1, 2, 'Alberto Jose', 11)");
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 2, 2, 'Diego Mendoza', 3)");

    // Cargando datos del Ubrique
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 1, 3, 'Paco', 11)");
    stmt.executeUpdate( "insert into " + BDNombre + ".Jugador VALUES(" +
            " 2, 3, 'Pepe', 3)");
    stmt.close();
}

public void insertaJugador(Connection con, 
    String BDNombre, int player_id, int team_id, String nombre, int dorsal) {

    
}