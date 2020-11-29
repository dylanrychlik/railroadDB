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
        String Track_Length = request.getParameter("Track_Length");
        String Track_type = request.getParameter("Track_type");
        String Average_Track_Speed_Limit = request.getParameter("Average_Track_Speed_Limit");
        String Station_start_ID = request.getParameter("Station_start_ID");

        //Creates a Transaction object referenced in the backend
        Tracks tracks = new Tracks(Track_ID, Track_Length, Track_type, Average_Track_Speed_Limit, Station_start_ID);
        //Calls the MySQL update method. 
        tracks.Update(Track_ID, Track_Length, Track_type, Average_Track_Speed_Limit, Station_start_ID);


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
        <h1>Tracks Update</h1>


        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >

                    <%                        //Creates a resultset object to read the MySQL query. 
                        ResultSet rs;
                        //Calls the id parameter which referenced the id of the record we want to update.
                        String id = request.getParameter("id");
                        //Creates an enity object to be assigned to the Transaction object using polymorphism. 
                        Enity tracks = new Tracks();

                        rs = tracks.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>


                    <div alight="left">
                        <label class="form-label">Track Length</label>
                        <input type="text" class="form-control" placeholder="Track_Length" name="Track_Length" value="<%= rs.getString("Track_Length")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Track type</label>
                        <input type="text" class="form-control" placeholder="Track_type" name="Track_type" id="Track_type" value="<%= rs.getString("Track_type")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Average Track Speed Limit</label>
                        <input type="text" class="form-control" placeholder="Average_Track_Speed_Limit" name="Average_Track_Speed_Limit" id="Average_Track_Speed_Limit" value="<%= rs.getString("Average_Track_Speed_Limit")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Station start ID</label>
                        <input type="text" class="form-control" placeholder="Station_start_ID" name="Station_start_ID" id="Station_start_ID" value="<%= rs.getString("Station_start_ID")%>" required >
                    </div>

                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexTracks.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>