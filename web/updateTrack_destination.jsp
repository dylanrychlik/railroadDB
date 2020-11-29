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
        String Track_ID = request.getParameter("id");
        String Station_destination_ID = request.getParameter("Station_destination_ID");
            //Creates a Transaction object referenced in the backend
        Track_destination track_destination = new Track_destination(Track_ID,Station_destination_ID);
         //Calls the MySQL update method. 
        track_destination.Update(Track_ID, Station_destination_ID);


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
                        Enity track_destination = new Track_destination();
                         
                        rs = track_destination.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>


                    <div alight="left">
                        <label class="form-label">Station name</label>
                        <input type="text" class="form-control" placeholder="Station_destination_ID" name="Station_destination_ID" value="<%= rs.getInt("Station_destination_ID")%>" id="Station_destination_ID" required >
                    </div>

            

                 

                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexTrack_destination.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>