<%@ page errorPage="error.jsp" %>
<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCES</title>
</head>
<body bgcolor="#E6E6FA">

<div align="center">

<b>CODE PAGE</b>







<%

request.setCharacterEncoding("UTF-8");
//String hws = request.getParameter("hwselecteds");

String groupselectedd = request.getParameter("groupselected_i");
session.setAttribute("groupselectedd",groupselectedd); 
%>




<% 

 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();
	Statement st6 = con.createStatement();
	
     ResultSet rs,rs2,rs3,rs4,rs5,rs6;
     rs = st.executeQuery("select first_name from student where id='" + session.getAttribute("userid") + "'");
     rs2 = st2.executeQuery("select last_name from student where id='" + session.getAttribute("userid") + "'");
     rs3 = st3.executeQuery("select name from ins_input where hw='" + session.getAttribute("hws") + "'" + "and" + " status='visible'" );
     rs4 = st4.executeQuery("select output from ins_input where hw='" + session.getAttribute("hws") + "'" + "and" + " status='visible'" + "and" + " name=" + "'"+ session.getAttribute("inputnamex") + "'"  );
     rs5 = st5.executeQuery("select code from student_submission where hwname='" + session.getAttribute("hws") + "'" + "and" + " groupname= "+  "'" + groupselectedd + "'"  );
     rs6 = st6.executeQuery("select date from student_submission where hwname='" + session.getAttribute("hws") + "'" + "and" + " groupname= "+  "'" + groupselectedd + "'"  );
     
	  String output = "";
	  while(rs4.next()){ 
			
	output = rs4.getString(1);

}
	  String code = "";
	  while(rs5.next()){ 

	  code = rs5.getString(1);

	  } 
	  
	  
	  String date = "";
	  while(rs6.next()){ 

	  date = rs6.getString(1);

	  }
	  
	  
	  
	  %>
	  
	  



<br>





<br>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

Name: 
<% while(rs.next()){ %>

<%=rs.getString(1)%>

<%} %>

<% while(rs2.next()){ %>

<%=rs2.getString(1)%>

<%} }%>
<br>

Course: 
<%=session.getAttribute("ics2")
%>
<br>
HW: 
<%=session.getAttribute("hws") %>


<br>
<br>

<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers111"   dataSource="${myDS}">
        SELECT * FROM groupp_student where name = ?;
        <sql:param value="${groupselectedd}" />
                
    </sql:query>
    
    
          <sql:query var="listUsers1112"   dataSource="${myDS}">
         SELECT student.first_name,student.last_name, groupp_student.name
		FROM student
		INNER JOIN groupp_student on groupp_student.id=student.id where groupp_student.name=?
    
        <sql:param value="${groupselectedd}" />
                
    </sql:query>
  


<table  border="1" align="center" > 
<td>
<div align="center">
<b>GROUP INFORMATION</b>
<br>
Group Name: <%=request.getParameter("groupselected_i") %>
<%String groupselected = request.getParameter("groupselected_i"); 
session.setAttribute("groupselected",groupselected);%>
<br>
Member IDs: | <c:forEach var="x3" items="${listUsers111.rows}"><c:out value="${x3.id}" /> | </c:forEach>
<br>
Member Names: | <c:forEach var="x5" items="${listUsers1112.rows}"><c:out value="${x5.first_name}" /> <c:out value="${x5.last_name}" /> | </c:forEach>
<br>
 </td>
  </div>
</table></div>

	 <%
	 
	  
	  String temp = "";
	  if(output.equals(request.getParameter("outputfile")))
	    	temp = "[&#10004;] Your code runs <b> correctly</b>, you can save your code. ";
	    else
	    	temp = " [&#10008;] Your code does <b>not</b> run correctly. Please, try again and obey our rules.";
    
	 
	 %>
	 <br>
	 <table style="width:80%" align="center"> 
	 <tr>
	 <td>
	

	<br><br>
	
	 Your saved code :          &nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;



	    Saved Time: &nbsp;<%=date %> <br> 
	  <textarea name="code" readonly="readonly" style="width:600px;height:290px;"><%=code %></textarea>
	
	
	 </td>
	 <td style="width:30%">
	You can delete your code.<br>
	<br>
	<a href="student_deletecode.jsp"><button type="button">Delete your code.</button></a>
	
	
	 </td>
	 </tr>
	 </table>
	 <br>
	 <div align="center"> 
	 <a href="student_hwinput.jsp?groupselected_i=${groupselected}" ><font color="blue">Go to Back Page</font> </a>
 </div>
   </body> 
   
   <% //session.removeAttribute("studentcode"); %>
</html>