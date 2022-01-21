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
	String sql="SELECT * from bookings where date_of_booking='"+session.getAttribute("date_of_travel")+"' and email='"+session.getAttribute("email")+"' and flight_no="+session.getAttribute("FlightNoFinal");
	ResultSet rs=statement.executeQuery(sql);
	rs.next();
	%>
	<h1>Booking Confirmed</h1>
	<h1>Booking ID: <%=rs.getInt("booking_id") %></h1>
	<a href="index.jsp">Back Home</a>
</div>
</body>
</html>