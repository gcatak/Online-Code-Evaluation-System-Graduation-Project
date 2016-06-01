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
</style>
</head>
<body align="center" bgcolor="#E6E6FA">






<br>
<b>COURSE PAGE</b>

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
<%


String ics = request.getParameter("value2");
session.setAttribute("ics",ics); 

%>

Course: 
<%=session.getAttribute("ics") 
%>

<br>
<br>
<form method="post" action="xy.jsp" >
<table width = "23%" align = "center">
<thead>
                    <tr>
                        <th colspan="2">Define a New Homework</th>
                    </tr>
                </thead>
  					                   
                      
                        
                        <tr>
                        <td>HW Name</td>
                        <td><input type="text" name="hwname" value="" /> </td>
                    </tr>
                    
                        <tr>
                        <td>Due Date</td>
                        <td><input type="datetime-local" name="hwdate" value="" /></td>
                    </tr>
                    
                    <tr>
                       <th colspan="2"> <input type="submit"  value="DEFINE" /></th>
                    </tr>
                    
                    
</table>
</form>
Note:<br>
 Please, avoid <b>Turkish characters</b> for homework name!



<form method="post" action="instructor_deletehw.jsp">

<br>
<table width="23%" align = "center">
<thead>
                    <tr>
                        <th colspan="2">Delete a HW</th>
                    </tr>
                </thead>
                
                <tr>
                	<td>
                      Select HW
                      </td>  
                      	
                     
          
                        <td><select id="mySelect2" name="deletedhw" onchange="copy();">
  <% while(rs3.next()){ %>

<option><%=rs3.getString(1)%></option>

<%} %>
	</select>
	
	
                        
                     </tr>   
                     <tr>
                      <th colspan="2"> <input type="submit"  value="DELETE" /></th>
                      </td>  
                     
                    </tr>
               
</table>
</form>
<br>



<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser"
        user="root" password="root2"
    />
     
    <sql:query var="xy"   dataSource="${myDS}">
        SELECT * FROM hw where instructor = ? and course = ?;
        <sql:param value="${instructoruname}" />
        <sql:param value="${ics}" />
    </sql:query>
    
    
     
    <div align="center">
        <table width= "23%" border="1" cellpadding="5">
          <tr>
                <th colspan=2>Homeworks</th>
              
            </tr>
            <tr>
                <th>HW Name</th>
                <th>Due Date</th>
              
            </tr>
            <c:forEach var="y" items="${xy.rows}">
                <tr>
                    <td align="center"><a href="instructor_hw.jsp?hwselected=${y.name}" target="_new"><c:out value="${y.name}" /></a></td>
                      <td align="center"><c:out value="${y.duedate}" /></td>
            
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
    
    <a href="instructor_success.jsp">Go to Back Page </a></body>
    <script>
function copy() {
    document.getElementById("label2").innerHTML = document.getElementById("mySelect2").value
}
</script>
</html>