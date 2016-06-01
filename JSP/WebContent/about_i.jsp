<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>About</title>
</head>
<body align = "center" bgcolor="#E6E6FA">
<b> ABOUT OCES</b>
<br>
<br>


<tr>



</tr>	

 

<textarea name='input' readonly="readonly" id='test' style="width:700px;height:480px;">
This website is graduation project that was developed by Gürkan Çatak & Muhammet Altıntaş with Advisor: Asst. Prof. Ömer Korçak.

To execute codes correctly users must obey some rules in their codes.

Obligations:

•	No package in the head of the code.
•	Class name of the code should be "code".(For teacher "instructorcode")
•	Output should be generated as a file in the current directory, its name should be 
	"output.txt".
•	Input should be taken from input file and file should be in the current directory.
	Input file name should be taken as first command line argument.
	There is no any obligations for name of this file.
•	Main method should be called in the your code.
•	"System.lineSeperator()" should be used instead of "\n","\r\n","\n" to newline 
	character. 
•	You should close file writer if you used.(fw.close())	

These obligations are NOT hard to implement. You can use our template code.

--> First of all, this code take input as command line argument.
    This arg[0] is file name, for example "input.txt"
--> It creates a new array with intended size.
--> It filled array with input file content.
--> It sorts array.
--> It creates a new file as a name of "output.txt"
--> It fill output.txt with array.
--> It close File Writer object.
</textarea></td>
<br>

<a href="inputcode.jsp">See our code.</a><br><br>
<a href="instructor_index.jsp">Go back.</a>




</body>
</html>