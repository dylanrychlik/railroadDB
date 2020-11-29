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
//Calls the MySQL add method. 
        train.Add(Train_ID, Train_name, Train_Model, Train_make, Train_Max_speed, Train_Weight, Train_Length, Traffic_type);
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
                    <label class="form-label">Train name</label>
                    <input type="text" class="form-control" placeholder="Train_name" name="Train_name" id="Train_name" required >
                </div>

                <div alight="left">
                    <label class="form-label">Train Model</label>
                    <input type="text" class="form-control" placeholder="Train_Model" name="Train_Model" id="Train_Model" required >
                </div>

                <div alight="left">
                    <label class="form-label">Train make</label>
                    <input type="text" class="form-control" placeholder="Train_make" name="Train_make" id="Train_make" required >
                </div>

                <div alight="left">
                    <label class="form-label">Train_Max_speed</label>
                    <input type="text" class="form-control" placeholder="Train_Max_speed" name="Train_Max_speed" id="Train_Max_speed" required >
                </div>

                <div alight="left">
                    <label class="form-label">Train Weight</label>
                    <input type="text" class="form-control" placeholder="Train_Weight" name="Train_Weight" id="Train_Weight" required >
                </div>
                <div alight="left">
                    <label class="form-label">Train Length</label>
                    <input type="text" class="form-control" placeholder="Train_Length" name="Train_Length" id="Train_Length" required >
                </div>

                <div alight="left">
                    <label class="form-label">Traffic type</label>
                    <input type="text" class="form-control" placeholder="Traffic_type" name="Traffic_type" id="Traffic_type" required >
                </div>s

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

                            <th>Train name</th>
                            <th>Train Model</th>
                            <th>Train make</th>
                            <th>Train Max speed</th>
                            <th>Train Weight</th>
                            <th>Train Length</th>
                            <th>Traffic type</th>
                            <th>Delete</th>
                            <th>Edit</th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train = new Train();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train.Select();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int id = rs.getInt("Train_ID");
                        %>

                        <tr>

                            <td><%=rs.getString("Train_name")%></td>
                            <td><%=rs.getString("Train_Model")%></td>

                            <td><%=rs.getString("Train_make")%></td>
                            <td><%=rs.getInt("Train_Max_speed")%></td>
                            <td><%=rs.getInt("Train_Weight")%></td>

                            <td><%=rs.getInt("Train_Length")%></td>
                            <td><%=rs.getString("Traffic_type")%></td>

                            
                             <td><a href="deleteTrain.jsp?id=<%=id%>">Delete</a></td>
                            <td><a href="updateTrain.jsp?id=<%=id%>">Edit</a></td>
                           

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
                    <tr><a href="countTrain.jsp">Count number of Trains</a></tr><br><br>
                    <tr><a href="avgTrain.jsp">Average number of Trains</a></tr><br><br>
                    <tr><a href="minTrain.jsp">Minimum number of Trains</a></tr><br><br>
                    <tr><a href="maxTrain.jsp">Maximum number of Trains</a></tr><br><br>
                    <tr><a href="sumTrain.jsp">Sum of Trains</a></tr><br><br>
                    <tr><a href="groupbyTrain.jsp">Group by of Train via Train name</tr><br><br>
                        <tr><a href="havingTrain.jsp">Number of Train by Train name having an ID greater than 5:</tr><br><br>
                            <tr><a href="joinTrain.jsp">Join of train and passengers</tr><br><br>
                                <tr><a href="leftjoinTrain.jsp">Left Join of train and passengers</tr><br><br>
                                    <tr><a href="rightjoinTrain.jsp">Right Join of train and passengers</tr><br><br>
                                        <tr><a href="unionTrain.jsp">Union of train and passengers</tr><br><br>
                                            <tr><a href="selfjoinTrain.jsp">Self Join of train and passengers</tr><br><br>
                                                <tr><a href="inTrain.jsp">In of train and passengers</tr><br><br>
                                                    </table>
                                                    </div>
                                                    </div>  
                                                    </div>

                                                    </body>
                                                    </html>