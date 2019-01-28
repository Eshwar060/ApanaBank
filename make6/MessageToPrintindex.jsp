<html>
	<head>
		<title>Message</title>
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
	<body>
    <center>
        <div id="top">
            <div style="background-image:url(bg.jpg); height:150px; ">
                <br>
                <h1>APANA - BANK</h1>
                <i>ExtraOrdinary Service</i>
            </div>
            <hr width="700px">
            <center><h4><%=request.getAttribute("PrintMePlz")%></h4></center>
            <br>
            <br>
            <br>
            <br>
            <a href="index.jsp">Click here</a> to move to your Main Page
        </div>
    </center>
	</body>
</html>