<%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OCES</title>
</head>
<body bgcolor="#E6E6FA">


<%
/*
Connection conn = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser","root","root2");
	if (conn!=null)
	{
		out.print("connected");
	}
}catch(Exception e){
	out.print("Not connected \n");
	out.print(e);
}

*/
%>
 <form action="Index2.jsp" method="post">
 
 <input type="file" name="datafile" id="fileInput" size="40">

 <br>
  <label id="3" for="input">Your input: (You can try your own input)</label><br>
 <textarea name="inputfile" id="fileDisplayArea" style="width:400px;height:150px;"></textarea><br>
 

  <input type="file" name="datafile2" id="fileInput2" size="40">
  <br>
 <label for="Your Code">Your Code :</label><br>
 <textarea name="code" id="fdp" style="width:1000px;height:375px;"></textarea><br>
 <input type="submit" value="Compile and Run" /> <br>

 </form>
</body>
<script>
 window.onload = function() {
		
var fileInput = document.getElementById('fileInput');
var fileInput2 = document.getElementById('fileInput2');
		
var fileDisplayArea = document.getElementById('fileDisplayArea');
var fdp = document.getElementById('fdp');

		
fileInput.addEventListener('change', function(e) {
			
var file = fileInput.files[0];

			var textType = /text.*/;

			

				var reader = new FileReader();

	
			reader.onload = function(e) {
					
fileDisplayArea.innerText = reader.result;
				}


				reader.readAsText(file);	
			

		});
		
		
		
fileInput2.addEventListener('change', function(e) {
	
	var file = fileInput2.files[0];

				var textType = /text.*/;

				

					var reader = new FileReader();

		
				reader.onload = function(e) {
						
	fdp.innerText = reader.result;
					}


					reader.readAsText(file);	
				

			});
}

</script>

</html>
