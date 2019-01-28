<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Account Deletion Successful</title>
</head>

<body>
<center>
<h2>Account has Been Closed.. </h2>
Thanks For using Our Service
<%

session.removeAttribute("Id");
session.removeAttribute("Balance");
session.removeAttribute("Name");
session.removeAttribute("Phone");
%>
<br>
<br>
<br>
<br>
<br>
<a href="StartPage.jsp">Click Here</a> to move to Login
</center>
</body>
</html>
