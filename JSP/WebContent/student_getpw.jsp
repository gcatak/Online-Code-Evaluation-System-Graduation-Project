
<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> 


<title>OCES</title>

<body align = "center" bgcolor="#E6E6FA">
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
           "root", "root2");
   Statement st = con.createStatement();
   ResultSet rs,rs2;
   rs = st.executeQuery("select secret_answer from student where id='" + session.getAttribute("id") + "'");
   	
   String secretanswer= "";
   while(rs.next()){

   secretanswer = rs.getString(1);
   }
   
   rs2 = st.executeQuery("select pass from student where id='" + session.getAttribute("id") + "'");
	
   String pass= "";
   while(rs2.next()){

   pass = rs2.getString(1);
   }
   
   
   int x = secretanswer.compareTo(request.getParameter("answer"));
   
   String temp = "";
   if(x==0)
   	temp ="Your password is: "  + pass;
   else
	   temp = "Wrong secret answer. <a href =student_forgetpw.jsp> Go back.</a>";
   
   
%>







<br>
<br> 

<%=temp %>
<br>
<a href="index.jsp">Login Here.</a>




</body>
</html>