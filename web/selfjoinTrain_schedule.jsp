<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Self join of Station table and track table:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Train_ID 1:<br></th>
                            <th>Station_destination_ID 2:<br></th>
                            <th>Station_destination_ID:<br></th>


                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                           ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train_schedule = new Train_schedule();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train_schedule.SelfJoin();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Train_ID1 = rs.getInt("Train_ID1");
                        %>

                        <tr>

                            <th><%=Train_ID1%> </th>
                            <th><%=rs.getString("Station_destination_ID2")%> </th>
                            <th><%=rs.getString("Station_destination_ID")%> </th>
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