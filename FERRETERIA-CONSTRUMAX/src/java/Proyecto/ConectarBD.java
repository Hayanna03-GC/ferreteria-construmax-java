
package Proyecto;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class ConectarBD {

    private Connection con = null;
    private String servidor = "localhost:3306";
    private String database = "ferreteriaconstrumax";
    private String usuario = "root";
    private String password = "";
    private String url = "";

    public ConectarBD(String servidor, String database, String usuario, String contraseña) {
        try {
            this.servidor = servidor;
            this.database = database;
            Class.forName("com.mysql.jdbc.Driver");
            url = "jdbc:mysql://" + servidor + "/" + database + "?autoconnect=true&useSSL=false";
            con = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion con la BD" + url + "...OK");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }

    public ConectarBD() {
        try {
            this.servidor = servidor;
            this.database = database;
            Class.forName("com.mysql.jdbc.Driver");
            url = "jdbc:mysql://" + servidor + "/" + database + "?autoconnect=true&useSSL=false";
            con = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion con la BD" + url + "...OK");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }

    public PreparedStatement crearPreparedStatement(String sql) throws SQLException {
        return con.prepareStatement(sql);
    }

    public Statement crearStatement() throws SQLException {
        return con.createStatement();
    }

    public Connection getConnection() {
        return con;
    }

    public Connection cerrarConexion() {
        try {
            con.close();
            System.out.println("Cerrando la conexon con ls base de datos: " + url + "...Ok");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        con = null;
        return con;
    }
}
