<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <head>
        <title>OCES</title>
    </head>
<body bgcolor="#E6E6FA"> 
<%
	request.setCharacterEncoding("UTF-8");

    String groupname = (String)session.getAttribute("groupselected");
    String hwname = (String)session.getAttribute("hws");
    String code = (String)session.getAttribute("studentcode");
 
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
 //   Statement st = con.createStatement();
  //  Statement st2= con.createStatement();
    //ResultSet rs;
    
  /*  byte[] bytes = new byte[id.length()];
	for (int i = 0; i < id.length(); i++) bytes[i] = (byte) id.charAt(i);
	String ido = new String(bytes, "UTF-8");
	
	*/
	PreparedStatement st=con.prepareStatement("INSERT INTO student_submission(hwname, groupname,code,date) VALUES(?,?,?,now())");
	st.setString(1,hwname);
	st.setString(2,groupname);
	st.setString(3,code);
	st.executeUpdate();
	
	
 // int ii = st.executeUpdate("insert into student_submission(hwname,groupname,code) values ('" + hwname + "','" + groupname + "','" + code + "')");
 //	int iii  = st2.executeUpdate("insert into hw_code(hw,name,code) values ('" + hwss + "','"+ inputname + "','" + code  + "')");
	/*  if (i > 0) {
   //     session.setAttribute("userid", user);
       response.sendRedirect("instructor_welcome.jsp");
        out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
   } else {
       response.sendRedirect("instructor_index.jsp");
   }*/
%>
<br>
<br>
<br>

<div align="center"> 
Your code is saved. <br><br>
<a href="student_hwinput.jsp?groupselected_i=${groupselected}"> Go to back page.</a>
</div> 
</body>
