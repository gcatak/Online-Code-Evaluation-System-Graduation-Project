<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>OCES</title>
    </head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6FA">

<%
request.setCharacterEncoding("UTF-8");
String dhw=(String)session.getAttribute("deletedhw");


Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
            
            
    String sql = "DELETE FROM hw WHERE name= ?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, dhw);
  

    ps.executeUpdate();
    
    
    String sql2 = "DELETE FROM hw_io WHERE hw= ?";

    PreparedStatement ps2 = con.prepareStatement(sql2);
    ps2.setString(1, dhw);
   

    ps2.executeUpdate();
    
%>

Your HW was removed. 
<a href = 'instructor_course.jsp?value2=${ics}'> Go to Course Page </a>
</body>
</html>