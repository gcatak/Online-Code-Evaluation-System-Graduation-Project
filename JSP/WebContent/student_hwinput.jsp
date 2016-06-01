<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   

    
<!DOCTYPE html>
<html>


    <head>
        <title>OCES</title>
    </head>

<body align="center" bgcolor=#E6E6FA>



<div align="center">

<b>INPUT PAGE</b>







<%

request.setCharacterEncoding("UTF-8");
//String hws = request.getParameter("hwselecteds");

String groupselectedd = request.getParameter("groupselected_i");
session.setAttribute("groupselectedd",groupselectedd); 
%>




<% 

 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	
     ResultSet rs,rs2,rs3;
     rs = st.executeQuery("select first_name from student where id='" + session.getAttribute("userid") + "'");
     rs2 = st2.executeQuery("select last_name from student where id='" + session.getAttribute("userid") + "'");
     rs3 = st3.executeQuery("select name from ins_input where hw='" + session.getAttribute("hws") + "'" + "and" + " status='visible'" );
    %> 



<br>





<br>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

Name: 
<% while(rs.next()){ %>

<%=rs.getString(1)%>

<%} %>

<% while(rs2.next()){ %>

<%=rs2.getString(1)%>

<%} }%>
<br>

Course: 
<%=session.getAttribute("ics2")
%>
<br>
HW: 
<%=session.getAttribute("hws") %>


<br>
<br>

<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers111"   dataSource="${myDS}">
        SELECT * FROM groupp_student where name = ?;
        <sql:param value="${groupselectedd}" />
                
    </sql:query>
    
    
          <sql:query var="listUsers1112"   dataSource="${myDS}">
         SELECT student.first_name,student.last_name, groupp_student.name
		FROM student
		INNER JOIN groupp_student on groupp_student.id=student.id where groupp_student.name=?
    
        <sql:param value="${groupselectedd}" />
                
    </sql:query>
  


<table  border="1" align="center" > 
<td>
<div align="center">
<b>GROUP INFORMATION</b>
<br>
Group Name: <%=request.getParameter("groupselected_i") %>
<%String groupselected = request.getParameter("groupselected_i"); 
session.setAttribute("groupselected",groupselected);%>
<br>
Member IDs: | <c:forEach var="x3" items="${listUsers111.rows}"><c:out value="${x3.id}" /> | </c:forEach>
<br>
Member Names: | <c:forEach var="x5" items="${listUsers1112.rows}"><c:out value="${x5.first_name}" /> <c:out value="${x5.last_name}" /> | </c:forEach>
<br>
 </td>
  </div>
</table>
</div>
<br>
<table  style="width:100%" align="center"><td> 
Select saved input:<br>
<form  method="post" action="student_hwinput.jsp?groupselected_i=${groupselected}"> 
<select id="mySelect" name="inputx" onchange="this.form.submit()">
                        <option></option>
  <% while(rs3.next()){ %>

<option><%=rs3.getString(1)%></option>

<%} %>
<%session.setAttribute("inputnamex",request.getParameter("inputx")); %>
	</select> </form>

	
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers44"   dataSource="${myDS}">
        SELECT * FROM ins_input where name = ? and hw = ? and status = ?;
        <sql:param value="${param.inputx}" />
         <sql:param value="${hws}" />
         <sql:param value="visible"/>
    </sql:query>
   
  
    <c:forEach var="y" items="${listUsers44.rows}">
    <c:out value="${y.name}"/>
    </c:forEach>
    
   <br>
<form method="post" action="Index2.jsp?groupselected_i=${groupselected}"> 
		
<textarea readonly="readonly" name='inputfile' id='test' style="width:400px;height:300px;"><c:forEach var="y" items="${listUsers44.rows}"><c:out value="${y.input}"/></c:forEach></textarea>
	</td>
	
	
	<td>
	<br>

	Code:<br>
	<div align="left">
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="file" name="datafile3" id="fileCode" size="40"><br> </div>
	<textarea  name="code" id="ta3"  style="width:400px;height:300px;"></textarea></td>
	
	 </td>
	 	<td> You should select one input and upload your code.<br> Then, click Execute button. <br><br>
	 	  <input type="submit" value="Execute" /> <br><br><br>
	 	 	 <a href="student_seecode.jsp?groupselected_i=${groupselected}"><button type="button">See your code if it exists.</button></a>
	 	  </td>
	  </form>
	 </table>
<br>
<a href="student_hw.jsp?hwselecteds=${hws}" ><font color="blue">Go to Back Page</font> </a>
 
   
</body>
<script>

window.onload = function() {
	
	//var fileInput2 = document.getElementById('fileOutput');
	var fileInput3 = document.getElementById('fileCode');
			
	//var OutputDisplayArea = document.getElementById('ta2');
	var CodeDisplayArea = document.getElementById('ta3');


			

				
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
