<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>
<html>
    <head>
        <title>OCES</title>
    </head>

<body align="center" bgcolor="#E6E6FA"> 

<%
	request.setCharacterEncoding("UTF-8");
    String studentid = request.getParameter("id");    
    session.setAttribute("id",studentid);
  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet rs,rs2,rs1;
    
    
    
    rs = st.executeQuery("select secret_question from student where id='" + studentid  + "'");

    rs1 = st2.executeQuery("select first_name from student where id='" +studentid + "'");
    rs2 = st3.executeQuery("select last_name from student where id='" + studentid + "'");
    
    String answer = "";
    if (rs.next()) {
        answer = rs.getString(1);
        
    } else {
        out.println("Invalid user ID <a href='student_forgetpw.jsp'>Please, try again</a>");
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

<form method="post" action="student_getpw.jsp"> 
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
<a href="index.jsp">Go Back.</a>

</html>
