<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>OCES</title>
</head>
<body bgcolor="#E6E6FA">
<%=request.getParameter("groupname") %>
<%=session.getAttribute("ics2") %>
<%=session.getAttribute("hws") %>
<%
request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
           "root", "root2");
   Statement st = con.createStatement();
   Statement st2 = con.createStatement();
   Statement st3 = con.createStatement();







String groupname = request.getParameter("groupname"); 
String course = (String)session.getAttribute("ics2");
String hws = (String)session.getAttribute("hws");


//if ((session.getAttribute("instructoruname") == null) || (session.getAttribute("instructoruname") == ""))
	
/*String id1 = null;	
if(request.getParameter("studentid1") != null)*/

String id = (String)session.getAttribute("userid");

String id1 = request.getParameter("studentid1");

String id2 = request.getParameter("studentid2");


int xy = st.executeUpdate("insert into groupp(name,course,hw) values ('" + groupname + "','" +course + "','" + hws +"')");
int xyz = st2.executeUpdate("insert into groupp_student(name,id,hw) values ('" + groupname + "','" +id + "','" + hws +"')");

int xxx;
int xxxxx;

if ((id1 != null) && id1 != "")
		xxx = st2.executeUpdate("insert into groupp_student(name,id,hw) values ('" + groupname + "','" +id1 + "','" + hws +"')");

if ((id2 != null) && id2 != "")
	xxxxx = st3.executeUpdate("insert into groupp_student(name,id,hw) values ('" + groupname + "','" +id2 + "','" + hws +"')");





	response.sendRedirect("student_hw.jsp?hwselecteds=" + hws);

	/*
}
else {
    out.println("Error!!! <a href='student_hw.jsp?hwselecteds=$(hws)'>try again</a>");
}
*/
%>
</body>
</html>