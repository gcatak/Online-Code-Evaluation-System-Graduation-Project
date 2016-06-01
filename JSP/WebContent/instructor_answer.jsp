<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align="center" bgcolor="#E6E6FA"> 

<%
	request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");    
    session.setAttribute("usernamex",username);
  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet rs,rs2,rs1;
    
    
    
    rs = st.executeQuery("select secret_question from instructor where username='" + username  + "'");

    rs1 = st2.executeQuery("select first_name from instructor where username='" +username + "'");
    rs2 = st3.executeQuery("select last_name from instructor where username='" + username + "'");
    
    String answer = "";
    if (rs.next()) {
        answer = rs.getString(1);
        
    } else {
        out.println("Invalid username <a href='instructor_forgetpw.jsp'>Please, try again</a>");
    }
    
%>
<br>
<div align = "center"> 
Name:
<% while(rs1.next()){ %>

<%=rs1.getString(1)%>

<%} %>

<% while(rs2.next()){ %>

<%=rs2.getString(1)%>

<%} %>
</div>


<br> 


<br>
<table border = "1" align = "center" style = "width:30%"> 

<form method="post" action="instructor_getpw.jsp"> 
<thead>
                    <tr>
                        <th colspan="3">Write Your Answer.</th>
                    </tr>
                </thead>
<tr> 

<td> Question: </td>
 <td colspan="2"><%=answer%> ?</td>


</tr>



<tr> 
<td> Answer </td>
<td> <input type="text" name="answer" value="" /></td>
<td> <input type="submit" value="Get Password."> </td>
</tr> 

</form>
</table>
</body>
<br> 
<a href="instructor_index.jsp">Go Back.</a>

</html>
