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
public class Passenger extends Enity {

    //private String Station_ID;
    private String Train_ID;
    private String Date;
    private String from_station;
    private String to_station;
    private String coach;
    private String seat;
    private String passenger_name;

    public Passenger(String Passenger_ID, String Train_ID, String Date, String from_station, String to_station, String coach, String seat, String passenger_name) {
        super(Passenger_ID);
        this.Train_ID = Train_ID;
        this.Date = Date;
        this.from_station = from_station;
        this.to_station = to_station;
        this.coach = coach;
        this.seat = seat;
        this.passenger_name = passenger_name;
    }
//empty contructor

    public Passenger() {

        this.Train_ID = "";
        this.Date = "";
        this.from_station = "";
        this.to_station = "";
        this.coach = "";
        this.seat = "";
        this.passenger_name = "";

    }

    public void Update(String Passenger_ID, String Train_ID, String Date, String from_station, String to_station, String coach, String seat, String passenger_name) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "UPDATE `Passenger` SET `Train_ID`='" + Train_ID + "',`Date` ='" + Date + "', `from_station`= '" + from_station + "', `to_station`= '" + to_station + "',`coach` ='" + coach + "', `seat`= '" + seat + "', `passenger_name`= '" + passenger_name + "' WHERE `Passenger_ID`='" + Passenger_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Delete(String Passenger_ID) throws ClassNotFoundException, SQLException {
        //Create a connection object
        Connection con;

        con = this.getConnection();
        //Creates a staement
        Statement st = con.createStatement();
        //SQL for update
        String sql = "DELETE FROM `Passenger` WHERE `Passenger_ID`='" + Passenger_ID + "';";
        //Executes the SQL
        st.executeUpdate(sql);

    }

    public void Add(String Passenger_ID, String Train_ID, String Date, String from_station, String to_station, String coach, String seat, String passenger_name) throws ClassNotFoundException, SQLException {
        //Creates a connection object
        Connection con;
        //Creates a prepared statement. 
        PreparedStatement pst;
        //Connects to the remote Database
        con = this.getConnection();
        //SQL for add
        pst = con.prepareStatement("INSERT INTO Passenger (Passenger_ID, Train_ID, Date, from_station,to_station,coach, seat,passenger_name)values(?,?,?,?,?,?,?,?)");
        //sets the variables for add
        pst.setString(1, Passenger_ID);
        pst.setString(2, Train_ID);
        pst.setString(3, Date);
        pst.setString(4, from_station);
        pst.setString(5, to_station);
        pst.setString(6, coach);
        pst.setString(7, seat);
        pst.setString(8, passenger_name);

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
            pst = con.prepareStatement("SELECT * FROM Passenger where Passenger_ID = ?");
            //set the variables for sql statement
            pst.setString(1, id);
            //executes the query
            rs = pst.executeQuery();
        } //catches  
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM Passenger";
            //Creates a statement
            Statement st = con.createStatement();
            //Execute the SQL
            rs = st.executeQuery(query);

        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Passenger_ID)\n"
                    + "FROM `Passenger`;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT MIN(coach) AS Smallest_coach FROM Passenger;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT MAX(coach) AS Largest_coach\n"
                    + "FROM Passenger;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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

            String query = "SELECT SUM(coach)\n"
                    + "FROM Passenger;";

            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT AVG(coach)\n"
                    + "FROM Passenger;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT COUNT(Passenger_ID), coach\n"
                    + "FROM `Passenger` GROUP BY coach;";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT SUM(Passenger_ID), coach FROM `Passenger` GROUP BY coach HAVING SUM(Passenger_ID) > 5";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            String query = "SELECT * FROM `Passenger`\n"
                    + "WHERE Train_ID IN ('1', '3', '5');";
            //Creates a statement
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        } //catches
        catch (ClassNotFoundException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Passenger.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("Size"+rs.getf);
        return rs;
    }

}
