<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<html>

    <head>
        <title>OCES</title>
    </head>
<body align="center" bgcolor="#E6E6FA">
<br>
<%
	request.setCharacterEncoding("UTF-8");
    String instructoruname = request.getParameter("instructorusername");    
    String instructorpwd = request.getParameter("instructorpass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    ResultSet rs;
    
    rs = st.executeQuery("select * from instructor where username='" + instructoruname + "' and pass='" + instructorpwd + "'");
    if (rs.next()) {
        session.setAttribute("instructoruname", instructoruname);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("instructor_success.jsp");
    } else {
        out.println("Invalid password <br><a href='instructor_index.jsp'>Please, try again</a>");
    }
    
%>
 </body> </html>