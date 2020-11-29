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
public class Track_destination extends Enity {

    //private String Station_ID;
    private String Track_ID;
    private String Station_Destination_ID;

    public Track_destination(String Track_ID, String Station_Destination_ID) {
        super(Track_ID);
        this.Station_Destination_ID = Station_Destination_ID;

    }
//empty contructor

    public Track_destination() {
        this.Track_ID = "";
        this.Station_Destination_ID = "";
    }

    public void Update(String Track_ID, String Station_Destination_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "UPDATE `Track_destination` SET `Station_Destination_ID`='" + Station_Destination_ID + "' WHERE `Track_ID`='" + Track_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Delete(String Track_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "DELETE FROM `Track_destination` WHERE `Track_ID`='" + Track_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Add(String Track_ID, String Station_Destination_ID) throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        //Creates a prepared statement. 
        PreparedStatement pst;
        //Connects to the remote Database
        con = this.getConnection();
        //SQL for add
        pst = con.prepareStatement("INSERT INTO Track_destination (Track_ID, Station_Destination_ID)values(?,?)");
        //sets the variables for add
        pst.setString(1, Track_ID);
        pst.setString(2, Station_Destination_ID);
      

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
            pst = con.prepareStatement("SELECT * FROM Track_destination where Track_ID = ?");
            //set the variables for sql statement
            pst.setString(1, id);
            //executes the query
            rs = pst.executeQuery();
        } //catches  
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Track_destination";
            //Creates a statement
            Statement st = con.createStatement();
            //Execute the SQL
            rs = st.executeQuery(query);

        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Track_ID)\n"
                    + "FROM `Track_destination`;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Track_ID), Station_destination_ID\n"
                    + "FROM `Track_destination` GROUP BY Station_destination_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT SUM(Track_ID), Station_destination_ID FROM `Track_destination` GROUP BY Station_destination_ID HAVING SUM(Track_ID) > 5";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Track_destination.Track_ID, Train_schedules.Train_ID, Train_schedules.Track_ID FROM Train_schedules INNER JOIN Track_destination ON Train_schedules.Track_ID=Track_destination.Track_ID";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Track_destination.Track_ID, Train_schedules.Train_ID, Train_schedules.Track_ID FROM Train_schedules LEFT JOIN Track_destination ON Train_schedules.Track_ID=Track_destination.Track_ID;";
//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Track_destination.Track_ID, Train_schedules.Train_ID, Train_schedules.Track_ID FROM Train_schedules RIGHT JOIN Track_destination ON Train_schedules.Track_ID=Track_destination.Track_ID ORDER BY Track_destination.Track_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Train_schedules LEFT JOIN Track_destination ON Train_schedules.Track_ID=Track_destination.Track_ID UNION SELECT * FROM Train_schedules RIGHT JOIN Track_destination ON Track_destination.Track_ID=Train_schedules.Track_ID;";

//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM `Track_destination`\n"
                    + "WHERE Track_ID IN ('1', '3', '5');";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
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

            String query = "SELECT Train_ID AS Train_ID1, Station_destination_ID AS Station_destination_ID2, B.Station_destination_ID FROM Train_schedules A, Track_destination B WHERE A.Train_ID <> A.Track_ID ORDER BY B.Station_destination_ID";
//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Track_destination.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

}
