<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Account Created </title>
		<style>
			*{
				font-family:sans-serif;
			}
			#top {
				color: black;
				padding: 60px;
				border: 0px solid;
				padding: 5px;
				width: 900px;
				height:600px;
				}
			td{
				font-size:14px;
			}
		</style>
	</head>
	<body>
    <center>
    	<div id="top">
            <div style="background-image:url(bg.jpg); height:150px; ">
                <br>
                <h1>APANA - BANK</h1>
                <i>ExtraOrdinary Service</i>
            </div>
            <hr width="700px" style="margin:4px;">
		Account Created with these Details :
		<p>
			<table>
				<tbody>
					<tr>
						<td>Account No  </td>
						<td><b><%=request.getAttribute("Id")%></b></td>
					</tr>
					<tr>
						<td>Name </td>
						<td><b><%=request.getAttribute("Name")%></b></td>
					</tr>
					<tr>
						<td>Mobile  </td>
						<td> <%=request.getAttribute("Phone")%></td>
					</tr>
					<tr>
						<td>Your A/c Balance is Rs.</td>
						<td><%=request.getAttribute("Balance")%>/-</td>
					</tr>
				</tbody>
			</table>
			<br>
						<br>
						<br>
						<br>
						<a href="StartPage.jsp">Click here</a> to move to Home Page
		</p>
        </div>
    </center>
	</body>
</html>