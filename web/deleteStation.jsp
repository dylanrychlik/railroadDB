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
        String Station_ID = request.getParameter("id");
        String Station_name = request.getParameter("Station_name");
        String Station_city = request.getParameter("Station_city");
        String Station_state = request.getParameter("Station_state");
      
         //Creates a Transaction object referenced in the backend
        Station station = new Station(Station_ID, Station_name, Station_city, Station_state);
         //Calls the MySQL update method. 
        station.Delete(Station_ID);


%>

<script>
    alert("Record Deleted!");
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
        <h1>Station Delete</h1>


        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >

                    <%  
                         //Creates a resultset object to read the MySQL query. 
                        ResultSet rs;
                        //Calls the id parameter which referenced the id of the record we want to update.
                        String id = request.getParameter("id");
                         //Creates an enity object to be assigned to the Transaction object using polymorphism. 
                        Enity station = new Station();
                         
                        rs = station.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>


                    <div alight="left">
                        <label class="form-label">Station name</label>
                        <input type="text" class="form-control" placeholder="Station_name" name="Station_name" value="<%= rs.getString("Station_name")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Station city</label>
                        <input type="text" class="form-control" placeholder="Station_city" name="Station_city" id="Station_city" value="<%= rs.getString("Station_city")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Station state</label>
                        <input type="text" class="form-control" placeholder="Station_state" name="Station_state" id="Station_state" value="<%= rs.getString("Station_state")%>" required >
                    </div>

                 

                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Delete" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexStation.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>