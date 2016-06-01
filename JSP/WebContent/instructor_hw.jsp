<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
    
<html>





<head>


<title>OCES</title>
<style>
table, th, td {
    border: 1px solid black;
}

section {
    width: 100%;
    height: 100%;
    padding: 1px;
}
div#one {
    width: 0%;
    height: 150px;
    float: left;
}
div#two {
    margin-left: 40%;
    height: 150px;
}
</style>
</head>
<body align="center" bgcolor="#E6E6FA">






<br>
<b>INPUT - CODE</b>

<br>

<% 

request.setCharacterEncoding("UTF-8");
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
     ResultSet rs,rs2,rs3;
     rs = st.executeQuery("select first_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs2 = st2.executeQuery("select last_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs3 = st3.executeQuery("select name from hw where course='" + request.getParameter("value2") + "'" );
    %> 
<%
    if ((session.getAttribute("instructoruname") == null) || (session.getAttribute("instructoruname") == "")) {
%>
You are not logged in<br/>
<a href="instructor_index.jsp">Please Login</a>
<%} else {
%>

<br>
Name: 
<% while(rs.next()){ %>

<%=rs.getString(1)%>

<%} %>

<% while(rs2.next()){ %>

<%=rs2.getString(1)%>

<%} }%>
<br>

Course: 
<%=session.getAttribute("ics") 
%>
<br>
HW: <%=request.getParameter("hwselected")%>
<%


String hwss = request.getParameter("hwselected");
session.setAttribute("hwss",hwss); 
%>

<br>
<br>


<form action=instructor_output.jsp method=post> 
  
    <div id="one">  
    
   
	<br>
	<input type="file" name="datafile" id="fileInput" size="40">
    <label for="ta1">Input:</label>
    <textarea name="instructorinputfile" id="ta1" style="width: 400px; height: 150px;" ></textarea><br>
   <br><br>
   
   <input type="submit" value="Compile, run, analyse" /> <br><br>
    You&nbsp;can&nbsp;also&nbsp;give&nbsp;just&nbsp;input&nbsp;and&nbsp;output.
    <br>
    <br>
   <a href="input_output.jsp"><input type="button" value="Go to Input-output page" /> </a> </div>
    
    
    
<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	   
    &nbsp;<input type="file" name="datafile3" id="fileCode" size="40"> <br>
    <%//<%=b.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.java") %>
    <label for="ta3">Code:</label><br>
    <div id="two"> 
    <textarea name="instructorcode" id="ta3" style="width: 600px; height: 300px;" ></textarea>
    </div>
    
</section>
<br><br><br><br><br><br><br><br><br><br>


	
</body>
	
	 


</form>

<script>
 window.onload = function() {
		
var fileInput = document.getElementById('fileInput');
//var fileInput2 = document.getElementById('fileOutput');
var fileInput3 = document.getElementById('fileCode');
		
		
var InputDisplayArea = document.getElementById('ta1');
//var OutputDisplayArea = document.getElementById('ta2');
var CodeDisplayArea = document.getElementById('ta3');

		
fileInput.addEventListener('change', function(e) {
			
var file = fileInput.files[0];

			var textType = /text.*/;

			

				var reader = new FileReader();

	
			reader.onload = function(e) {
					
InputDisplayArea.innerText = reader.result;
				}
				reader.readAsText(file);	
		});
		
		
		

			
fileInput3.addEventListener('change', function(e) {
	
	var file = fileInput3.files[0];

				var textType = /text.*/;
				var reader = new FileReader();
				reader.onload = function(e) {
						
	CodeDisplayArea.innerText = reader.result;
					}


					reader.readAsText(file);	
				

			});			
			
}

</script>







  <a href="instructor_course.jsp?value2=${ics}">Go to Back Page </a>
  </body>
  </html>