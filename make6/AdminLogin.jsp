<html>
<head>
	<title> Apana Bank --</title>
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
				#fsize
				{
				 font-size:12px;
				 }
				 
				 
				 
				 
				#button:hover{
					background-color:#666666;
					color:#FFFFFF;
				}
				#button,#RefreshBtn{
					background-color:#dddddd;
					border:1px double;
					border-color:#FFFFFF;
				}
				 
				 
				 
				 
				/* #button {
				 background-color:#CCCCCC;
				 color:#000000;
				 }
				#button:hover{
				background-color:#666666;
				color:#FFFFFF;
				}*/
		</style>
</head>

<body>
	<center>
	<div id="top" align="center">
			<div style="background-image:url(bg.jpg); height:150px; ">
				<br>
				<h1>APANA - BANK</h1>
				<i>ExtraOrdinary Service</i>
			</div>
			
			<hr width="770">
			<div style="display:inline-flex; width:100%;">
			
			<div style="width:50%;">
			<br>
			<br><br><br><br>
			Welcome to Apana Bank..
			<p> Its your bank..
			We Serve you Better.. </p>
			</div>
			
			<div id="fsize" style="width:50%;">
			<form method="post" action="AdminLogin" name="AdminLogin" onSubmit="return checkBal(this)">
				<table cellpadding="4px" align="center" style="font-size:12px;">
					<br>
					<b>ADMIN LOGIN</b>
					<br>
					
					<tr>
					<td><b>Name : </b></td><td><input name="Aname" placeholder ="Name" required></td><br>
					</tr>
					<tr>
					<td><b>Password : </b></td><td><input type="password"  name="Apassword" maxlength="10" placeholder ="Password"  required></td>
					</tr>
					<td><input id="button" type="submit" value="Login >>"/></td><td><input id="button" type="reset"/></td>
				</table>
			</form>
			Not an Admin?
			<a href="StartPage.jsp">Users login</a>
			</div>
		</div>
	</div>
	</center>
</body>

</html>