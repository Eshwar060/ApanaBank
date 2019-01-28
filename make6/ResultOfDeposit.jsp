<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Transaction done</title>
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
		</style>
	</head>
	<body><center>
	<div id="top">
			<div style="background-image:url(bg.jpg); height:150px; ">
				<br>
				<h1>APANA - BANK</h1>
				<i>ExtraOrdinary Service</i>
			</div>
			<hr width="700px">
			<label style="font-size:28px; ">Transaction Successfull</label>
		<p>
			<br>
			Account Name : <b><%=request.getAttribute("Name")%></b>
			<br><br>
						Current Balance is Rs.
						<b><%=request.getAttribute("currBal")%></b>
						<br>
						<br>
						<br>
						<br>
						<a href="index.jsp">Click here</a> to proceed with other transactions..
			
		</p>
		</center>
	</body>
</html>