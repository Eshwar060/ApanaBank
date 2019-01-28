<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Entry is Successfully Done</title>
	</head>
	<body>
		<h1 style="font-size:24px " align="center">Account Details :</h1>
		<p>
			<center>
			<table style="font-family:sans-serif ">
			
			<%
				out.print("<br><tr><td>Id is : </td><td>" + request.getAttribute("Id")+"<td>");
				out.print("<br><tr><td>Percentage is : </td><td>" + request.getAttribute("Perc")+"<td>");
				out.print("<br><tr><td>Salary is : </td><td>" + request.getAttribute("Salary")+"<td>");
				out.print("<br><tr><td>Name is : </td><td>" + request.getAttribute("Name")+"<td>");
			%>
			</table>
			</center>
		</p>
	</body>
</html>