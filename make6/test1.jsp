<html>
<head>
<title>JSON example</title>
<script language="javascript" >
var myObj={

"book": [
{
"id":"01",
"language": "Java",
"edition": "third",
"author": "Herbert Schildt"
},
{
"id":"07",
"language": "C++",
"edition": "second",
"author": "E.Balagurusamy"
}]
}
document.write("<table border='1'>");
for(var i=0;i<myObj.book.length;i++)
{
document.write("<tr><td>"+myObj.book[i].id+"</td>");
document.write("<td>"+myObj.book[i].language+"</td>");
document.write("<td>"+myObj.book[i].edition+"</td>");
document.write("<td>"+myObj.book[i].author+"</td></tr>");
}
document.write("</table>");
</script>
</head>
<body>
</body>
</html>