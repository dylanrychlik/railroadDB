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
        String Train_ID = request.getParameter("id");
        String Train_name = request.getParameter("Train_name");
        String Train_Model = request.getParameter("Train_Model");
        String Train_make = request.getParameter("Train_make");
        String Train_Max_speed = request.getParameter("Train_Max_speed");
        String Train_Weight = request.getParameter("Train_Weight");
        String Train_Length = request.getParameter("Train_Length");
        String Traffic_type = request.getParameter("Traffic_type");

        //Creates a Transaction object referenced in the backend
        Train train = new Train(Train_ID, Train_name, Train_Model, Train_make, Train_Max_speed, Train_Weight, Train_Length, Traffic_type);
        //Calls the MySQL update method. 
        train.Delete(Train_ID);


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

                    <%                        //Creates a resultset object to read the MySQL query. 
                        ResultSet rs;
                        //Calls the id parameter which referenced the id of the record we want to update.
                        String id = request.getParameter("id");
                        //Creates an enity object to be assigned to the Transaction object using polymorphism. 
                        Enity train = new Train();

                        rs = train.SelectWhere(id);
                        //reads through the result set. Mixed in the html to allow the record to be selected based upon a specified ID. 
                        while (rs.next()) {

                    %>


             

                    <div alight="left">
                        <label class="form-label">Train name</label>
                        <input type="text" class="form-control" placeholder="Train_name" name="Train_name" id="Train_name" value="<%= rs.getString("Train_name")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Train Model</label>
                        <input type="text" class="form-control" placeholder="Train_Model" name="Train_Model" id="Train_Model" value="<%= rs.getString("Train_Model")%>" required >
                    </div>
                    <div alight="left">
                        <label class="form-label">Train make</label>
                        <input type="text" class="form-control" placeholder="Train_make" name="Train_make" value="<%= rs.getString("Train_make")%>" id="course" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Train_Max_speed</label>
                        <input type="text" class="form-control" placeholder="Train_Max_speed" name="Train_Max_speed" id="Train_Max_speed" value="<%= rs.getString("Train_Max_speed")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Train Weight</label>
                        <input type="text" class="form-control" placeholder="Train_Weight" name="Train_Weight" id="Train_Weight" value="<%= rs.getString("Train_Weight")%>" required >
                    </div>
                    <div alight="left">
                        <label class="form-label">Train Length</label>
                        <input type="text" class="form-control" placeholder="Train_Length" name="Train_Length" id="Train_Length" value="<%= rs.getString("Train_Length")%>" required >
                    </div>

                    <div alight="left">
                        <label class="form-label">Traffic type</label>
                        <input type="text" class="form-control" placeholder="Traffic_type" name="Traffic_type" id="Traffic_type" value="<%= rs.getString("Traffic_type")%>" required >
                    </div>


                    <% }%>



                    </br>

                    <div alight="right">
                        <input type="submit" id="submit" value="Delete" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>  

                    <div align="right">

                        <p><a href="indexTrain.jsp">Click Back</a></p>


                    </div>

                </form>
            </div>          
        </div>

    </body>
</html>