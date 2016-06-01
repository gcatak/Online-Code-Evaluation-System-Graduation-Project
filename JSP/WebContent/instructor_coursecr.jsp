<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <head>
        <title>OCES</title>
    </head>
<body bgcolor="#E6E6FA"> 
<%
	request.setCharacterEncoding("UTF-8");
    String coursename = request.getParameter("instructorcoursename");    
    String coursepwd = request.getParameter("instructorcoursepass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs,rs2;
    
    
    int k = st.executeUpdate("insert into course(name,pass,instructor) values ('" + coursename + "','" +coursepwd + "','" + session.getAttribute("instructoruname") +"')");
    if (k>0) {
       // session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
      //  out.println("Success!");
        response.sendRedirect("instructor_success.jsp");
       
        //insert into course(name,pass,instructor) values('cse444','123','Ömer Korçak')
//session.getAttribute("userid")
//"insert into student(id,first_name, last_name, email, pass, secret_question, secret_answer, regdate) values ('" + id + "','" + fname + "','" + lname + "','" + email + "','" + pwd + "','" + secretquestion + "','" + secretanswer + "', CURDATE())"
       // int a = st2.executeUpdate("insert into course_student(name,id) values ('" +  coursename + "'," + session.getAttribute("userid") +")" );
    } else {
        out.println("Invalid course name or password <a href='instructor_success.jsp'>try again</a>");
    }
    
%>
</body>