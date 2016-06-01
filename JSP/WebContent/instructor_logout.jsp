<%@ page errorPage="error.jsp" %>
<%
session.setAttribute("instructoruname", null);
session.invalidate();
response.sendRedirect("instructor_index.jsp");
%>