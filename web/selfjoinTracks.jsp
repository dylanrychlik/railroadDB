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

                            <th>Station ID1<br></th>
                            <th>Station ID2<br></th>


                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity track = new Tracks();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = track.SelfJoin();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Station_ID1 = rs.getInt("Station_ID1");
                        %>

                        <tr>

                            <th><%=Station_ID1%> </th>
                            <th><%=rs.getString("Station_name")%> </th>
                            <th><%=rs.getInt("Station_ID2")%> </th>
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

    <p><a href="indexTracks.jsp">Click Back</a></p>


</div>