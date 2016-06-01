<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<br>
<body bgcolor="#E6E6FA">
    <head>
        <title>OCES</title>
    </head>
<div align = "center"> 
<%
	request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("id");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    ResultSet rs;
    
    rs = st.executeQuery("select * from student where id='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>Please, try again</a>");
    }
    
%>

</div>
</body>