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
        String Station_ID = request.getParameter("Station_ID");
        String Station_name = request.getParameter("Station_name");
        String Station_city = request.getParameter("Station_city");
        String Station_state = request.getParameter("Station_state");

        //Creates a transaction object referenced in the backend
        Station station = new Station(Station_ID, Station_name, Station_city, Station_state);
//Calls the MySQL add method. 
        station.Add(Station_ID, Station_name, Station_city, Station_state);
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
    <h1>Station SQL manipulation using-JSP</h1>
    </br>
    <div class="row">
        <div class="col-sm-4">
            <form  method="POST" action="#" > 



                <div alight="left">
                    <label class="form-label">Station name</label>
                    <input type="text" class="form-control" placeholder="Station_name" name="Station_name" id="Station_name" required >
                </div>

                <div alight="left">
                    <label class="form-label">Station city</label>
                    <input type="text" class="form-control" placeholder="Station_city" name="Station_city" id="Station_city" required >
                </div>

                <div alight="left">
                    <label class="form-label">Station state</label>
                    <input type="text" class="form-control" placeholder="Station_state" name="Station_state" id="Station_state" required >
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

                            <th>Station name</th>
                            <th>Station city</th>
                            <th>Station state</th>
                            <th>Edit</th>
                            <th>Delete</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity station = new Station();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = station.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                String id = rs.getString("Station_ID");
                        %>

                        <tr>

                            <td><%=rs.getString("Station_name")%></td>
                            <td><%=rs.getString("Station_city")%></td>
                            <td><%=rs.getString("Station_state")%></td>
                            <td><a href="updateStation.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="deleteStation.jsp?id=<%=id%>">Delete</a></td>

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
                    <tr><a href="countStation.jsp">Count number of Stations</a></tr><br><br>
                    <tr><a href="groupbyStation.jsp">Group by of Stations via Cities</tr><br><br>
                    <tr><a href="havingStation.jsp">Number of stations by city having an ID greater than 5:</tr><br><br>
                    <tr><a href="joinStation.jsp">Join of stations and tracks</tr><br><br>
                    <tr><a href="leftjoinStation.jsp">Left Join of stations and tracks</tr><br><br>
                    <tr><a href="rightjoinStation.jsp">Right Join of stations and tracks</tr><br><br>
                    <tr><a href="unionStation.jsp">Union of stations and tracks</tr><br><br>
                    <tr><a href="selfjoinStation.jsp">Self Join of stations and tracks</tr><br><br>
                    <tr><a href="inStation.jsp">In of stations and tracks</tr><br><br>
                </table>
            </div>
        </div>  
    </div>

</body>
</html>