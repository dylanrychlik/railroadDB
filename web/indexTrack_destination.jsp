<%-- 
    Document   : index
    Created on : Aug 6, 2020, 8:38:22 PM
    Author     : Dylan Rychlik
--%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
//If submit button is clicked
    if (request.getParameter("submit") != null) {
         //Uses strings to request the parameters of the input textfields. 
        String Track_ID = request.getParameter("id");
        String Station_destination_ID = request.getParameter("Station_destination_ID");
       System.out.println("Track id: "+ Track_ID);
      
         //Creates a Transaction object referenced in the backend
        Track_destination track_destination = new Track_destination(Track_ID,Station_destination_ID);
         //Calls the MySQL update method. 
//Calls the MySQL add method. 
        track_destination.Add(Track_ID,Station_destination_ID);
%> 
<script>
    alert("Record Addded!");
</script> 
<%        }
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
<a href="index.html" class="Home">Go to home page</a>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="Style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <style>


        .Home {
            margin-top: 5px;
            margin-left:  220px;
            text-align: center;
            font-size: 20px;
            color: #1E90FF;
            margin-right: 250px;


        }
        .Client {
            margin-top: 5px;
            margin-left: 200px;
            font-size: 20px;
            color: #1E90FF;
            text-align: center;


        }


    </style>
    <h1>Track destination SQL manipulation using-JSP</h1>
    </br>
    <div class="row">
        <div class="col-sm-4">
            <form  method="POST" action="#" > 



                <div alight="left">
                    <label class="form-label">Station destination ID</label>
                    <input type="text" class="form-control" placeholder="Station_destination_ID" name="Station_destination_ID" id="Station_destination_ID" required >
                </div>

             
                </br>

                <div alight="right">
                    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                </div>  

            </form>
        </div>

        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-station" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Station destination ID</th>
                            <th>Edit</th>
                            <th>Delete</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                        Enity track_destination = new Track_destination();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = track_destination.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                String id = rs.getString("Track_ID");
                        %>

                        <tr>

                            <td><%=rs.getString("Station_destination_ID")%></td>
                            <td><a href="updateTrack_destination.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="deleteTrack_destination.jsp?id=<%=id%>">Delete</a></td>

                        </tr> 


                        <%

                            }
                        %>

                </table>    
            </div>


        </div>  
        <div class="Dropdown">
           <div class="panel-body">

                <!--  
                <form>
                    <label for="Station">Choose a SQL Statistic</label>
                    <select name="Station" onchange="javascript:handleSelect(this)"> 
                        <option value="countStation">Count number of Stations</option>
                        <option value="Group by">Group by of Stations via Cities</option>
                        <option value="Having">Having of stations</option>
                        <option value="Join">Join of stations and tracks</option>
                        <option value="Left Join">Left Join of stations and tracks</option>
                        <option value="Right Join">Right Join of stations and tracks</option>
                        <option value="Union">Union of stations and tracks</option>
                        <option value="Self Join">Self Join of stations and tracks</option>
                        <option value="In">In of stations and tracks</option>
                    </select>
                </form>-->
                <h3>Choose a SQL Statistic</h3>
                <table id="tb2-station" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                   <tr><a href="countTrack_destination.jsp">Count number of Track destination</a></tr><br><br>
                    <tr><a href="groupbyTrack_destination.jsp">Group by of Track destination via Station_destination_ID</tr><br><br>
                    <tr><a href="havingTrack_destination.jsp">Number of Track destinatio by Station_destination_ID having an ID greater than 5:</tr><br><br>
                    <tr><a href="joinTrack_destination.jsp">Join of Track destination and train schedule</tr><br><br>
                    <tr><a href="leftjoinTrack_destination.jsp">Left Join of Track destination and train schedules</tr><br><br>
                    <tr><a href="rightjoinTrack_destination.jsp">Right Join of  Track destination and train schedule</tr><br><br>
                    <tr><a href="unionTrack_destination.jsp">Union of Track destination and train schedule</tr><br><br>
                    <!--<tr><a href="selfjoinStation.jsp">Self Join of stations and tracks</tr><br><br>-->
                    <tr><a href="inTrack_destination.jsp">In of track destination and train schedul</tr><br><br>
                </table>
            </div>
        </div>  
    </div>

</body>
</html>