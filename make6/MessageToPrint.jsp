<html>
	<head>
			<title>You have Balance</title>
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
					height:1000px;
					}
			</style>
	</head>
	<body>
	<div align="center">
		<div id="top">
			<div style="background-image:url(bg.jpg); height:150px; ">
				<br>
				<h1>APANA - BANK</h1>
				<i>ExtraOrdinary Service</i>
			</div>
			<center><h4><%=request.getAttribute("PrintMePlz")%></h4>
			<br>
			<br>
			<br>
			<br>
			<a href="StartPage.jsp">Click here</a> to move to Login Page</center>
		</div>
	</div>
	</body>
</html>