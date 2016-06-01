<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">
<br>
Input name is :
<%=session.getAttribute("deletedio")
%>
<br>
<br>

<%
	request.setCharacterEncoding("UTF-8");
   
  //  String deletedpass = request.getParameter("deletedpass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    ResultSet rs;
    
        out.println("Are you sure to delete this input-output set? <br><br><br> <a href='delete_io_db.jsp'>YES</a> <br><br><br><a href='input_output.jsp'>Go Back.</a>");
  
%>
 </body>
</html>