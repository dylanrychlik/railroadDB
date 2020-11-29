<%-- 
    Document   : update
    Created on : Aug 8, 2020, 12:56:20 PM
    Author     : drych
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 

<%
    //If submit button is clicked
    if (request.getParameter("submit") != null) {
        //Uses strings to request the parameters of the input textfields. 
        String Schedule_ID = request.getParameter("id");
        String Train_ID = request.getParameter("Train_ID");
        String Track_ID = request.getParameter("Track_ID");
        String Station_Start = request.getParameter("Station_Start");
        String Station_Destination = request.getParameter("Station_Destination");
        String Route_location_start = request.getParameter("Route_location_start");
        String Route_location_destination = request.getParameter("Route_location_destination");
        String Timein = request.getParameter("Timein");
        String Timeout = request.getParameter("Timeout");
        String Schedule_Sequence_no = request.getParameter("Schedule_Sequence_no");
        System.out.println("Paramter 1:" + Schedule_ID);
        System.out.println("Paramter 2:" + Train_ID);
        System.out.println("Paramter 3:" + Track_ID);
        System.out.println("Paramter 4:" + Station_Start);
        System.out.println("Paramter 5:" + Station_Destination);
        System.out.println("Paramter 6:" + Route_location_start);
        System.out.println("Paramter 7:" + Route_location_destination);
        System.out.println("Paramter 8:" + Timein);
        System.out.println("Paramter 9:" + Timeout);
        System.out.println("Paramter 10:" + Schedule_Sequence_no);

        //Creates a Transaction object referenced in the backend
        Train_schedule train_schedule = new Train_schedule(Schedule_ID, Train_ID, Track_ID, Station_Start, Station_Destination, Route_location_start, Route_location_destination, Timein, Timeout, Schedule_Sequence_no);
        //Calls the MySQL update method. 
        train_schedule.Update(Schedule_ID, Train_ID, Track_ID, Station_Start, Station_Destination, Route_location_start, Route_location_destination, Timein, Timeout, Schedule_Sequence_no);


%>

<script>
    alert("Record Updated!");
</script>
<%        }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Train schedule Update</h1>


        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >

                    <%                        //Creates a resultset object to read the MySQL query. 
                        ResultSet rs;
                        //Calls the id parameter which referenced the id of the record we want to update.
                        String id = request.getParameter("id");
                        //Creates an enity object to be assigned to the Transaction object using polymorphism. 
                        Enity train_schedule = new Train_schedule();

                        rs = train_schedule.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>



                    <div alight="left">
                        <label class="form-label">Train ID</label>
                        <input type="text" class="form-control" placeholder="Train_ID" name="Train_ID" id="Train_ID" value="<%= rs.getInt("Train_ID")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Track ID</label>
                        <input type="text" class="form-control" placeholder="Track_ID" name="Track_ID" id="Track_ID" value="<%= rs.getInt("Track_ID")%>" required >
                    </div>
                    <div alight="left">
                        <label class="form-label">Station Start</label>
                        <input type="text" class="form-control" placeholder="Station_Start" name="Station_Start" value="<%= rs.getInt("Station_Start")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Station Destination</label>
                        <input type="text" class="form-control" placeholder="Station_Destination" name="Station_Destination" id="Station_Destination" value="<%= rs.getInt("Station_Destination")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Route location start</label>
                        <input type="text" class="form-control" placeholder="Route_location_start" name="Route_location_start" id="Route_location_start" value="<%= rs.getString("Route_location_start")%>" required >
                    </div>
                    <div alight="left">
                        <label class="form-label">Route location destination</label>
                        <input type="text" class="form-control" placeholder="Route_location_destination" name="Route_location_destination" id="Route_location_destination" value="<%= rs.getString("Route_location_destination")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Time in:</label>
                        <input type="text" class="form-control" placeholder="Timein" name="Timein" id="Timein" value="<%= rs.getString("Timein")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Time out:</label>
                        <input type="text" class="form-control" placeholder="Timeout" name="Timeout" id="Timeout" value="<%= rs.getString("Timeout")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Schedule Sequence number:</label>
                        <input type="text" class="form-control" placeholder="Schedule_Sequence_no" name="Schedule_Sequence_no" id="Schedule_Sequence_no" value="<%= rs.getInt("Schedule_Sequence_no")%>" required >
                    </div>


                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexTrain_schedule.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>