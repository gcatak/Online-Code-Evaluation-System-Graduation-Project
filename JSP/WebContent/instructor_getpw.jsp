
<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> 

 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OCES</title>

<body align = "center" bgcolor="#E6E6FA">
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
           "root", "root2");
   Statement st = con.createStatement();
   ResultSet rs,rs2;
   rs = st.executeQuery("select secret_answer from instructor where username='" + session.getAttribute("usernamex") + "'");
   	
   String secretanswer= "";
   while(rs.next()){

   secretanswer = rs.getString(1);
   }
   
   rs2 = st.executeQuery("select pass from instructor where username='" + session.getAttribute("usernamex") + "'");
	
   String pass= "";
   while(rs2.next()){

   pass = rs2.getString(1);
   }
   
   
   int x = secretanswer.compareTo(request.getParameter("answer"));
   
   String temp = "";
   if(x==0)
   	temp ="Your password is: "  + pass;
   else
	   temp = "Wrong secret answer. <a href =instructor_forgetpw.jsp> Go back.</a>";
   
   
%>







<br>
<br> 

<%=temp %>
<br>
<br>
<a href="instructor_index.jsp">Login Here.</a>




</body>
</html>