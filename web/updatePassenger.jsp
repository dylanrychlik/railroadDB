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
        String Passenger_ID = request.getParameter("id");
        String Train_ID = request.getParameter("Train_ID");
        String Date = request.getParameter("Date");
        String from_station = request.getParameter("from_station");
         String to_station = request.getParameter("to_station");
        String coach = request.getParameter("coach");
        String seat = request.getParameter("seat");
        String passenger_name = request.getParameter("passenger_name");
      
         //Creates a Transaction object referenced in the backend
        Passenger passenger = new Passenger(Passenger_ID, Train_ID, Date, from_station,to_station,coach,seat,passenger_name);
        passenger.Update(Passenger_ID, Train_ID, Date, from_station,to_station,coach,seat,passenger_name);


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
        <h1>Station Update</h1>


        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >

                    <%  
                         //Creates a resultset object to read the MySQL query. 
                        ResultSet rs;
                        //Calls the id parameter which referenced the id of the record we want to update.
                        String id = request.getParameter("id");
                         //Creates an enity object to be assigned to the Transaction object using polymorphism. 
                        Enity passenger = new Passenger();
                         
                        rs = passenger.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>

   <div alight="left">
                        <label class="form-label">Train ID</label>
                        <input type="text" class="form-control" placeholder="Train_ID" name="Train_ID" value="<%= rs.getInt("Train_ID")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Date</label>
                        <input type="text" class="form-control" placeholder="Date" name="Date" id="Date" value="<%= rs.getDate("Date")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">from station</label>
                        <input type="text" class="form-control" placeholder="from_station" name="from_station" id="from_station" value="<%= rs.getInt("from_station")%>" required >
                    </div>
                       <div alight="left">
                        <label class="form-label">to station</label>
                        <input type="text" class="form-control" placeholder="to_station" name="to_station" value="<%= rs.getInt("to_station")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">coach</label>
                        <input type="text" class="form-control" placeholder="coach" name="coach" id="coach" value="<%= rs.getInt("Date")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">seat</label>
                        <input type="text" class="form-control" placeholder="seat" name="seat" id="seat" value="<%= rs.getInt("seat")%>" required >
                    </div>

                  <div alight="left">
                        <label class="form-label">passenger name</label>
                        <input type="text" class="form-control" placeholder="passenger_name" name="passenger_name" id="passenger_name" value="<%= rs.getString("passenger_name")%>" required >
                    </div>

                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexPassenger.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>