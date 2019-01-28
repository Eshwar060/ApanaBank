<html>
<head>
<title>Create an Account</title>
<link rel="stylesheet" href="sitestyle.css" type="text/css" ></link>
<style>
				*{
					font-family:sans-serif;
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
				 
				 
				 
				 /*#button {
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
			<div id="pd" style="width:50%; font-size:12px;">
			<br>
				<b>REGISTRATION FORM</b>
				<br>
				<br>
				<form name="form1" method="post" action="Create" onSubmit="return Fcheck(this)">
					<table align="center" cellpadding="4px" style="font-size:14px;">
						<tr>
						<td>Name</td><td><input type="text" name="name" placeholder="Name"  required  maxlength="25" ></td>
						</tr>
						<tr>
						<td>Password</td>
						<td><input type="password" name="password" placeholder="Password" maxlength="8" required></td>
						</tr>
						<tr>
						<td>Address</td><td><input type="text" placeholder="Address" name="address" required></td>
						</tr>
						<tr>
						<td>Phone</td><td><select><option>+91</option></select><input type="text" placeholder="Phone" name="phone" maxlength="10" style="width:100px" required></td>
						</tr>
						<tr>
						<td>Amount</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.&nbsp;&nbsp;<input style="width:80px" type="text" placeholder="Amount" name="amount" maxlength="10" required></td>
						</tr>
						<tr>
						<td><input id="button" type="submit" value="Register >>"></td><td><input id="button" type="reset"></td>
						</tr>
					</table>
				Already Have An Account..?<a href="StartPage.jsp">Login here</a>
				</form>
				</div>
			</div>
		</div>
	</center>	
</body>
<script language="javascript">
function Fcheck(form)
{
	if(!isNaN(document.form1.name.value))
	{
		alert("Enter Name correctly");
		return false;
	}
	if(document.form1.phone.value<9000000000)
	{
		alert("Only for 9th Series Mobile No Users");
		return false;
	}
	if(isNaN(document.form1.phone.value))
	{
		alert("Enter Mobile Number correctly");
		return false;
	}
	else if(document.form1.phone.value.length<10)
	{
		alert("Enter Mobile Number correctly");
		return false;
	}
	if(isNaN(document.form1.amount.value))
	{
		alert("Enter a valid Amount");
		return false;
	}
	else if(document.form1.amount.value<500)
	{
		alert("Entered Amount is less than $500/-");
		return false;
	}
	return true;
}
</script>
</html>