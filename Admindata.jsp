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
<div id="top"><h2 style="vertical-align:middle;">Fly Away</h2><br><p align="right">Logged In User: <%=session.getAttribute("adminemail")%> </p>
<form action="AdminLogout" style="z-index:105; position:absolute; top:20px; left:1400px;"><input type="submit" value="Logout"></form></div>
<div id="bottom" align="center" style="z-index:-1">
<h2>Available Reports:</h2>
<a href="Adminroutes.jsp">Routes</a>
<a href="AdminFlights.jsp">Flights</a>
<a href="AdminBookings.jsp">Bookings</a>
</div>
</body>
</html>