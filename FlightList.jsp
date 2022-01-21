<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fly Away - Fly your worries away</title>
<link rel="stylesheet" href="cssfile.css">
</head>
<body>
<%if(session.getAttribute("email")==null){response.sendRedirect("index.jsp");} %>
<div id="top"><h2 style="vertical-align:middle;">Fly Away</h2><br><p align="right">Logged In User: <%=session.getAttribute("email")%> </p></div>
<form action="UserLogout" style="z-index:105; position:absolute; top:20px; left:1400px;"><input type="submit" value="Logout"></form>
<div id="bottom" align="center">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String dburl = "jdbc:mysql://localhost:3306/flyaway?characterEncoding=latin1&useConfigs=maxPerformance";
	String dbusername ="root";
	String dbpassword ="root";
	String dbdriver ="com.mysql.jdbc.Driver";
	int routeid=0;
	try
	{
	Class.forName(dbdriver);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	Connection conn = null;
	try
	{
		conn = DriverManager.getConnection(dburl, dbusername, dbpassword);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	Statement statement=conn.createStatement();
	String sql="SELECT routeid from route where src='"+session.getAttribute("source")+"' and destination='"+session.getAttribute("destination")+"'";
	ResultSet rs=statement.executeQuery(sql);
	while(rs.next())
	{
		routeid=rs.getInt("routeid");
	}
	String sql2="SELECT * from flights where route_id="+routeid+"";
	ResultSet rs2=statement.executeQuery(sql2);
%>
<h2>Available Flights From <%=session.getAttribute("source") %> To <%=session.getAttribute("destination") %></h2>
<table>
<tr>
<th>Flight No</th>
<th>Departure Time</th>
<th>Arrival Time</th>
<th>Price</th>
<th>Available Seats</th>
<th>Book</th>
</tr>
<%
while(rs2.next())
{
%>
<tr>
<td><%=rs2.getInt("flight_no") %></td>
<td><%=rs2.getString("dep_time") %></td>
<td><%=rs2.getString("arr_time") %></td>
<td><%=rs2.getInt("price") %></td>
<td><%=rs2.getInt("available_seats") %></td>
<td>
<form action = "Flightcalc"> 
<input type="hidden" name="flightnumber" value=<%=rs2.getInt("flight_no")%>> 	

<input type = "submit" value ="Book Flight" >
</form>
</td>
<%} %>
</table>
</div>

</body>
</html>