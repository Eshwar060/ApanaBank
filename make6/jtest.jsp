<html>
<head>
<title>Test ME</title>
</head>
<body>
<form name="Form1">
Name: <input id="text" name="Name"  title="Your Name"/>
<br>Class : <select id="SelectClass">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select>

Section : <select id="SelectSection">
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
</select>
Number: <input id="text" name="Number1" maxlength="10"  title="Number"/>
<input  type="button" value="click me" onClick="functionF1()"  title="Send"/>
<div id="i1" style="height:20px; width:80px; background-color:#CFCFCF; border:1px solid; border-color:#000000" onClick="functionF1()">Click me</div>
Marks:<input name="Marks">
Address:<input name="Address">
</form>
<div>
<table border="1">
<tbody  id="mylocation">

</tbody>
</table>
</div>
</body>
<script>

			var ajaxrequest;
			function functionF1()
				{
					if(window.XMLHttpRequest)
					{
						ajaxrequest=new XMLHttpRequest;
					}
					else if(window.ActiveXObject)
					{
						ajaxrequest=new ActiveXObject(Microsoft.XMLHTTP);
					}
					
						ajaxrequest.onreadystatechange=function()
						{
							if(ajaxrequest.readyState==4)
							{
								//document.write(ajaxrequest.responseText);
								var JsonObj =JSON.parse(ajaxrequest.responseText);
								alert(ajaxrequest.responseText);
								alert(JsonObj.Send.length);
								//var d1="document.getElementById('mylocation')";
								
								 //document.getElementById('mylocation').innerHTML = null;
								 var data = "";
								 
								for(var i=0;i<JsonObj.Send.length;i++)
								{
								 data += "<tr>";
								 data +="<td>";
								 data +=JsonObj.Send[i].NAME;
								 data +="</td>";
								 data +="<td>";
								 data +=JsonObj.Send[i].ID;
								 data +="</td>";
								 data += "</tr>";
								}
								document.getElementById('mylocation').innerHTML = data;
								alert(document.getElementById('mylocation').innerHTML);
							}
						}
					var url="Hello?Name="+document.Form1.Name.value+"&Number="+document.Form1.Number1.value+"&Class="+document.getElementById("SelectClass").value+"&Section="+document.getElementById("SelectSection").value+"&Marks="+document.Form1.Marks.value+"&Address="+document.Form1.Address.value;
					//var url="Hello?Name="+document.Form1.Name.value+"&Number="+document.Form1.Number1.value;
					ajaxrequest.open("Get",url,true);
					ajaxrequest.send();
				}
</script>
</html>