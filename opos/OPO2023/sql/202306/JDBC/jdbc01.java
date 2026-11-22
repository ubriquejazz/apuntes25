package sql.202306.JDBC;

import java.sql.Connection;
import java.sql.Statement;

public class jdbc01 {

    public void main() {
        try {
            String url = “jdbc:sqlite:/home/user/data.db”
            Connection con = DriverManager.getConnection(url);
        } catch (Exception) {
            System.out.println(e.getMessage());
        }
    }
}

public void createEquipo(Connection con, String BDNombre) {
    String create = "create table" + BDNombre + ".Equipo (" +
                " team_id integer PRIMARY KEY," +
                " eq_nombre varchar(40)" +
                " estadio varchar(40)" +
                " ciudad varchar(20)" +
                " codigo postal char(5)"
                "); ";
    Statement stmt = con.createStatement();
    stmt.executeUpdate(create);
    stmt.close();
}
    
public void createJugador(Connection con, String BDNombre) {
    String create = "create table" + BDNombre + ".Jugador (" +
                " player_id integer PRIMARY KEY," +
                " team_id integer" +
                " nombre varchar(40)" +
                " dorsal integer" +
                " FOREIGN KEY (team_id) REFERENCES Equipo(team_id)"
                "); ";
    Statement stmt = con.createStatement();
    stmt.executeUpdate(create);
    stmt.close();
}

public void verEquipo(Connection con, String BDNombre) {
    String query = "select eq_nombre, estadio, ciudad from " +
        BDNombre + ".Equipo";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    while rs.next() {
        System.out.println("Equipo: " + rs.getString(1));
        System.out.println("Estadio: " + rs.getString(2));
        System.out.println("Ciudad: " + rs.getString(3));
    }
    stmt.close();
}