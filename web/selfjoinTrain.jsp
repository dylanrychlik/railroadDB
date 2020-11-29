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

                            <th>Passenger ID1:<br></th>
                            <th>Train name 2:<br></th>
                            <th>Passenger name 2:<br></th>


                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity train = new Train();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = train.SelfJoin();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Passenger_ID1 = rs.getInt("Passenger_ID1");
                        %>

                        <tr>

                            <th><%=Passenger_ID1%> </th>
                            <th><%=rs.getString("Train_name2")%> </th>
                            <th><%=rs.getString("passenger_name")%> </th>
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