<%@ page errorPage="error.jsp" %>
    <%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%= request.getParameter("hwdate")%>
<%=session.getAttribute("instructoruname") %>
<%=session.getAttribute("ics") %>
<%=request.getParameter("hwname") %>
<html>
    <head>
        <title>OCES</title>
    </head>
<% 
request.setCharacterEncoding("UTF-8");


//String uname = session.getAttribute("instructoruname");
String name = request.getParameter("hwname");
//String course = session.getAttribute("ics");
String hwdate = request.getParameter("hwdate");


Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
        "root", "root2");
Statement st = con.createStatement();

int i = st.executeUpdate("insert into hw(name,course,instructor,duedate) values ('" + name + "','" + session.getAttribute("ics") + "','" + session.getAttribute("instructoruname") + "','" + hwdate + "')" );
if (i > 0) {
    //session.setAttribute("userid", user);
    response.sendRedirect("instructor_course.jsp?value2=" + session.getAttribute("ics"));
   // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
    response.sendRedirect("instructor_index.jsp");
}
%>






</html>




