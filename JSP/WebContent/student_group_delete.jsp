<%@ page errorPage="error.jsp" %>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">
<br>
Group name is :
<%=request.getParameter("deletedgroup") 
%>
<%
String deletedg = request.getParameter("deletedgroup");
session.setAttribute("deletedgroup",deletedg);
%>
<br>
<br>
Are you sure to delete this Group? <br><br><br> <a href='student_group_delete2.jsp'>YES</a> <br><br><br><a href='student_hw.jsp?hwselecteds=${hws}'>Go Back.</a>

 </body>
</html>