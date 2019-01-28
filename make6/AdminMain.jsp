<html ng-app="AngularJs">
	<head>
		<title>Admin Main Page</title>
		<style>
				*{
					font-family:sans-serif;
				 }
				 #top {
					color: black;
					border: 0px solid;
					width: 900px;
					
					}
					.thead
					{
						font-size:12px;
				  		background-color:#999999;
						color:#000000;
					}
				.text {
					font-size:12px;
				 }
				 .button
				 {
				 		font-size:12px;
				  		background-color:#CCCCCC;
						border-color:#666666;
						border:1px double;
				 }
				 .buttonE
				 {
				 		width:130px;
				 		font-size:12px;
				  		background-color:#B7D8FF;
						border:1px double;
						border-color:#666666;
				 }
				 .trow:hover
				 {
				 	background-color:#E4E4E4;
					border-color:#FFFFFF;
				 }
				 .button:hover,.buttonE:hover
				 {
				 		font-size:12px;
				 		background-color:#FFFFFF;
						color:#000000;
				 }
		</style>
	</head>
<body ng-controller = "MainControl as cntrl">
	<div align="center">
		<div id="top" class="text">
			<div style="background-image:url(bg.jpg); height:150px; ">
				<br><br>
				<h1>APANA - BANK</h1>
				<i>ExtraOrdinary Service</i>
			</div>
			<hr>
            <div style="display:inline-flex; width:100%;text-align:left;">
			<div style="width:50%;">
            <a href="StartPage.jsp"><img src="Setting.png" height="15px" width="15px" title="logout"></a>
			 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{{MyTimeOut}}
			</div>
			<div style="text-align:right; width:50%;">
			Admin : <span style="color:#0099FF; "><b><%=request.getAttribute("rAName").toString()%></b></span><br>
			</div>
			
			</div>
			<br>
			<br>
			<br>
			<div id="acNoInput" >
		<!--	<form name="acNoForm"><input class="button" id="GetUserData" type="button" onClick="GetUDinfo()" value="Get All Users Info >>"/>
			or SEARCH : <input type="text" name="acNo" placeholder="Search with Acc. No." required>
			<input class="button" type="button" onClick="getIDDetails()" value="submit">
			
			<input class="button" type="button" onClick="document.getElementById('newAc').style.display='block'" value="New Account">
			</form>-->
			<div id="newAc" style="display:none; ">
			<input class="button" type="button" onClick="document.getElementById('newAc').style.display='none'" value="Close this">
			<br>
			<br>
			<%@ include file = "CreateNewDiv.jsp" %>
			</div>
			</div>
			<!--<br><br>
			<div>
			<input type="button" class="button" onClick="UpdateDetailsDisplay()" value="Update User Details"/>
			</div> 
			<br><br>-->
			
			<br>
			<br>
			<div id="Div2" >			
			</div>
			<div >
			<table  id="divtable3" class="text" align="center"  border="0px" cellpadding="2px" cellspacing="3px">
			</table>
			</div>
			<br>
			<br>
			
			<br>
			<br>
			<br>
			<div id="singleUD">
			<div id="idInfo" style="display:none; ">
			
			</div>
			<div id='EditOptions' style="display:none;">
				<button class="buttonE" id="Edit" onClick="MakeEdit()">Edit</button>
				<button class="buttonE" id="Delete" onClick="MakeDelete()">Delete</button>
				<button class="buttonE" id="Withdraw" onClick="MakeWithdraw()">Withdraw</button>
				<button class="buttonE" id="Deposit" onClick="MakeDeposit()">Deposit</button>
				<button class="buttonE" id="Transfer" onClick="MakeTransfer()">Transfer</button>
			</div>
			<div id="left_input" style="display:inline-flex; width:100%;">
			<div style="width:20%;"></div>
			<div id="OperationEdit" style=" display:none; width:30%;">
			<br>
			<form name="EditForm">
			<table class="text">
			<tr><td>Name</td><td>: <input maxlength="30" name="Name"/></td></tr>
			<tr><td>Address</td><td>: <input maxlength="40" name="Address"/></td></tr>
			<tr><td>Mobile</td><td>: <input maxlength="10" name="Mobile"/></td></tr>
			<tr><td><input class="button" type="button" value="Submit" onClick="Editing()"/></td><td><input class="button" type="reset"></td></tr>
			</table>
			</form>
			
			</div>
			<div id="OperationDelete" style=" display:none; width:30%;">
			<br><br>
			<form>
			Do you want to DELETE the User Account?
			<br><br>
			<input class="button" type="button" value="DELETE" onClick="Deleting()"/>
			<input class="button" type="button" value="Cancel" onClick="Cancel()"/>
			</form>
			
			</div>
			
			<div id="OperationWD" style=" display:none; width:30%;">
			<br>
			<form name="WDForm">
			<table class="text">
			<tr><td>Amount</td><td>: <input maxlength="10" name="Amount"/></td></tr>
			<tr><td><input class="button" type="button" value="Withdraw" onClick="WithdrawSend()"/></td><td><input class="button" type="reset"></td></tr>
			</table>
			</form>
			
			</div>
			
			<div id="OperationDp" style=" display:none; width:30%;">
			<br>
			<form name="DpForm">
			<table class="text">
			<tr><td>Amount</td><td>: <input maxlength="10" name="Amount"/></td></tr>
			<tr><td><input class="button" type="button" value="Deposit" onClick="DepositSend()"/></td><td><input class="button" type="reset"></td></tr>
			</table>
			</form>
			</div>
			
			<div id="OperationTr" style=" display:none; width:30%;">
			<br>
			<form name="TransferForm">
				<table class="text">
					<tr><td>Transfer to</td><td>: <input maxlength="10" name="AccountNumberR" placeholder="Account No"/></td></tr>
					<tr><td>Amount</td><td>: <input maxlength="10" name="Amount" placeholder="Rs."/></td></tr>
					<tr><td><input class="button" type="button" value="Submit" onClick="Transfering()"/></td><td><input class="button" type="reset"></td></tr>
				</table>
			</form>
			</div>
			
			<div id="OUTPUT" style="width:30%;">
			</div>
			</div>
			</div>
			</div>
		</div>
	</div>
	
</body>
<script src = "angular.min.js"></script>
<script type = "text/javascript">
/// Angular
		var a = angular.module('AngularJs',[]);
			a.controller('MainControl' , function($scope,$interval) 
				{
					$scope.MyTimeOut = new Date().toLocaleTimeString();
						$interval(function()
					{
						$scope.MyTimeOut = new Date().toLocaleTimeString();
						
					},1000);
				}
			  );
/// Javascript
	var NAME;
	var MOBILE;
	var ADDRESS;
    var AccId;
	vname="<%=request.getAttribute("rAName").toString()%>";
	function getIDDetails()
	{
		var url="UserIDData?AccountNumber="+document.acNoForm.acNo.value;
		var request = XMLObject();
		request.onreadystatechange=getInfoWithID;
		request.open("GET",url,true);
		request.send();
	}
/*	function UpdateDetailsDisplay()
	{
		document.getElementById("acNoInput").style.display="block";
		<!--document.getElementById("UpdateTable").style.display="block";-->
	} */
	function UpdateDetails()
	{
		AddComment();
	}
	
	window.onload = function GetUDinfo()
	{
		//document.getElementById("GetUserData").value="Refresh User Data";
		var url="UserCompData";
		var request = XMLObject();
		request.onreadystatechange=getInfo;
		request.open("GET",url,true);
		request.send();
		document.getElementById("EditOptions").style.display="none";
		document.getElementById("singleUD").style.display="none";
	}
	function XMLObject()
	{
		if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		return request;
	}
	/*function AddComment(){
		comment=document.commentForm.comment.value;
		var url="Sample?vname="+vname+"&comment="+comment;
		var request = XMLObject();
		request.onreadystatechange=getInfoComment;
		request.open("GET",url,true);                                          
		request.send();
		
	}*/

		function getInfo(){
			if(request.readyState==4){
				var val=request.responseText;
				//document.write(val);
				document.getElementById('divtable3').innerHTML=val;
				}
			else
			{
				document.getElementById('divtable3').innerHTML="Wait a second...";
			}
		}
		function getInfoWithID(){
			if(request.readyState==4){
			var val=request.responseText;
			
			document.getElementById('divtable3').innerHTML=val;
			document.getElementById("singleUD").style.display="block";
			}
		}
		function getInfoComment(){
			if(request.readyState==4){
			var val=request.responseText;
						/*var data = [
						{ "word":"ABANDON",
						"function":"v /n ",
						"definition":"to give up completely"},
						{ "word":"ABASH",
						"function":"v.",
						"definition":"to make embarrassed"}
						];
						
						var output = "";
						for(index in data){
						output += '<div class="entry">';
						output += '<h3 class="word">' + data[index].word + '</h3>';
						output += '<div class="function">' + data[index].function + '</div>';
						output += '<div class="definition">' + data[index].definition + '</div>';
						output += '</div>';
						}*/
				
			document.getElementById('Div2').innerHTML=val;
			}
		}
	function getEdit(id)
	{
		
		this.AccId=id;
		document.getElementById('idInfo').style.display="block";
		//document.getElementById('divtable3').innerHTML=null;
		//document.getElementById('idInfo').innerHTML=
		//"Details of Account : "+id;
		var url="UserIDData?AccountNumber="+id;
		var request = XMLObject();
		request.onreadystatechange=getInfoWithID;
		request.open("GET",url,true);
		request.send(); 
		document.getElementById('EditOptions').style.display="block";
	}
	function MakeEdit()
	{
		//AccId
		NAME=document.getElementById("divtable3").rows.item(1).cells.item(1).innerHTML;
		ADDRESS=document.getElementById("divtable3").rows.item(1).cells.item(3).innerHTML;
		MOBILE=document.getElementById("divtable3").rows.item(1).cells.item(4).innerHTML;
		document.EditForm.Name.value=NAME;
		document.EditForm.Address.value=ADDRESS;
		document.EditForm.Mobile.value=MOBILE;
		document.getElementById("OperationEdit").style.display="block";
		document.getElementById("OperationDelete").style.display="none";
		document.getElementById("OperationWD").style.display="none";
		document.getElementById("OperationDp").style.display="none";
		document.getElementById("OperationTr").style.display="none";
		document.getElementById('OUTPUT').innerHTML="";
	}
	function Editing()
	{
		//getEdit(AccId);
		var url="EditUDetails?AccountNumber="+AccId+"&Name="+document.EditForm.Name.value+"&Address="+document.EditForm.Address.value+"&Mobile="+document.EditForm.Mobile.value;
		var request = XMLObject();
		request.onreadystatechange=Edited;
		request.open("GET",url,true);
		request.send(); 
	}
	function Edited()
	{
			if(request.readyState==4){
			var val=request.responseText;
			document.getElementById('OUTPUT').innerHTML=val;
			}
			document.EditForm.Name.value=null;
			document.EditForm.Address.value=null;
			document.EditForm.Mobile.value=null;
			//document.getElementById('OperationEdit').style.display="none";
	}
	function MakeDelete()
	{
		//AccId
		document.getElementById("OperationDelete").style.display="block";
		document.getElementById("OperationEdit").style.display="none";
		document.getElementById("OperationWD").style.display="none";
		document.getElementById("OperationDp").style.display="none";
		document.getElementById("OperationTr").style.display="none";
		document.getElementById('OUTPUT').innerHTML="";
	}
	function Deleting()
	{
		//getEdit(AccId);
		var url="AdminDelete?AccountNumber="+AccId;
		var request = XMLObject();
		request.onreadystatechange=Deleted;
		request.open("GET",url,true);
		request.send(); 
	}
	function Deleted()
	{
			if(request.readyState==4){
			var val=request.responseText;
			document.getElementById('OUTPUT').innerHTML=val;
			}
	}
	
	function MakeWithdraw()
	{
		document.getElementById("OperationEdit").style.display="none";
		document.getElementById("OperationDelete").style.display="none";
		document.getElementById("OperationWD").style.display="block";
		document.getElementById("OperationDp").style.display="none";
		document.getElementById("OperationTr").style.display="none";
		document.getElementById('OUTPUT').innerHTML="";
	}
	function WithdrawSend()
	{
		if(checkWithdraw())
		{
		var url="AdminWithdraw?AccountNumber="+AccId+"&Amount="+document.WDForm.Amount.value;
		var request = XMLObject();
		request.onreadystatechange=WithdrawRecv;
		request.open("GET",url,true);
		request.send(); 
		}
	}
	function WithdrawRecv()
	{
			if(request.readyState==4){
			var val=request.responseText;
			document.getElementById('OUTPUT').innerHTML=val;
			}
			document.WDForm.Amount.value=null;
			document.DpForm.Amount.value=null;
	}
	
	function MakeDeposit()
	{
		document.getElementById("OperationEdit").style.display="none";
		document.getElementById("OperationDelete").style.display="none";
		document.getElementById("OperationDp").style.display="block";
		document.getElementById("OperationWD").style.display="none";
		document.getElementById("OperationTr").style.display="none";
		document.getElementById('OUTPUT').innerHTML="";
	}
	function DepositSend()
	{
		
		if(checkDeposit())
		{
		var url="AdminDeposit?AccountNumber="+AccId+"&Amount="+document.DpForm.Amount.value;
		var request = XMLObject();
		request.onreadystatechange=WithdrawRecv;
		request.open("GET",url,true);
		request.send(); 
		}
	}
	
	function MakeTransfer()
	{
		//AccId
		document.getElementById("OperationTr").style.display="block";
		document.getElementById("OperationEdit").style.display="none";
		document.getElementById("OperationDelete").style.display="none";
		document.getElementById("OperationWD").style.display="none";
		document.getElementById("OperationDp").style.display="none";
		document.getElementById('OUTPUT').innerHTML="";
	}
	function Transfering()
	{
		if(checkTra())
		{
		var url="AdminTransfer?AccountNumberS="+AccId+"&AccountNumberR="+document.TransferForm.AccountNumberR.value+"&Amount="+document.TransferForm.Amount.value;
		var request = XMLObject();
		request.onreadystatechange=Transfered;
		request.open("GET",url,true);
		request.send(); 
		}
	}
	function Transfered()
	{
			if(request.readyState==4){
			var val=request.responseText;
			document.getElementById('OUTPUT').innerHTML=val;
			}
			document.TransferForm.AccountNumberR.value=null;
			document.TransferForm.Amount.value=null;
	}
	
	function Cancel()
	{
		var value=prompt("Enter");
		if(confirm(value))
		{
			alert(value);
		}
		else
		{
			alert("Empty..!")
		}
		document.getElementById("OperationDelete").style.display="none";
		document.getElementById("OperationEdit").style.display="none";
		document.getElementById("OperationWD").style.display="none";
		document.getElementById("OperationDp").style.display="none";
		document.getElementById("OperationTr").style.display="none";
		
	}
	
	function checkDeposit()
	{
		if(isNaN(document.DpForm.Amount.value))
		{			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.DpForm.Amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		return true;
	}
	
	function checkWithdraw()
	{
		if(isNaN(document.WDForm.Amount.value))
		{			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.WDForm.Amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		return true;
	}
	
	function checkTra()
	{
		
		if(isNaN(document.TransferForm.Amount.value))
		{			
			alert("Enter a valid Amount");
			return false;
		}
		else if(document.TransferForm.Amount.value<=0)
		{
			alert("Enter a valid Amount");
			return false;
		}
		if(isNaN(document.TransferForm.AccountNumberR.value))
		{
			alert("Enter Account Number correctly");
			return false;
		}
		else if(document.TransferForm.AccountNumberR.value<=0)
		{
			alert("Enter Account Number correctly");
			return false;
		}
		return true;
	}
		
</script>

</html>