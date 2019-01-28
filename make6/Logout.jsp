<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Logout</title>
</head>

<body>
<%
session.removeAttribute("Id");
session.removeAttribute("Balance");
session.removeAttribute("Name");
session.removeAttribute("Phone");

//response.sendRedirect("StartPage.jsp");
%>
</body>
<script>
//function fav()
//{
	//alert(window.location);
	window.location="http://localhost:8080/make6/";
//}
</script>
</html>
