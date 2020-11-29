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
        String Track_ID = request.getParameter("Track_ID");
        String Track_Length = request.getParameter("Track_Length");
        String Track_type = request.getParameter("Track_type");
        String Average_Track_Speed_Limit = request.getParameter("Average_Track_Speed_Limit");
        String Station_start_ID = request.getParameter("Station_start_ID");

        //Creates a transaction object referenced in the backend
        Tracks track = new Tracks(Track_ID, Track_Length, Track_type, Average_Track_Speed_Limit, Station_start_ID);
        //Calls the MySQL add method. 
        track.Add(Track_ID, Track_Length, Track_type, Average_Track_Speed_Limit, Station_start_ID);
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
    <h1>Track SQL manipulation using-JSP</h1>
    </br>
    <div class="row">
        <div class="col-sm-4">
            <form  method="POST" action="#" > 



                <div alight="left">
                    <label class="form-label">Track Length</label>
                    <input type="text" class="form-control" placeholder="Track_Length" name="Track_Length" id="Track_Length" required >
                </div>

                <div alight="left">
                    <label class="form-label">Track type</label>
                    <input type="text" class="form-control" placeholder="Track_type" name="Track_type" id="Track_type" required >
                </div>

                <div alight="left">
                    <label class="form-label">Average Track Speed Limit</label>
                    <input type="text" class="form-control" placeholder="Average_Track_Speed_Limit" name="Average_Track_Speed_Limit" id="Average_Track_Speed_Limit" required >
                </div>

                <div alight="left">
                    <label class="form-label">Station start ID</label>
                    <input type="text" class="form-control" placeholder="Station_start_ID" name="Station_start_ID" id="Station_start_ID" required >
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

                            <th>Track Length</th>
                            <th>Track type</th>
                            <th>Average Track Speed Limit</th>
                            <th>Station start ID</th>
                            <th>Edit</th>
                            <th>Delete</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity track = new Tracks();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = track.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                String id = rs.getString("Track_ID");
                        %>

                        <tr>

                            <td><%=rs.getString("Track_Length")%></td>
                            <td><%=rs.getString("Track_type")%></td>
                            <td><%=rs.getString("Average_Track_Speed_Limit")%></td>
                            <td><%=rs.getString("Station_start_ID")%></td>
                            <td><a href="updateTracks.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="deleteTracks.jsp?id=<%=id%>">Delete</a></td>

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
                        <option value="countStation">Count number of Stations</option>
                        <option value="countStation">Count number of Stations</option>
                        <option value="countStation">Count number of Stations</option>
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
                    <tr><a href="countTracks.jsp">Count number of Tracks</a></tr><br><br>
                    <tr><a href="avgTracks.jsp">Average number of Tracks</a></tr><br><br>
                    <tr><a href="minTracks.jsp">Minimum number of Tracks</a></tr><br><br>
                    <tr><a href="maxTracks.jsp">Maximum number of Tracks</a></tr><br><br>
                    <tr><a href="sumTracks.jsp">Sum of Tracks</a></tr><br><br>
                    <tr><a href="groupbyTracks.jsp">Group by of Track via Track Length</tr><br><br>
                        <tr><a href="havingTracks.jsp">Number of Tracks by Track Length having an ID greater than 5:</tr><br><br>
                            <tr><a href="joinTracks.jsp">Join of stations and tracks</tr><br><br>
                                <tr><a href="leftjoinTracks.jsp">Left Join of stations and tracks</tr><br><br>
                                    <tr><a href="rightjoinTracks.jsp">Right Join of stations and tracks</tr><br><br>
                                        <tr><a href="unionTracks.jsp">Union of stations and tracks</tr><br><br>
                                            <tr><a href="selfjoinTracks.jsp">Self Join of stations and tracks</tr><br><br>
                                                <tr><a href="inTracks.jsp">In of stations and tracks</tr><br><br>
                                                    </table>
                                                    </div>
                                                    </div>  
                                                    </div>

                                                    </body>
                                                    </html>