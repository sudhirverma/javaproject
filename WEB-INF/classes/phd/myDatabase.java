package phd;

import java.sql.*;

public class myDatabase {

    static Connection createConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/phd", "root", "asdf");
            return c;
        } catch (Exception e) {
            System.out.println("Error Connecting to Database " + e);
            return null;
        }
    }

    static void closeConnection(Connection c) {
        try {
            c.close();
        } catch (Exception e) {
            System.out.println("Error Connecting to Database " + e);
        }
    }

}
