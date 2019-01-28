<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html ng-app='AngularJs'>
	<head>
		<title> Apana Bank --</title>
		<style>
				*{
					font-family:sans-serif;
				 }
				 #pd {
				 	font-size:13px;
				 }
				 #divdeposit,#divwithdraw ,#transfer,#delete,#about{
					 font-size:13px;
					 display:none;
				 }
				.button:hover{
					background-color:#666666;
					color:#FFFFFF;
				}
				.button{
					background-color:#dddddd;
					border:1px double;
					border-color:#FFFFFF;
				}
				#mainbar{
					width:100%;
					height:auto; 
					font-size:14px;
					display:inline-flex;
					color:#FFFFFF;
					font-weight:bold;
				}
				#top {
					color: black;
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
    <div align="center">
	<%
	int acc = (Integer)session.getAttribute("Id");
	String password = (String)session.getAttribute("pass");
	String name = (String)session.getAttribute("Name");
	%>
		<div id="top" align="center">
			<div style="background-image:url(bg.jpg); height:150px; ">
				<br>
				<h1>APANA - BANK</h1>
				<i>ExtraOrdinary Service</i>
				<div  ng-controller='Maincontrol as ctrl'><p style=" font-size:12px; font-weight:bold; text-align:left;">&nbsp;&nbsp;&nbsp;{{MyTimeOut}}</p></div>
			</div>
			<div id="mainbar">
			<!--<form method="post" name="Bupdate" action="Bupdate">
				    <input type="submit" value="         BALANCE        " class="button" onClick="fcallDiv1();"> 
				</form> -->
               
				 <button class="button" style=" width:17%; " onClick="fcallBalance()">BALANCE</button>
				 <button class="button" style=" width:15%;"  onClick="fcallDeposit()">DEPOSIT</button>
				 <button class="button" style=" width:15%; " onClick="fcallWithdraw()">WITHDRAW</button>
				 <button class="button" style=" width:15%; " onClick="fcallTransfer()">TRANSFER</button>
				 <button class="button" style=" width:20%; " onClick="fcallDelete()">CLOSE ACCOUNT</button>
				 <button class="button" style=" width:15%;" onClick="fcallAbout()">ABOUT US</button>
                 <a href="Logout.jsp"><button class="button" title="Logout" action="Logout.jsp"><img src="Setting.png" width="11px" height="11px"/></button></a>
            </div>
			<div style="display:inline-flex; width:100%; height:250px;">
			<div style="width:50%;">
			<br>
			<br><br><br><br>
			Hii <b><%= session.getAttribute("Name")%></b>..
			Welcome to Apana Bank..
			<p> Its your bank..We Serve you Better..</p>
			</div>
			<div id="pd" style="width:50%;">	
			<BR>	
			
				<table cellpadding="4px" align="center">
					<br>
					<b>YOUR ACCOUNT</b>
					<br><br>
					<tr>
					<td><b>Name : </b></td><td><%= session.getAttribute("Name")%></td>
					</tr>
					<tr>
					<td><b>Id : </b></td><td><%= session.getAttribute("Id")%></td>
					</tr>
					<tr>
					<td><b>Balance : </b></td><td id="BalAjax"><%= session.getAttribute("Balance")%> / -</td>
					</tr>
					<tr>
					<td><b>Phone : </b></td><td><%= session.getAttribute("Phone")%></td>
					</tr>
					<tr>
					<td><b>Address : </b></td><td><%= session.getAttribute("Address")%></td>
					</tr>
				</table>
				
						
			</div>
				<div id="divdeposit" style="width:50%;">
				<br>
				<br>
				<b>DEPOSIT</b>
					<form method="post" action="Deposit" name="deposit" onSubmit="return checkDep(this)">
						
						<table cellpadding="4px" align="center">
							<input type="hidden" value ="<%=acc %>" readonly>
							<tr>
							<td><b>Amount : </b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.&nbsp;&nbsp;<input style="width:80px" type="text" name="amount" maxlength="10" placeholder ="Amount" required></td><br>
							</tr>
							<td><input class="button" type="submit" value="Deposit"></td><td><input class="button" type="reset"></td>
						</table>
					</form>
				</div>
				<div id="divwithdraw" style="width:50%;">
					<form method="post" action="Withdraw" name="withdraw" onSubmit="return checkWit(this)">
				<br>
				<br>
					<B>WITHDRAW</B>
					<br>
						<table cellpadding="4px" align="center">
							<input type="hidden" value ="<%=acc %>" readonly>
							<input type="hidden" value ="<%=name %>" readonly>
							<input type="hidden" value ="<%=password %>" readonly>
							<tr>
							<td><b>Amount : </b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.&nbsp;&nbsp;<input style="width:80px" type="text" name="amount" maxlength="10"  placeholder ="Amount"  required></td><br>
							</tr>
							<td><input class="button" type="submit"  value="Withdraw"></td><td><input class="button" type="reset"></td>
						</table>
					</form>
				</div>
				<div id="transfer" style="width:50%;">
				<br>
				<br>
					<form method="post" action="Transfer" name="transfer" onSubmit="return checkTra(this)">
					 <b>TRANSFER MONEY</b>
					 <br>
						<table cellpadding="4px" align="center">
							<input type="hidden" value ="<%=acc %>" readonly>
							<input type="hidden" value ="<%=name %>" readonly>
							<input type="hidden" value ="<%=password %>" readonly>
							<tr>
							<td><b>Amount : </b></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rs.&nbsp;&nbsp;<input style="width:80px" type="text" name="amount" maxlength="10"  placeholder ="Amount" required></td><br>
							</tr>
							<tr> <td><b>Transfer To :</b></td><td><input name="accontNo2"  placeholder ="to Account" required></td></tr>
							<td><input class="button" type="submit" value="Transfer"></td><td><input class="button" type="reset"></td>
						</table>
					</form>
				</div>
				<div id="delete" style="width:50%;">
				<form method="post" action="Delete" name="deleteAc" onSubmit="return checkDel(this)">
				<BR>
					<br>
					<b>CLOSE AN ACCOUNT</b>
					<br>
					<table cellpadding="4px" align="center">
						<tr>
						<td><b>Bank Acc No. : </b></td><td><input name="accontNo" placeholder ="Account Number"  value="<%= session.getAttribute("Id")%>" readonly required></td>
						</tr>
						<tr>
						<td><b>Name : </b></td><td><input name="name" placeholder ="Name" value="<%= session.getAttribute("Name")%>"readonly required></td>
						</tr>
						<tr>
						<td><b>Password : </b></td><td><input type="password"  name="password" maxlength="8" placeholder ="Password" required></td>
						</tr>
						<td><input class="button" type="submit" value="Close"></td><td><input class="button" type="reset"></td>
					</table>
				</form>
				</div>
				<div id="about" style="width:50%;">
				<p style="font-size:14px ">
				<br>
				<br>
					<b>Apana Bank</b>  is the mostly used Online Banking System. It revolutionized co-operative banking sector and earned recognition and opened its branches in working class residential localities of Hyderabad. A major share in the success of Apna Bank, which has been able to attract a large number of customers by providing prompt & efficient banking services. 
				</p>
				<p>
				
					Thanks for using <b>Apana Bank</b>
				</p>
				</div>
				
			</div>
				<div align="right">
				<a href="Logout.jsp">
				<button class="button" style="background-color:#999999; " action="Logout.jsp" title="Logout"><img src="DeleteIcon.gif" style="height:13px; "></img>
				Logout
				</button></a>
				</div>
			
		</div>
		</div>
	</body>
	<script type="text/javascript" src="angular.min.js"></script>
	<script type = "text/javascript">
				
		var ajaxrequest;	
		var url ;
		var id;
		
		var a = angular.module('AngularJs',[]);
		a.controller('Maincontrol' , function($scope,$interval) 
			{
				$scope.MyTimeOut = new Date().toLocaleTimeString();
					$interval(function()
				{
					$scope.MyTimeOut = new Date().toLocaleTimeString();
					
				},1000);
			}
		  );
		  
	function fcallDiv1()
	{
	document.getElementById("pd").style.display="block";
	document.getElementById("divdeposit").style.display="none";
	document.getElementById("divwithdraw").style.display="none";
	document.getElementById("transfer").style.display="none";
	document.getElementById("delete").style.display="none";
	document.getElementById("about").style.display="none";
	}
	function fcallBalance()
	{
		fcallDiv1();
		url="BalanceAjax";
		id="BalAjax";
		ajax();
	}
	function ajax(){
				
		if(window.XMLHttpRequest){
			
			ajaxrequest = new XMLHttpRequest();
			
		}else if(window.ActiveXObject){
			
			ajaxrequest = new ActiveXObject("Microsoft.HTTP");			
		}		
			
		try{
			ajaxrequest.onreadystatechange = print;
			ajaxrequest.open("post",url,true);
			ajaxrequest.send();			
		}catch(e){
			alert("unable to process");
		}
	}
	
	function print(){
		
		if(ajaxrequest.readyState == 4){
			
			if(ajaxrequest.status == 200){
				//ajaxrequest.responseText+="/-";
				var text = ajaxrequest.responseText;
				text=text+" / -";
				//alert(text);
				document.getElementById(id).innerHTML = text;
			}
		}
	}
	function fcallDeposit()
	{
	document.getElementById("pd").style.display="none";
	document.getElementById("divdeposit").style.display="block";
	document.getElementById("divwithdraw").style.display="none";
	document.getElementById("transfer").style.display="none";
	document.getElementById("delete").style.display="none";
	document.getElementById("about").style.display="none";
	}
	function fcallWithdraw()
	{
	document.getElementById("pd").style.display="none";
	document.getElementById("divdeposit").style.display="none";
	document.getElementById("divwithdraw").style.display="block";
	document.getElementById("transfer").style.display="none";
	document.getElementById("delete").style.display="none";
	document.getElementById("about").style.display="none";
	}
	function fcallTransfer()
	{
	document.getElementById("pd").style.display="none";
	document.getElementById("divdeposit").style.display="none";
	document.getElementById("divwithdraw").style.display="none";
	document.getElementById("transfer").style.display="block";
	document.getElementById("delete").style.display="none";
	document.getElementById("about").style.display="none";
	}
	function fcallDelete()
	{
	document.getElementById("pd").style.display="none";
	document.getElementById("divdeposit").style.display="none";
	document.getElementById("divwithdraw").style.display="none";
	document.getElementById("transfer").style.display="none";
	document.getElementById("delete").style.display="block";
	document.getElementById("about").style.display="none";
	}
	function fcallAbout()
	{
	document.getElementById("pd").style.display="none";
	document.getElementById("divdeposit").style.display="none";
	document.getElementById("divwithdraw").style.display="none";
	document.getElementById("transfer").style.display="none";
	document.getElementById("delete").style.display="none";
	document.getElementById("about").style.display="block";
	}
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
		return true;
	}
	function checkDep(deposit)
	{
		if(isNaN(document.deposit.amount.value))
		{
			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.deposit.amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		return true;
	}
	function checkWit(withdraw)
	{
		
		if(isNaN(document.withdraw.amount.value))
		{			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.withdraw.amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		return true;
	}
	function checkTra(transfer)
	{
		
		if(isNaN(document.transfer.amount.value))
		{			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.transfer.amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		if(isNaN(document.transfer.accontNo2.value))
		{
			alert("Enter Account Number correctly");
			return false;
		}
		else if(document.transfer.accontNo2.value<=0)
		{
			alert("Enter Account Number correctly");
			return false;
		}
		return true;
	}
	function checkDel(deleteAc)
	{
		if(isNaN(document.deleteAc.accontNo.value))
		{
			
			alert("Enter Account Number correctly");
			return false;
		}
		else if(document.deleteAc.accontNo.value<=0)
		{
			alert("Enter Account Number correctly");
			return false;
		}
		if(!isNaN(document.deleteAc.name.value))
		{
			
			alert("Name must be a number");
			return false;
		}
		return true;
	}
	</script>
</html>