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
public class Train_schedule extends Enity {

    //private String Station_ID;
    private String Schedule_ID;
    private String Train_ID;
    private String Track_ID;
    private String Station_Start;
    private String Station_Destination;
    private String Route_location_start;
    private String Route_location_destination;
    private String Timein;
    private String Timeout;
    private String Schedule_Sequence_no;

    public Train_schedule(String Schedule_ID, String Train_ID, String Track_ID, String Station_Start, String Route_location_start,String Station_Destination, String Route_location_destination, String Timein, String Timeout, String Schedule_Sequence_no) {
        super(Schedule_ID);
        this.Train_ID = Train_ID;
        this.Track_ID = Track_ID;
        this.Station_Start = Station_Start;
        this.Station_Destination = Station_Destination;
        this.Route_location_start = Route_location_start;
        this.Route_location_destination = Route_location_destination;
        this.Timein = Timein;
        this.Timeout = Timeout;
        this.Schedule_Sequence_no = Schedule_Sequence_no;
    }
//empty contructor

    public Train_schedule() {

        this.Schedule_ID = "";
        this.Train_ID = "";
        this.Track_ID = "";
        this.Station_Start = "";
        this.Station_Destination = "";
        this.Route_location_start = "";
        this.Route_location_destination = "";
        this.Timein = "";
        this.Timeout = "";
        this.Schedule_Sequence_no = "";

    }

    public void Update(String Schedule_ID, String Train_ID, String Track_ID, String Station_Start, String Station_Destination,String Route_location_start, String Route_location_destination, String Timein, String Timeout, String Schedule_Sequence_no) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "UPDATE `Train_schedules` SET `Train_ID`=" +Train_ID + ",`Track_ID` =" +Track_ID + ", `Station_Start`= " +Station_Start + ", `Station_Destination`= 2,`Route_location_start` ='"+ Route_location_start + "',`Route_location_destination` ='"+ Route_location_destination + "', `Timein`= '"+ Timein + "', `Timeout`= '"+ Timeout + "', `Schedule_Sequence_no`= " +Schedule_Sequence_no +" WHERE `Schedule_ID`=" + Schedule_ID;
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Delete(String Schedule_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "DELETE FROM `Train_schedules` WHERE `Schedule_ID`='" + Schedule_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Add(String Schedule_ID, String Train_ID, String Track_ID, String Station_Start, String Station_Destination,String Route_location_start, String Route_location_destination, String Timein, String Timeout, String Schedule_Sequence_no) throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        //Creates a prepared statement. 
        PreparedStatement pst;
        //Connects to the remote Database
        con = this.getConnection();
        //SQL for add
        pst = con.prepareStatement("INSERT INTO Train_schedules (Schedule_ID, Train_ID, Track_ID, Station_Start, Station_Destination, Route_location_start, Route_location_destination, Timein, Timeout, Schedule_Sequence_no)values(?,?,?,?,?,?,?,?,?,?)");
        //sets the variables for add
        pst.setString(1, Schedule_ID);
        pst.setString(2, Train_ID);
        pst.setString(3, Track_ID);
        pst.setString(4, Station_Start);
        pst.setString(5, Station_Destination);
        pst.setString(6, Route_location_start);
        pst.setString(7, Route_location_destination);
        pst.setString(8, Timein);
        pst.setString(9, Timeout);
        pst.setString(10, Schedule_Sequence_no);

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
            pst = con.prepareStatement("SELECT * FROM Train_schedules where Schedule_ID = ?");
            //set the variables for sql statement
            pst.setString(1, id);
            //executes the query
            rs = pst.executeQuery();
        } //catches  
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Train_schedules";
            //Creates a statement
            Statement st = con.createStatement();
            //Execute the SQL
            rs = st.executeQuery(query);

        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Schedule_ID)\n"
                    + "FROM `Train_schedules`;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Schedule_ID), Route_location_destination\n"
                    + "FROM `Train_schedules` GROUP BY Route_location_destination;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT SUM(Schedule_ID), Route_location_destination FROM `Train_schedules` GROUP BY Route_location_destination HAVING SUM(Schedule_ID) > 5";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT Track_destination.Track_ID, Train_schedules.Train_ID, Train_schedules.Track_ID FROM Train_schedules INNER JOIN Track_destination ON Train_schedules.Track_ID=Track_destination.Track_ID;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM `Train_schedules`\n"
                    + "WHERE Schedule_ID IN ('1', '3', '5');";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
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

            String query = "SELECT Train_ID AS Train_ID1, Station_destination_ID AS Station_destination_ID2, B.Station_destination_ID FROM Train_schedules A, Track_destination B WHERE A.Train_ID <> A.Track_ID ORDER BY B.Station_destination_ID2";
//Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Train_schedule.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

}
