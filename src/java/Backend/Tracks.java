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
public class Tracks extends Enity {

    //private String Station_ID;
    private String Track_Length;
    private String Track_type;
    private String Average_Track_Speed_Limit;
    private String Station_start_ID;

    public Tracks(String Track_ID, String Track_Length, String Track_type, String Average_Track_Speed_Limit, String Station_start_ID) {
        super(Track_ID);
        this.Track_Length = Track_Length;
        this.Track_type = Track_type;
        this.Average_Track_Speed_Limit = Average_Track_Speed_Limit;
        this.Station_start_ID = Station_start_ID;
    }
//empty contructor

    public Tracks() {

        this.Track_Length = "";
        this.Track_type = "";
        this.Average_Track_Speed_Limit = "";
        this.Station_start_ID = "";

    }

    public void Update(String Track_ID, String Track_Length, String Track_type, String Average_Track_Speed_Limit, String Station_start_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "UPDATE `Tracks` SET `Track_Length`='" + Track_Length + "',`Track_type` ='" + Track_type + "', `Average_Track_Speed_Limit`= '" + Average_Track_Speed_Limit + "', `Station_start_ID`= '" + Station_start_ID + "' WHERE `Track_ID`='" + Track_ID + "';";
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
        String sql = "DELETE FROM `Tracks` WHERE `Track_ID`='" + Track_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Add(String Track_ID, String Track_Length, String Track_type, String Average_Track_Speed_Limit, String Station_start_ID) throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        //Creates a prepared statement. 
        PreparedStatement pst;
        //Connects to the remote Database
        con = this.getConnection();
        //SQL for add
        pst = con.prepareStatement("INSERT INTO Tracks (Track_ID, Track_Length, Track_type, Average_Track_Speed_Limit,Station_start_ID)values(?,?,?,?,?)");
        //sets the variables for add
        pst.setString(1, Track_ID);
        pst.setString(2, Track_Length);
        pst.setString(3, Track_type);
        pst.setString(4, Average_Track_Speed_Limit);
        pst.setString(5, Station_start_ID);

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
            pst = con.prepareStatement("SELECT * FROM Tracks where Track_ID = ?");
            //set the variables for sql statement
            pst.setString(1, id);
            //executes the query
            rs = pst.executeQuery();
        } //catches  
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Tracks";
            //Creates a statement
            Statement st = con.createStatement();
            //Execute the SQL
            rs = st.executeQuery(query);

        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
                    + "FROM `Tracks`;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT MIN(Average_Track_Speed_Limit) AS Smallest_Track_Speed_Limit\n"
                    + "FROM Tracks;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT MAX(Average_Track_Speed_Limit) AS Largest_Track_Speed_Limit\n"
                    + "FROM Tracks;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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

            String query = "SELECT SUM(Average_Track_Speed_Limit)\n"
                    + "FROM Tracks;";

            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
             String query = "SELECT AVG(Average_Track_Speed_Limit)\n"
                + "FROM Tracks;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Track_ID), Track_Length\n"
                    + "FROM `Tracks` GROUP BY Track_Length;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT SUM(Track_ID), Track_Length FROM `Tracks` GROUP BY Track_Length HAVING SUM(Track_ID) > 5";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Stations.Station_ID, Tracks.Average_Track_Speed_Limit, Tracks.Station_start_ID FROM Tracks INNER JOIN Stations ON Tracks.Station_start_ID=Stations.Station_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Stations.Station_ID, Tracks.Average_Track_Speed_Limit FROM Tracks LEFT JOIN Stations ON Tracks.Station_start_ID=Stations.Station_ID ORDER BY Tracks.Average_Track_Speed_Limit;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Stations.Station_ID, Tracks.Average_Track_Speed_Limit, Tracks.Track_type FROM Tracks RIGHT JOIN Stations ON Tracks.Station_start_ID=Stations.Station_ID ORDER BY Tracks.Average_Track_Speed_Limit;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Stations LEFT JOIN Tracks ON Stations.Station_ID=Tracks.Station_start_ID UNION SELECT * FROM Stations RIGHT JOIN Tracks ON Stations.Station_ID=Tracks.Station_start_ID";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM `Tracks`\n"
                    + "WHERE Track_Length IN ('10 Miles', '50 Miles', '100 Miles');";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Station_ID AS Station_ID1, Station_start_ID AS Station_ID2, A.Station_name FROM Stations A, Tracks B WHERE A.Station_ID <> B.Station_start_ID ORDER BY A.Station_name";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tracks.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

}
