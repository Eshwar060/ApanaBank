<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title> Apana Bank --</title>
		<style>
				*{
					font-family:sans-serif;
				 }
				 #pd {
				 font-size:13px;
				 }
				 #divdeposit,#divwithdraw ,#transfer,#delete{
				 font-size:12px;
				 display:none;
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
				}
				*/
				#top {
				color: black;
				padding: 60px;
				border: 0px solid;
				padding: 5px;
				width: 900px;
				height:600px;
				}
				
				
				#heading {
				font-family: Sans-Serif;
				color:black;
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
			
			<hr width="770">
			<div style="display:inline-flex; width:100%;">
			
			<div style="width:50%;">
			<br>
			<br><br><br><br>
			Welcome to Apana Bank..
			<p> Its your bank..
			We Serve you Better.. </p>
			</div>
			<div id="pd" style="width:50%;">
			
			<form method="post" action="Balance" name="Balance" onSubmit="return checkBal(this)">
						<table cellpadding="4px" align="center"  style="font-size:12px;">
							<br>
							<b>USER LOGIN</b>
							<br>
							<tr>
							<td><b>Account No. : </b></td><td><input name="accontNo" placeholder ="Account Number" required></td>
							</tr>
							<tr>
							<td><b>Name : </b></td><td><input name="name" placeholder ="Name" required></td><br>
							</tr>
							<tr>
							<td><b>Password : </b></td><td><input type="password"  name="password" maxlength="8" placeholder ="Password"  required></td>
							</tr>
							<td><input id="button" type="submit" value="Login >>"/></td><td><input id="button" type="reset"/></td>
						</table>
						Have no Account..?
						<a href="CreateAccount.jsp">Create new one</a>
						
			  </form>
			  <a href="AdminLogin.jsp" >Admin Login</a>
			</div>
		</div>
		</div>
	</center>
</body>
<script language="javascript">
function checkBal(Balance)
	{
		if(isNaN(document.Balance.accontNo.value))
		{
			
			alert("Enter Account Number correctly");
			return false;
		}
		else if(document.Balance.accontNo.value<=0)
		{
			alert("Enter Account Number correctly");
			return false;
		}
		if(!isNaN(document.Balance.name.value))
		{
			
			alert("Enter Name correctly");
			return false;
		}
		return true;
	}
</script>
</html>
