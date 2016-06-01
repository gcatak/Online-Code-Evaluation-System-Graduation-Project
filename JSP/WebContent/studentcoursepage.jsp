<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>





<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCES</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body align="center" bgcolor="#E6E6FA">
<b>COURSE PAGE</b>

<br>


<%

request.setCharacterEncoding("UTF-8");
String ics2 = request.getParameter("value1");
session.setAttribute("ics2",ics2); 

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
     rs3 = st3.executeQuery("select name from hw where course='" + request.getParameter("value1") + "'" );
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

<%} }%>
<br>

Course: 
<%=session.getAttribute("ics2")
%>

<br>
<br>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser"
        user="root" password="root2"
    />
     
    <sql:query var="xyz"   dataSource="${myDS}">
        SELECT * FROM hw where course = ?;
        <sql:param value="${ics2}" />
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
            <c:forEach var="yy" items="${xyz.rows}">
                <tr>
                    <td align="center"><a href="student_hw.jsp?hwselecteds=${yy.name}" target="_new"><c:out value="${yy.name}" /></a></td>
                      <td align="center"><c:out value="${yy.duedate}" /></td>
            
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
    
    <a href="success.jsp">Go to Back Page </a>
</body>

<script>
function copy() {
    document.getElementById("label").innerHTML = document.getElementById("mySelect").value
}
</script>

</html>