<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Number of Train schedules in table group by  having an ID greater than 5:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Count:<br></th>
                            <th>Route location destination:<br></th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train_schedule = new Train_schedule();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train_schedule.Having();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                               int Schedule_ID = rs.getInt("SUM(Schedule_ID)");
                        %>

                        <tr>

                             <th><%=Schedule_ID %> </th>
                             <th><%=rs.getString("Route_location_destination") %> </th>



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