<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Union of sStation table and track table:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Station ID<br></th>
                            <th>Station name<br></th>
                            <th>Station city<br></th>
                            <th>Station state<br></th>
                            <th>Track ID<br></th>
                            <th>Track Length<br></th>
                            <th>Track_type<br></th>
                            <th>Average Track Speed Limit:<br></th>
                            <th>Station start ID<br></th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity station = new Station();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = station.UNION();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Station_ID = rs.getInt("Station_ID");
                        %>

                        <tr>

                            <th><%=Station_ID%> </th>
                            <th><%=rs.getString("Station_name")%> </th>
                            <th><%=rs.getString("Station_city")%> </th>
                            <th><%=rs.getString("Station_state")%> </th>
                            <th><%=rs.getInt("Track_ID")%> </th>
                            <th><%=rs.getString("Track_Length")%> </th>
                            <th><%=rs.getString("Track_type")%> </th>
                            <th><%=rs.getInt("Average_Track_Speed_Limit")%> </th>
                            <th><%=rs.getInt("Station_start_ID")%> </th>




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

    <p><a href="indexStation.jsp">Click Back</a></p>


</div>