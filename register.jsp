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
<h2>Register your account on Fly Away</h2>
<form action="reguser">
<p>Name <input type="text" placeholder="Your Name" name="cust_name"></p>
<p>Email <input type="email" name="email"></p>
<p>Password <input type="password" name="pass"></p>
<p>Confirm Password <input type="password" name="cpass"></p>
<input type="submit" value="Create Account">
<a href="login.jsp">Already have an account? Login here</a></form>
</div>
</body>
</html>