<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<style>
table, th, td {
    border: 1px solid black;
}


</style>

        <title>OCES</title>
   
</head>
<body align = "center" bgcolor="#E6E6FA">


   <form method="post" action="instructor_coursecr.jsp">
<br>

<b>WELCOME</b> 
<br>

<% 
request.setCharacterEncoding("UTF-8");
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
     ResultSet rs,rs2,rs3;
     rs = st.executeQuery("select first_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs2 = st2.executeQuery("select last_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs3 = st3.executeQuery("select name from course where instructor='" + session.getAttribute("instructoruname") + "'");
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

<%} %>

<br>
<table width = "23%" align="center">
<tr>
				<thead>
                    <tr>
                        <th colspan="2">Create a New Course</th>
                    </tr>
                     
                </thead>
                        <td>Course Name</td>
                        <td><input type="text" name="instructorcoursename" value="" /></td>
                        
                        
                        <tr>
                        <td>Course Password</td>
                        <td><input type="password" name="instructorcoursepass" value="" /></td>
                    </tr>
                    
                     <tr>
                       <th colspan="2"> <input type="submit"  value="CREATE" /><a href="instructor_coursecr.jsp"></th>
                    </tr>
</tr>
<br>
</table>

</form>
Note:<br>
 Please, avoid <b>Turkish characters</b> for course name!

<form method="post" action="instructor_delete.jsp">

<br>
<table width="23%" align = "center">
<thead>
                    <tr>
                        <th colspan="2">Delete a Course</th>
                    </tr>
                </thead>
                
                <tr>
                	<td>
                      Select Course
                      </td>  
                     
                      <td>
                        Course Password
                      </td>  
                    </tr>
                    
                <tr>
                
                
                        <td><select id="mySelect" name="deleted" onchange="copy();">
  <% while(rs3.next()){ %>

<option><%=rs3.getString(1)%></option>

<%} %>
	</select>
	
	</td>
                        <td><input type="text" name="deletedpass"  /></td>
                        
                     </tr>   
                     <tr>
                      <th colspan="2"> <input type="submit"  value="DELETE" /></th>
                     </tr>
</table>
</form>
<br>



<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM course where instructor = ?;
        <sql:param value="${instructoruname}" />
    </sql:query>
    
    
     
    <div align="center">
        <table width= "23%" border="1" cellpadding="5">
          <tr>
                <th colspan=2>Your courses</th>
              
            </tr>
            <tr>
                <th>Course Name</th>
                <th>Password</th>
              
            </tr>
            <c:forEach var="x" items="${listUsers.rows}">
                <tr>
                    <td align="center"><a href="instructor_course.jsp?value2=${x.name}" target="_new"><c:out value="${x.name}" /></a></td>
                      <td align="center"><c:out value="${x.pass}" /></td>
            
                </tr>
            </c:forEach>
        </table>
    </div>
<br>
<br>
<a href='instructor_logout.jsp'>Log out</a>
<%
    }
%>

</body>
<script>
function copy() {
    document.getElementById("label").innerHTML = document.getElementById("mySelect").value
}
</script>
</html>

