<div>
<b>REGISTRATION FORM</b>
	<br>
	<form name="form1" method="post" action="Create" onSubmit="return Fcheck(this)" style="font-size:12px; ">
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
			<td><input class="button" type="submit"></td><td><input class="button" type="reset"></td>
			</tr>
		</table>
	<center>Already Have An Account..?<a href="StartPage.jsp">Login here</a></center>
	</form>
</div>