
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Number of stations in table group by city:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Count:<br></th>
                            <th>City name:<br></th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity station = new Station();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = station.GroupBy();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                              int Station_ID = rs.getInt("COUNT(Station_ID)");
                        %>

                        <tr>

                             <th><%=Station_ID %> </th>
                             <th><%=rs.getString("Station_city") %> </th>



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