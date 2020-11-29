<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Union of passengers table and trains table:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Passenger ID<br></th>
                            <th>Train ID<br></th>
                            <th>date:<br></th>
                            <th>from station:<br></th>
                            <th>to station:<br></th>
                            <th>coach:<br></th>
                            <th>seat:<br></th>
                            <th>passenger name:<br></th>
                            <th>Train ID:<br></th>
                            <th>Train name:<br></th>
                            <th>Train model:<br></th>
                            <th>Train make:<br></th>
                            <th>Train max speed:<br></th>
                            <th>Train weight:<br></th>
                            <th>Train length:<br></th>
                            <th>Train weight:<br></th>
                            <th>Train length:<br></th>
                            <th>Traffic type:<br></th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train = new Train();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train.UNION();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Passenger_ID = rs.getInt("Passenger_ID");
                        %>

                        <tr>

                            <th><%=Passenger_ID%> </th>
                            <th><%=rs.getString("Train_ID")%> </th>
                            <th><%=rs.getDate("date")%> </th>
                            <th><%=rs.getInt("from_station")%> </th>
                            <th><%=rs.getInt("to_station")%> </th>
                            <th><%=rs.getInt("coach")%> </th>
                            <th><%=rs.getInt("seat")%> </th>
                            <th><%=rs.getString("passenger_name")%> </th>
                            <th><%=rs.getInt("Train_ID")%> </th>
                             
                            
                            <th><%=rs.getString("Train_ID")%> </th>
                            <th><%=rs.getString("Train_name")%> </th>
                            <th><%=rs.getString("Train_Model")%> </th>
                            <th><%=rs.getString("Train_make")%> </th>
                            <th><%=rs.getInt("Train_Max_speed")%> </th>
                            <th><%=rs.getInt("Train_Weight")%> </th>
                            <th><%=rs.getInt("Train_Length")%> </th>
                            <th><%=rs.getString("Traffic_type")%> </th>
                            
                              




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

    <p><a href="indexTrain.jsp">Click Back</a></p>


</div>