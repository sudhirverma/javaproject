package phd;

import java.sql.*;
import static phd.myDatabase.*;

public class User {

    private String uid, name, phoneno, address, email, username, password;

    public User(String name, String phoneno, String address, String email, String username, String password) {

        this.name = name;
        this.phoneno = phoneno;
        this.address = address;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User() {

    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    int addToDatabase() {
        Connection c = createConnection();
        Statement s = null;
        int res = 0;
        String q = "insert into users (name,phoneno,address,email,username,password) values ('" + name + "','" + phoneno + "','" + address + "','" + email + "','" + username + "','" + password + "')";
        try {
            s = c.createStatement();
            res = s.executeUpdate(q);
            System.out.println(res + " rows added to table");
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return res;
    }

    String checkUsername() {
        Connection c = createConnection();
        Statement s = null;
        String q = "select email from users where username='" + username + "'";
        ResultSet rs = null;
        String message = "Available";
        try {
            s = c.createStatement();
            rs = s.executeQuery(q);
            System.out.println("Checking Database");
            if (rs.next()) {
                message = "Username already registered to email: " + rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return message;
    }

    String checkEmail() {
        Connection c = createConnection();
        Statement s = null;
        String q = "select username from users where email='" + email + "'";
        ResultSet rs = null;
        String message = "Available";
        try {
            s = c.createStatement();
            rs = s.executeQuery(q);
            System.out.println("Checking Database for email " + email);

            if (rs.next()) {
                System.out.println(rs.getString(1));
                message = "E-Mail already registered to username: " + rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return message;
    }

    boolean login() {
        Connection c = createConnection();
        Statement s = null;
        String q = "select * from users where username='" + username + "' and password='" + password + "'";
        ResultSet rs = null;
        boolean found = false;
        try {
            s = c.createStatement();
            rs = s.executeQuery(q);
            System.out.println("Checking Database");
            if (rs.next()) {
                this.name = rs.getString("name");
                this.address = rs.getString("address");
                this.phoneno = rs.getString("phoneno");
                this.email = rs.getString("email");
                this.uid = Integer.toString(rs.getInt("uid"));
                found = true;
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return found;
    }

}
