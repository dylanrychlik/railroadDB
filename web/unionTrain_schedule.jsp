<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Union of Train schedule and track destination:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Schedule ID</th>
                            <th>Train_ID</th>
                            <th>Track ID</th>
                            <th>Station Start</th>
                            <th>Station Destination</th>
                            <th>Route location start</th>
                            <th>Route location destination</th>
                            <th>Time in:</th>
                            <th>Time out:</th>
                            <th>Schedule Sequence number:</th>
                            <th>Track ID:</th>
                            <th>Station Destination:</th>


                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train_schedule = new Train_schedule();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train_schedule.UNION();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Schedule_ID = rs.getInt("Schedule_ID");
                        %>

                        <tr>

                            <th><%=Schedule_ID%> </th>
                            <td><%=rs.getString("Train_ID")%></td>


                            <td><%=rs.getString("Track_ID")%></td>
                            <td><%=rs.getInt("Station_Start")%></td>
                            <td><%=rs.getInt("Station_Destination")%></td>

                            <td><%=rs.getString("Route_location_start")%></td>
                            <td><%=rs.getString("Route_location_destination")%></td>


                            <td><%=rs.getString("Timein")%></td>
                            <td><%=rs.getString("Timeout")%></td>

                            <td><%=rs.getInt("Schedule_Sequence_no")%></td>
                            <td><%=rs.getInt("Track_ID")%></td>
                            <td><%=rs.getInt("Station_Destination")%></td>






                        </tr> 


                        <%

                            }
                        %>

                </table>   
            </div>


        </div>
    </div>
</div>
<div align="left">

    <p><a href="indexTrain_schedule.jsp">Click Back</a></p>


</div>