<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body bgcolor="#E6E6FA"> 
<%
	request.setCharacterEncoding("UTF-8");

    String inputfile = request.getParameter("instructorifile");
    String outputfile = request.getParameter("instructorofile");
    String runtime = request.getParameter("instructorruntime");
   String inputname = request.getParameter("inputname");
    String status = request.getParameter("status");
    String code = (String)session.getAttribute("code");
    String hwss=(String)session.getAttribute("hwss");
    String stt="on";
    
    if(stt.equals(status))
    	stt = "invisible";
    else
    	stt = "visible";
 
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2= con.createStatement();
    //ResultSet rs;
    
  /*  byte[] bytes = new byte[id.length()];
	for (int i = 0; i < id.length(); i++) bytes[i] = (byte) id.charAt(i);
	String ido = new String(bytes, "UTF-8");
	
	*/
	
  int ii = st.executeUpdate("insert into ins_input(hw,name,input,output,status,runtime) values ('" + hwss + "','" + inputname + "','" + inputfile + "','" + outputfile + "','" + stt + "','" + runtime + "')");
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
Your input-output and runtime is saved. <br><br>
<a href="instructor_hw.jsp?hwselected=${hwss}"> Go to back page.</a>
</div> 
</body>
</html>
