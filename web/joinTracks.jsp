<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@page import="Backend.*" %> 
<!DOCTYPE html>
<h1>Join of Station table and track table:</h1>
</br>
<div class="row">
    <div class="col-sm-4">


        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-Countstation" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>

                            <th>Station ID<br></th>
                            <th>Average Track Speed Limit:<br></th>
                            <th>Station start ID:<br></th>
                        </tr>  

                        <%
                            //Creates a resultset object to read the MySQL query. 
                            ResultSet rs;
                            //Create an enity object to be assigned to the client object using polymorphism. 
                            Enity track = new Tracks();
                            //calls the abtract select method with the 'rs' variable as the return type.
                            rs = track.Join();
                            //System.out.println("Size"+rs.getFetchSize());
                            //reads through the result set. Mixed in the html to allow the table read.
                            while (rs.next()) {
                                int Station_ID = rs.getInt("Station_ID");
                        %>

                        <tr>

                            <th><%=Station_ID%> </th>
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

    <p><a href="indexTracks.jsp">Click Back</a></p>


</div>