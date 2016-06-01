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


</head>
<body align="center" bgcolor="#E6E6FA">






<br>
<b>INPUT - OUTPUT</b>

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
     rs3 = st3.executeQuery("select name from ins_input where hw='" + session.getAttribute("hwss") + "'" );
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
HW: <%=session.getAttribute("hwss")%>
<%

/*
String hwss = request.getParameter("hwselected");
session.setAttribute("hwss",hwss); */
%>
<hr>
<table  style="width:100%" align="center"> 
<form method="post" action="input_output.jsp">
<td>Select saved input:
  
                        <select id="mySelect" name="deleted" onchange="this.form.submit()">
                        <option></option>
  <% while(rs3.next()){ %>

<option><%=rs3.getString(1)%></option>

<%} %>
	</select><br>
	
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers44"   dataSource="${myDS}">
        SELECT * FROM ins_input where name = ? and hw = ?;
        <sql:param value="${param.deleted}" />
         <sql:param value="${hwss}" />
    </sql:query>
   
  
    <c:forEach var="y" items="${listUsers44.rows}">
    <c:out value="${y.name}"/>
    </c:forEach>
 <br>
	      
	
	
<textarea name='input' readonly="readonly" id='test' style="width:350px;height:200px;"><c:forEach var="y" items="${listUsers44.rows}"><c:out value="${y.input}"/></c:forEach></textarea></td>

<td>Output:<br><br>
	<textarea readonly="readonly" style="width:350px;height:200px;"><c:forEach var="y" items="${listUsers44.rows}"><c:out value="${y.output}"/></c:forEach></textarea></td>
<td>  Runtime(ms): <c:forEach var="y" items="${listUsers44.rows}"><c:out value="${y.runtime}"/></c:forEach><br><br>
Status: <c:forEach var="y" items="${listUsers44.rows}"><c:out value="${y.status}"/></c:forEach><br><br>
<%
String deleted = request.getParameter("deleted");
session.setAttribute("deletedio",deleted);
%>
</form>


 <a href="delete_io.jsp"><input type="button" value="Delete this input-output set" /> </a> </td>

</table>

<div align="left"> </div>
<form action=save_input_without_compilation.jsp method=post> 
<table style="width:100%" align = "center"> <hr>
<td>You can give input-output directly.<br>Input:<br>
<input type="file" name="datafile" id="fileInput" size="40"><br>
<textarea name="instructorinputfile" id="ta1" style="width:350px;height:200px;"></textarea></td>
<td>Output:<br>
<input type="file" name="datafile3" id="fileCode" size="40"><br>
<textarea  name="instructoroutputfile" id="ta3"  style="width:350px;height:200px;"></textarea></td>
<td> 
Input name: <br>
<textarea name="inputname" style="width:100px;height:15px;"></textarea><br><br>
<input type="checkbox" name="status">Invisible input<br><br>
<input type="submit" value="Save this input-output set" />
</td>



</table>

 </form>
<hr>
<br>
  <a href="instructor_hw.jsp?hwselected=${hwss}">Go to Back Page </a>
</body>
  
<script>
function copy() {
    document.getElementById("label2").innerHTML = document.getElementById("mySelect").value
}

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


</html>
