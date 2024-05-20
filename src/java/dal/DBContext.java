package dal;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author thuat
 */
public class DBContext {

    protected Connection connect;
    private final String serverName = "localhost";
    private final String dbName = "BookingFootballTicket";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                    + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, userID, password);
        } catch (Exception ex) {
            System.out.println("------");
            ex.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        System.out.println(new DBContext());
    }

}
