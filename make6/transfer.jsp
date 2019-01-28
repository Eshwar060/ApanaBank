<html>
	<head>
		<title>Account Transfer</title>
		<link rel="stylesheet" href="signup.css" type="text/css">
		<style>
			table{
				font-family:sans-serif;
			}
		</style>
	</head>
	<body>
		<div id="main" >
			<center>
			  <h1>Transfer</h1>
			</center>
			<div style="display:inline-flex; width:100%;">
				<div style="width:50%; background-image:url(bg.jpg)">
				  <center>
					<br>
						<b>  APANA BANK </b>
						<hr width="420">
					  <p> GOOD BANK FOR GOOD PEOPLE..</p>
					  <p>&nbsp;</p>
				  </center>
				</div>
				<div style="width:50%;">
					<form method="post" action="Transfer" name="form1" onSubmit="return Fcheck(this)">
						<table cellpadding="4px" align="center">
							<tr>
							<td><b>Bank Acc No. : </b></td><td><input name="accontNo" required></td>
							</tr>
							<tr>
							<td><b>Name : </b></td><td><input name="name" required></td><br>
							</tr>
							<tr>
							<td><b>Password : </b></td><td><input type="password"  name="password" maxlength="8"  required></td>
							</tr>
							<tr>
							<td><b>Amount : </b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$&nbsp;&nbsp;<input style="width:80px" type="text" name="amount" maxlength="10" required></td><br>
							</tr>
							<tr> <td>To Transfer :</td><td><input name="accontNo2" required></td></tr>
							<td><input type="submit"></td><td><input type="reset"></td>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script language="javascript">
	function Fcheak(form)
	{
		if(!isNaN(document.form1.accontNo.value))
		{
			alert("Enter a valid Number");
			return false;
		}
		return true;
	}
	</script>
</html>
