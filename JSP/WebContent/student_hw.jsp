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
<b>HOMEWORK PAGE</b>

<br>


<%

request.setCharacterEncoding("UTF-8");
String hws = request.getParameter("hwselecteds");
session.setAttribute("hws",hws); 


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
HW: 
<%=session.getAttribute("hws") %>
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
    <form method="post" action="student_groupcreate.jsp">
        <table width= "23%" border="1" cellpadding="5">
          <tr>
                <th colspan=2>Create a New Group</th>
              
            </tr>
            <tr>
               <td>Group Name</td>
                <td><input type="text" name="groupname"/></td>
              
            </tr>
                <tr>
                <td>2nd Member</td>
                <td><input type="text" name="studentid1" placeholder="Student ID(if any)"/></td>
                    
                </tr>
            <tr>
                <td>3rd Member</td>
                <td><input type="text" name="studentid2" placeholder="Student ID(if any)"/></td>
                    
                </tr>
                 <tr>
                       <th colspan="2"> <input type="submit"  value="CREATE" /><a href="studentcourse.jsp"></th>
                    </tr>
            
    
        </table>
        
            Notes:
            <br>
            You should create a new group to submit your code, <br>
            although you do your own project single-handedly.<br>
            If so, please leave Member Boxes <b>empty</b>.<br>
            Please, avoid <b>turkish characters</b> for group name.
            <br>
            Your groups will be seen in the following table.
        </form>
        <br>
    </div>
   
    
    Click group name to go to <b>Input Page</b>
    
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers33"   dataSource="${myDS}">
        SELECT * FROM groupp_student where id = ? and hw = ?;
        <sql:param value="${userid}" />
         <sql:param value="${hws}" />
    </sql:query>
    
    
    
     <div align="center">
        <table width= "23%" border="1" cellpadding="5">
          <tr>
                <th colspan=2>Your Groups</th>
              
            </tr>
            <tr>
                <th>Group Name</th>
                <th>Delete</th>
              
            </tr>
            <c:forEach var="x2" items="${listUsers33.rows}">
                <tr>
                    <td align="center"><a href="student_hwinput.jsp?groupselected_i=${x2.name}" target="_new"><c:out value="${x2.name}" /></a></td>
                      <td align="center"> <a href="student_group_delete.jsp?deletedgroup=${x2.name}">&#x2717;</a></td>
            
                </tr>
            </c:forEach>
        </table>
    </div>
    
   
    
    <br>
    
    <a href="studentcoursepage.jsp?value1=${ics2}">Go to Back Page </a>
</body>

<script>
function copy() {
    document.getElementById("label").innerHTML = document.getElementById("mySelect").value
}
</script>

</html>