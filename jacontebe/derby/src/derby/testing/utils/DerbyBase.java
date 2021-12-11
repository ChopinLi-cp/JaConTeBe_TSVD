package derby.testing.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DerbyBase {

    private Connection conn;
    private static final String URL = "jdbc:derby:DB";

    public Connection getConnection() throws SQLException,
            ClassNotFoundException {
        if (conn != null) {
            if (!conn.isClosed())
                return conn;
            conn = null;
        }
        return conn = openDefaultConnection();
    }

    public Connection openDefaultConnection() throws SQLException,
            ClassNotFoundException {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

        return DriverManager.getConnection(URL + ";create=true");

    }
}
