<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Right Join of Train schedule and track destination:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Track ID:<br></th>
                            <th>Train ID:<br></th>
                            <th>Track ID:<br></th>

                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                             ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train_schedule = new Train_schedule();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train_schedule.RightJoin();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                 int Track_ID = rs.getInt("Track_ID");
                        %>

                        <tr>

                            <th><%=Track_ID%> </th>
                            <th><%=rs.getInt("Train_ID")%> </th>
                            <th><%=rs.getInt("Track_ID")%> </th>





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