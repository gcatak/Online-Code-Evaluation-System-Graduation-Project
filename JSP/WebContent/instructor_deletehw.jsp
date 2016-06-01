<%@ page errorPage="error.jsp" %>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">
<br>
HW name is :
<%=request.getParameter("deletedhw") 
%>
<%
String deletedhw = request.getParameter("deletedhw");
session.setAttribute("deletedhw",deletedhw);
%>
<br>
<br>
Are you sure to delete this homework? <br><br><br> <a href='instructor_delete_hw.jsp'>YES</a> <br><br><br><a href='instructor_course.jsp?value2=${ics}'>Go Back.</a>

 </body>
</html>