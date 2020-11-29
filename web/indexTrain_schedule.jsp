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
        System.out.println("Test: " + Schedule_Sequence_no);

        //Creates a Transaction object referenced in the backend
        Train_schedule train_schedule = new Train_schedule(Schedule_ID, Train_ID, Track_ID, Station_Start, Station_Destination, Route_location_start, Route_location_destination, Timein, Timeout, Schedule_Sequence_no);
//Calls the MySQL add method. 
        train_schedule.Add(Schedule_ID, Train_ID, Track_ID, Station_Start, Station_Destination, Route_location_start, Route_location_destination, Timein, Timeout, Schedule_Sequence_no);
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
    <h1>Train schedule Create and Update using-JSP</h1>
    </br>
    <div class="row">
        <div class="col-sm-4">
            <form  method="POST" action="#" > 
                <div alight="left">
                    <label class="form-label">Train ID</label>
                    <input type="text" class="form-control" placeholder="Train_ID" name="Train_ID" id="Train_ID" required >
                </div>

                <div alight="left">
                    <label class="form-label">Track ID</label>
                    <input type="text" class="form-control" placeholder="Track_ID" name="Track_ID" id="Track_ID" required >
                </div>

                <div alight="left">
                    <label class="form-label">Station Start</label>
                    <input type="text" class="form-control" placeholder="Station_Start" name="Station_Start" id="Station_Start" required >
                </div>

                <div alight="left">
                    <label class="form-label">Station Destination</label>
                    <input type="text" class="form-control" placeholder="Station_Destination" name="Station_Destination" id="Station_Destination" required >
                </div>
                <div alight="left">
                    <label class="form-label">Route location start</label>
                    <input type="text" class="form-control" placeholder="Route_location_start" name="Route_location_start" id="Route_location_start" required >
                </div>

                <div alight="left">
                    <label class="form-label">Route location destination</label>
                    <input type="text" class="form-control" placeholder="Route_location_destination" name="Route_location_destination" id="Route_location_destination" required >
                </div>

                <div alight="left">
                    <label class="form-label">Time in:</label>
                    <input type="text" class="form-control" placeholder="Timein" name="Timein" id="Timein" required >
                </div>

                <div alight="left">
                    <label class="form-label">Time out</label>
                    <input type="text" class="form-control" placeholder="Timeout" name="Timeout" id="Timeout" required >
                </div>

                <div alight="left">
                    <label class="form-label">Schedule Sequence no</label>
                    <input type="text" class="form-control" placeholder="Schedule_Sequence_no" name="Schedule_Sequence_no" id="Schedule_Sequence_no" required >
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


                            <th>Train_ID</th>
                            <th>Track ID</th>
                            <th>Station Start</th>
                            <th>Station Destination</th>
                            <th>Route location start</th>
                            <th>Route location destination</th>
                            <th>Time in:</th>
                            <th>Time out:</th>
                            <th>Schedule_Sequence_no</th>
                            <th>Delete</th>
                            <th>Edit</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train_schedule = new Train_schedule();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train_schedule.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int id = rs.getInt("Schedule_ID");
                        %>

                        <tr>

                            <td><%=rs.getInt("Train_ID")%></td>


                            <td><%=rs.getInt("Track_ID")%></td>

                            <td><%=rs.getInt("Station_Start")%></td>
                            <td><%=rs.getInt("Station_Destination")%></td>

                            <td><%=rs.getString("Route_location_start")%></td>
                            <td><%=rs.getString("Route_location_destination")%></td>


                            <td><%=rs.getString("Timein")%></td>
                            <td><%=rs.getString("Timeout")%></td>

                            <td><%=rs.getInt("Schedule_Sequence_no")%></td>


                            <td><a href="deleteTrain_schedule.jsp?id=<%=id%>">Delete</a></td>
                            <td><a href="updateTrain_schedule.jsp?id=<%=id%>">Edit</a></td>


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
                    <tr><a href="countTrain_schedule.jsp">Count number of Train schedules</a></tr><br><br>
                    <tr><a href="groupbyTrain_schedule.jsp">Group by of Train via Train name</tr><br><br>
                        <tr><a href="havingTrain_schedule.jsp">Number of Train by Train name having an ID greater than 5:</tr><br><br>
                            <tr><a href="joinTrain_schedule.jsp">Join of train and passengers</tr><br><br>
                                <tr><a href="leftjoinTrain_schedule.jsp">Left Join of train and passengers</tr><br><br>
                                    <tr><a href="rightjoinTrain_schedule.jsp">Right Join of train and passengers</tr><br><br>
                                        <tr><a href="unionTrain_schedule.jsp">Union of train and passengers</tr><br><br>
                                            <!-- <tr><a href="selfjoinTrain_schedule.jsp">Self Join of train and passengers</tr><br><br>-->

                                            <tr><a href="inTrain_schedule.jsp">In of train and passengers</tr><br><br>
                                                </table>
                                                </div>
                                                </div>  
                                                </div>

                                                </body>
                                                </html>