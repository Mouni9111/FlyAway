<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fly Away - Fly your worries away[ADMIN]</title>
<link rel="stylesheet" href="cssfile.css">
</head>
<body>
<%if(session.getAttribute("adminemail")==null){response.sendRedirect("AdminLogin.jsp");} %>
<div id="top"><h2 style="vertical-align:middle;">Fly Away</h2><br><p align="right">Logged In User: <%=session.getAttribute("adminemail")%> </p></div><form action="AdminLogout" style="z-index:105; position:absolute; top:20px; left:1400px;"><input type="submit" value="Logout"></form>
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
	String sql="SELECT * from bookings";
	ResultSet rs=statement.executeQuery(sql);
	
	%>
<table>
<tr>
<th>
Booking ID
</th>
<th>Flight ID</th>
<th>Email Address</th>
<th>Date</th>
<th>Number of PAX</th>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getInt("booking_id") %></td>
<td><%=rs.getString("flight_no") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("date_of_booking") %></td>
<td><%=rs.getString("no_of_pax") %></td>
</tr>
<%} %>
</table>
<a href="Admindata.jsp">Back to Main Menu</a>
</div>
</body>
</html>