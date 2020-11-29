/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author drych
 */
public class Train extends Enity {

    //private String Station_ID;
    private String Train_ID;
    private String Train_name;
    private String Train_Model;
    private String Train_make;
    private String Train_Max_speed;
    private String Train_Weight;
    private String Train_Length;
    private String Traffic_type;

    public Train(String Train_ID, String Train_name, String Train_Model, String Train_make, String Train_Max_speed, String Train_Weight, String Train_Length, String Traffic_type) {
        super(Train_ID);
        this.Train_name = Train_make;
        this.Train_Model = Train_Model;
        this.Train_make = Train_make;
        this.Train_Max_speed = Train_Max_speed;
        this.Train_Weight = Train_Weight;
        this.Train_Length = Train_Length;
        this.Traffic_type = Traffic_type;
    }
//empty contructor

    public Train() {

        this.Train_ID = "";
       this.Train_name = "";
        this.Train_Model = "";
        this.Train_make = "";
        this.Train_Max_speed = "";
        this.Train_Weight = "";
        this.Train_Length = "";
        this.Traffic_type = "";

    }

    public void Update(String Train_ID, String Train_name, String Train_Model, String Train_make, String Train_Max_speed, String Train_Weight, String Train_Length, String Traffic_type) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "UPDATE `Train` SET `Train_name`='" + Train_name + "',`Train_Model` ='" + Train_Model + "', `Train_make`= '" + Train_make + "', `Train_Max_speed`= '" + Train_Max_speed + "',`Train_Weight` ='" + Train_Weight + "', `Train_Length`= '" + Train_Length + "', `Traffic_type`= '" + Traffic_type + "' WHERE `Train_ID`='" + Train_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Delete(String Train_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "DELETE FROM `Train` WHERE `Train_ID`='" + Train_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Add(String Train_ID, String Train_name, String Train_Model, String Train_make, String Train_Max_speed, String Train_Weight, String Train_Length, String Traffic_type) throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        //Creates a prepared statement. 
        PreparedStatement pst;
        //Connects to the remote Database
        con = this.getConnection();
        //SQL for add
        pst = con.prepareStatement("INSERT INTO Train (Train_ID, Train_name, Train_Model, Train_make,Train_Max_speed,Train_Weight, Train_Length,Traffic_type)values(?,?,?,?,?,?,?,?)");
        //sets the variables for add
        pst.setString(1, Train_ID);
        pst.setString(2, Train_name);
        pst.setString(3, Train_Model);
        pst.setString(4, Train_make);
        pst.setString(5, Train_Max_speed);
        pst.setString(6, Train_Weight);
        pst.setString(7, Train_Length);
        pst.setString(8, Traffic_type);

        //Executes the SQL
        pst.executeUpdate();
    }

    @Override
    public ResultSet SelectWhere(String id) {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        //try statement
        try {
            //creates a preparedstatement
            PreparedStatement pst;
            //connects to the database
            con = this.getConnection();
            //Prepare the sql statement
            pst = con.prepareStatement("SELECT * FROM Train where Train_ID = ?");
            //set the variables for sql statement
            pst.setString(1, id);
            //executes the query
            rs = pst.executeQuery();
        } //catches  
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    @Override
    public ResultSet Select() {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        //try
        try {
            con = this.getConnection();
            //Prepare the sql statement
            String query = "SELECT * FROM Train";
            //Creates a statement
            Statement st = con.createStatement();
            //Execute the SQL
            rs = st.executeQuery(query);

        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet Count() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT COUNT(Train_ID)\n"
                    + "FROM `Train`;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    public ResultSet Min() throws ClassNotFoundException, SQLException {

        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT MIN(Train_Max_speed) AS Smallest_Train_Max_speed\n"
                    + "FROM Train;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    public ResultSet Max() throws ClassNotFoundException, SQLException {

        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT MAX(Train_Max_speed) AS Largest_Train_Max_speed\n"
                    + "FROM Train;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    public ResultSet Sum() throws ClassNotFoundException, SQLException {

        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();

            String query = "SELECT SUM(Train_Max_speed)\n"
                    + "FROM Train;";

            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    public ResultSet Avg() throws ClassNotFoundException, SQLException {

        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT AVG(Train_Max_speed)\n"
                    + "FROM Train;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet GroupBy() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT COUNT(Train_ID), Train_name\n"
                    + "FROM `Train` GROUP BY Train_name;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet Having() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT SUM(Train_ID), Train_name FROM `Train` GROUP BY Train_name HAVING SUM(Train_ID) > 5";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet Join() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT Train.Train_ID, Passenger.coach, Passenger.seat FROM Passenger INNER JOIN Train ON Passenger.Train_ID=Train.Train_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet LeftJoin() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            //String query = "SELECT Stations.Station_ID, Tracks.Average_Track_Speed_Limit FROM Tracks LEFT JOIN Stations ON Tracks.Station_start_ID=Stations.Station_ID ORDER BY Tracks.Average_Track_Speed_Limit;";
            String query = "SELECT Train.Train_ID, Passenger.coach, Passenger.seat FROM Passenger LEFT JOIN Train ON Passenger.Train_ID=Train.Train_ID ORDER BY Train.Train_ID;";
//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet RightJoin() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            // String query = "SELECT Stations.Station_ID, Tracks.Average_Track_Speed_Limit, Tracks.Track_type FROM Tracks RIGHT JOIN Stations ON Tracks.Station_start_ID=Stations.Station_ID ORDER BY Tracks.Average_Track_Speed_Limit;";
            String query = "SELECT Train.Train_ID, Passenger.coach, Passenger.seat FROM Passenger RIGHT JOIN Train ON Passenger.Train_ID=Train.Train_ID ORDER BY Train.Train_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet UNION() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            //String query = "SELECT * FROM Stations LEFT JOIN Tracks ON Stations.Station_ID=Tracks.Station_start_ID UNION SELECT * FROM Stations RIGHT JOIN Tracks ON Stations.Station_ID=Tracks.Station_start_ID";
            String query = "SELECT * FROM Passenger LEFT JOIN Train ON Passenger.Train_ID=Train.Train_ID UNION SELECT * FROM Passenger RIGHT JOIN Train ON Passenger.Train_ID=Train.Train_ID;";

//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet In() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            String query = "SELECT * FROM `Train`\n"
                    + "WHERE Train_ID IN ('1', '3', '5');";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

    @Override
    public ResultSet SelfJoin() throws ClassNotFoundException, SQLException {
        //Creates the connection object
        Connection con;
        //creates the resulset object to be returned. 
        ResultSet rs = null;
        try {
            con = this.getConnection();
            //String query = "SELECT Station_ID AS Station_ID1, Station_start_ID AS Station_ID2, A.Station_name FROM Stations A, Tracks B WHERE A.Station_ID <> B.Station_start_ID ORDER BY A.Station_name";

            String query = "SELECT Passenger_ID AS Passenger_ID1,Train_name AS Train_name2, A.passenger_name FROM Passenger A, Train B WHERE A.Passenger_ID <> B.Train_name ORDER BY A.Passenger_ID;";
//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

}
