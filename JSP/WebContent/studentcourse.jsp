<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
    <head>
        <title>OCES</title>
    </head>
<body bgcolor="#E6E6FA" align = "center"> 
<br>
<%
	request.setCharacterEncoding("UTF-8");
    String coursename = request.getParameter("coursename");    
    String coursepwd = request.getParameter("coursepass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs,rs2;
    
    rs = st.executeQuery("select * from course where name='" + coursename + "' and pass='" + coursepwd + "'");
    if (rs.next()) {
       // session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
      //  out.println("Success!");
        response.sendRedirect("success.jsp");
       
        //insert into course(name,pass,instructor) values('cse444','123','Ömer Korçak')
//session.getAttribute("userid")
//"insert into student(id,first_name, last_name, email, pass, secret_question, secret_answer, regdate) values ('" + id + "','" + fname + "','" + lname + "','" + email + "','" + pwd + "','" + secretquestion + "','" + secretanswer + "', CURDATE())"
        int a = st2.executeUpdate("insert into course_student(name,id) values ('" +  coursename + "'," + session.getAttribute("userid") +")" );
    } else {
        out.println("Invalid course name or password <a href='success.jsp'>try again</a>");
    }
    
%>
</body>