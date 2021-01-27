package Backend;

import java.sql.*;

//Makes enity abstract 
public abstract class Enity {

    //instance variable 'Client_ID'
    private String ID;

    //main constructor
    public Enity(String ID) {
        this.ID = ID;
    }

    //empty constructor
    public Enity() {
        this.ID = "";
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        String connectionUrl = "jdbc:mysql://cloud19.hostgator.com/uzaqleuw_Railroad_system_test";
        con = DriverManager.getConnection(connectionUrl, "*******", "*************");
        //Returns the connection object
        return con;
    }

    //abstract methods with a resultset return type. 
    public abstract ResultSet Select();

    public abstract ResultSet SelectWhere(String ID);

    public abstract void Delete(String ID) throws ClassNotFoundException, SQLException;

    public abstract ResultSet Count() throws ClassNotFoundException, SQLException;
    public abstract ResultSet GroupBy() throws ClassNotFoundException, SQLException;
    public abstract ResultSet Having() throws ClassNotFoundException, SQLException;
    
    public abstract ResultSet Join() throws ClassNotFoundException, SQLException;
    public abstract ResultSet LeftJoin() throws ClassNotFoundException, SQLException;
    public abstract ResultSet RightJoin() throws ClassNotFoundException, SQLException;
    
    public abstract ResultSet UNION() throws ClassNotFoundException, SQLException;
    public abstract ResultSet SelfJoin() throws ClassNotFoundException, SQLException;
    public abstract ResultSet In() throws ClassNotFoundException, SQLException;

}
