<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">
<br>
Course name is :
<%=request.getParameter("deleted") 
%>
<br>
<br>

<%
	request.setCharacterEncoding("UTF-8");
    String deletedcourse = request.getParameter("deleted");    
    String deletedpass = request.getParameter("deletedpass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    ResultSet rs;
    
    rs = st.executeQuery("select * from course where name='" + deletedcourse + "' and pass='" + deletedpass + "'");
    if (rs.next()) {
       // session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
       // response.sendRedirect("success.jsp");
       session.setAttribute("deletedcourse", deletedcourse);
       session.setAttribute("deletedpass", deletedpass);
        out.println("Are you sure to delete this course? <br><br><br> <a href='instructor_deletecourse.jsp'>YES</a> <br><br><br><a href='instructor_success.jsp'>Go Back.</a>");
    } else {
        out.println("Invalid password <a href='instructor_success.jsp'>Please, try again</a>");
    }
    
%>
 </body>
</html>