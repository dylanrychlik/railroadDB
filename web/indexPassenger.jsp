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
        String Passenger_ID = request.getParameter("id");
        String Train_ID = request.getParameter("Train_ID");
        String Date = request.getParameter("Date");
        String from_station = request.getParameter("from_station");
        String to_station = request.getParameter("to_station");
        String coach = request.getParameter("coach");
        String seat = request.getParameter("seat");
        String passenger_name = request.getParameter("passenger_name");

        //Creates a transaction object referenced in the backend
        Passenger passenger = new Passenger(Passenger_ID, Train_ID, Date, from_station, to_station, coach, seat, passenger_name);
//Calls the MySQL add method. 
        passenger.Add(Passenger_ID, Train_ID, Date, from_station, to_station, coach, seat, passenger_name);
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
    <h1>Station Create and Update using-JSP</h1>
    </br>
    <div class="row">
        <div class="col-sm-4">
            <form  method="POST" action="#" > 



                <div alight="left">
                    <label class="form-label">Train ID</label>
                    <input type="text" class="form-control" placeholder="Train_ID" name="Train_ID" id="Train_ID" required >
                </div>

                <div alight="left">
                    <label class="form-label">Date</label>
                    <input type="text" class="form-control" placeholder="Date" name="Date" id="Station_city" required >
                </div>

                <div alight="left">
                    <label class="form-label">from station</label>
                    <input type="text" class="form-control" placeholder="from_station" name="from_station" id="from_station" required >
                </div>
                <div alight="left">
                    <label class="form-label">to station</label>
                    <input type="text" class="form-control" placeholder="to_station" name="to_station" id="to_station" required >
                </div>

                <div alight="left">
                    <label class="form-label">coach</label>
                    <input type="text" class="form-control" placeholder="coach" name="coach" id="coach" required >
                </div>

                <div alight="left">
                    <label class="form-label">seat</label>
                    <input type="text" class="form-control" placeholder="seat" name="seat" id="seat" required >
                </div>
                <div alight="left">
                    <label class="form-label">passenger name</label>
                    <input type="text" class="form-control" placeholder="passenger_name" name="passenger_name" id="passenger_name" required >
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

                            <th>Train ID</th>
                            <th>Date</th>
                            <th>from station</th>
                            <th>to station</th>
                            <th>coach</th>
                            <th>seat</th>
                            <th>passenger name</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity passenger = new Passenger();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = passenger.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int id = rs.getInt("Passenger_ID");
                        %>

                        <tr>

                            <td><%=rs.getInt("Train_ID")%></td>
                            <td><%=rs.getDate("Date")%></td>
                            <td><%=rs.getInt("from_station")%></td>
                            <td><%=rs.getInt("to_station")%></td>
                            <td><%=rs.getInt("coach")%></td>
                            <td><%=rs.getInt("seat")%></td>
                            <td><%=rs.getString("passenger_name")%></td>
                            <td><a href="updatePassenger.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="deletePassenger.jsp?id=<%=id%>">Delete</a></td>

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
                   <tr><a href="countPassenger.jsp">Count number of Passenger</a></tr><br><br>
                    <tr><a href="avgPassenger.jsp">Average number of Passenger</a></tr><br><br>
                    <tr><a href="minPassenger.jsp">Minimum number of Passenger</a></tr><br><br>
                    <tr><a href="maxPassenger.jsp">Maximum number of Passenger</a></tr><br><br>
                    <tr><a href="sumPassenger.jsp">Sum of Passenger</a></tr><br><br>
                    <tr><a href="groupbyPassenger.jsp">Group by of Passenger via coach</tr><br><br>
                        <tr><a href="havingPassenger.jsp">Number of Passenger by coach an ID greater than 5:</tr><br><br>
                            <tr><a href="joinPassenger.jsp">Join of Passenger and Trains</tr><br><br>
                                <tr><a href="leftjoinPassenger.jsp">Left Join of Passenger and Trains</tr><br><br>
                                    <tr><a href="rightjoinPassenger.jsp">Right Join of Passenger and Trains</tr><br><br>
                                        <tr><a href="unionPassenger.jsp">Union of Passenger and Trains</tr><br><br>
                                            <tr><a href="selfjoinPassenger.jsp">Self Join of Passenger and Trains</tr><br><br>
                                                <tr><a href="inPassenger.jsp">In of Passenger and Trains</tr><br><br>
                                                    </table>
                                                    </div>
                                                    </div>  
                                                    </div>

                                                    </body>
                                                    </html>