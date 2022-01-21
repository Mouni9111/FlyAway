
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
	String sql="Select * from flights where flight_no="+session.getAttribute("FlightNoFinal");
	ResultSet rs=statement.executeQuery(sql);
	rs.next();
	int passes=(int)session.getAttribute("number_of_pass");
%>
<div style="width: 100%;">
        <div style="width: 50%; height: 100px; float: left; background: green;"> 
            <h2>Flight Details</h2>
            <h3>Flight Number: <%=session.getAttribute("FlightNoFinal") %></h3>
            <h3>Source: <%=session.getAttribute("source") %></h3>
            <h3>Destination: <%=session.getAttribute("destination") %></h3>
            <h3>Time of Departure: <%=rs.getString("dep_time") %></h3>
            <h3>Time of Arrival: <%=rs.getString("arr_time") %></h3>
            <h3>Number of PAX: <%=session.getAttribute("number_of_pass") %></h3>  
        </div>
        <div style="margin-left: 50%; height: 100px; background: blue;"> 
            <h3>Price Per Person: <%=rs.getInt("price") %></h3>
            <h1>Total Price: <%=(rs.getInt("price")*passes) %></h1>
            <form action="Receipt">
            <input type="submit" value="CONFIRM">
            </form>
        </div>
    </div>
</div>
</body>
</html>