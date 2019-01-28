<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Account Details </title>
		<style>
			table{
				font-family:sans-serif;
			}
		</style>
	</head>
	<body>
		<h1 style="font-size:24px" align="center">Account Details :</h1>
		<p>
			<center>
			<table>
				<tbody>
					<tr>
						<td><b>Name </b></td>
						<td><b><%=request.getAttribute("Name")%></b></td>
					</tr>
					<tr>
						<td><b>Account No  </b></td>
						<td><%=request.getAttribute("Id")%></td>
					</tr>
					<tr>
						<td><b>Mobile  </b></td>
						<td> <%=request.getAttribute("Phone")%></td>
					</tr>
					<tr>
						<td><b>Your A/c Balance is $</b></td>
						<td><%=request.getAttribute("Balance")%>/-</td>
					</tr>
				</tbody>
			</table>
			</center>
		</p>
	</body>
</html>