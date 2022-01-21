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
<div id="top"><h2 style="vertical-align:middle;">Fly Away</h2></div>
<div id="bottom" align="center">
<form action="SaveSearch">

<h3>Source <input type="text" id="src" name="src"></h3>
<h3>Destination <input type="text" id="dest" name="dest"></h3>
<h3>Date of Travel <input type="date" id="dot" name="dot"></h3>
<h3>Number of Passengers <input type="number" id="noofpax" name="noofpax" min="1" max="100"></h3>
<input type="submit" value="Search Flights"></form></div>
</body>
</html>