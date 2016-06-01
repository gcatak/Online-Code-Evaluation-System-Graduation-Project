<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">

<br>

<br>
<br>

<%

        out.println("Are you sure to delete your code? <br><br><br> <a href='delete_code_db.jsp'>YES</a> <br><br><br><a href='student_seecode.jsp?groupselected_i="+ session.getAttribute("groupselected") +"'>Go Back.</a>");
  
%>
 </body>
</html>