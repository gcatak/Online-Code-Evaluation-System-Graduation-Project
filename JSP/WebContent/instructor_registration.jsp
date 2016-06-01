<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String uname = request.getParameter("uname");
    String secretquestion = request.getParameter("secretquestion");
    String secretanswer = request.getParameter("secretanswer");
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    //ResultSet rs;
    
  /*  byte[] bytes = new byte[id.length()];
	for (int i = 0; i < id.length(); i++) bytes[i] = (byte) id.charAt(i);
	String ido = new String(bytes, "UTF-8");
	
	*/
	
    int i = st.executeUpdate("insert into instructor(username,first_name, last_name, email, pass, secret_question, secret_answer, regdate) values ('" + uname + "','" + fname + "','" + lname + "','" + email + "','" + pwd + "','" + secretquestion + "','" + secretanswer + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("instructor_welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("instructor_index.jsp");
    }
%>