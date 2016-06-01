<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>

        <title>OCES</title>
 
</head>
<body align = "center" bgcolor="#E6E6FA">


   <form method="post" action="studentcourse.jsp">

<b>WELCOME</b>
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
     rs = st.executeQuery("select first_name from student where id='" + session.getAttribute("userid") + "'");
     rs2 = st2.executeQuery("select last_name from student where id='" + session.getAttribute("userid") + "'");
     rs3 = st3.executeQuery("select name from course_student where id ='"+ session.getAttribute("userid") + "'");
    %> 
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
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
                        <th colspan="2">Enroll a New Course</th>
                    </tr>
                </thead>
                        <td>Course Name</td>
                        <td><input type="text" name="coursename" value="" /></td>
                        
                        
                        <tr>
                        <td>Course Password</td>
                        <td><input type="password" name="coursepass" value="" /></td>
                    </tr>
                    
                     <tr>
                       <th colspan="2"> <input type="submit"  value="ENROLL" /><a href="studentcourse.jsp"></th>
                    </tr>
</tr>
<br>
</table>
<br>



</form>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT name FROM course_student where id = ?;
        <sql:param value="${userid}" />
    </sql:query>
    
    
     
    <div align="center">
        <table align="center" width= "23%" border="1" cellpadding="5">
           
            <tr>
                <th>Your courses</th>
              
            </tr>
            <c:forEach var="x" items="${listUsers.rows}">
                <tr>
                    <td align="center"><a href="studentcoursepage.jsp?value1=${x.name}" target="_new"> <c:out value="${x.name}" /></a></td>
                   
            
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
    
    

<a href='logout.jsp'>Log out</a>
<%

//session.setAttribute("instructoruname", instructoruname);
    }
%>
</body>


</html>

