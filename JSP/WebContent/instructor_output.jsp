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
<style>
div#a {
   
    float: center;
}
</style>
<body bgcolor="#E6E6FA">

<br>
<div align="center"> 
<b>RESULT PAGE</b>
</div>

<div align="center"> 
<% 

request.setCharacterEncoding("UTF-8");
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
            "root", "root2");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
     ResultSet rs,rs2,rs3;
     rs = st.executeQuery("select first_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs2 = st2.executeQuery("select last_name from instructor where username='" + session.getAttribute("instructoruname") + "'");
     rs3 = st3.executeQuery("select name from hw where course='" + request.getParameter("value2") + "'" );
    %> 
<%
    if ((session.getAttribute("instructoruname") == null) || (session.getAttribute("instructoruname") == "")) {
%>
You are not logged in<br/>
<a href="instructor_index.jsp">Please Login</a>
<%} else {
%>

<br>
Name: 
<% while(rs.next()){ %>

<%=rs.getString(1)%>

<%} %>

<% while(rs2.next()){ %>

<%=rs2.getString(1)%>

<%} }%>
<br>

Course: 
<%=session.getAttribute("ics") 
%>
<br>
HW: <%=session.getAttribute("hwss") %>
<%
String code = request.getParameter("instructorcode");
session.setAttribute("code",code); 
%>

</div>
<br>
<jsp:useBean id="b" scope="session" class="bean.comprun"/>
  <jsp:setProperty property="*" name="b"  />
   <%
   synchronized(this){
	   b.DosyayaYaz(b.getInstructorinputfile(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorinput.txt");
  		b.DosyayaYaz(b.getInstructorcode(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.java");
   %>
 	
 <table style="width:100%" align="center">
 <tr>
 <td><form  method ="post" action="instructor_analysis.jsp">
<b>Console(cmd) output:</b>
<br>
<%
long startTime = System.nanoTime();  
long startTime1 = System.currentTimeMillis();
 %>

<textarea readonly="readonly" style="width:400px;height:290px;"><%=b.compilefile("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse","instructorcode","instructorinput.txt")%></textarea>
</td>
<%

/*
int k= 1;
for(int i=0;i<k;i++){
String a = kaydet1.compilefile("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse","code","input.txt"); 
}
*/
%>

<% long endTime = System.nanoTime();
	 long estimatedTime = endTime - startTime;
	 System.out.println(estimatedTime);  
	 
	 long endTime2 = System.currentTimeMillis();
	 long estimatedTime2 = endTime2 - startTime1;
	 System.out.println(estimatedTime2); 
 
	 %>

<td>
<b>Entered input file:</b><br>

<textarea name="instructorifile" readonly="readonly" style="width:400px;height:290px;"><%=b.viewtexti("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorinput.txt")%></textarea>   
 </td>  
 <td>
 <b>Generated output file:</b><br>

<textarea name="instructorofile" readonly="readonly" style="width:400px;height:290px;"><%=b.viewtexti("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructoroutput.txt")%></textarea>   
</td>
</tr> 

<tr><td>
<br><b>Runtime of your code: (ms)</b><br>

 
	
	 <textarea name="instructorruntime" readonly="readonly" style="width:100px;height:15px;"><%=estimatedTime2%></textarea>  
	 </td> 
	 
	 
	 
	 <td><table>
	 <br>
	 <b>Input name:</b><br>
	 <td><textarea name="inputname" style="width:100px;height:15px;"></textarea>  </td>
	 <td><input type="checkbox" name="status">Invisible input<br></td>
	<td> <input type="submit" value="Save input-output"></form></td> 
	 </table>
	 </td>
	 
	 
	 </tr>
	 </table>
   <%	b.deletefilesins();
   session.removeAttribute("b");
   
   

	int mb = 1024 * 1024; 

	// get Runtime instance
	Runtime instance = Runtime.getRuntime();
	
	System.out.println("Before");
	System.out.println("***** Heap utilization statistics [MB] *****\n");

	// available memory
	System.out.println("Total Memory: " + instance.totalMemory() / mb);

	// free memory
	System.out.println("Free Memory: " + instance.freeMemory() / mb);

	// used memory
	System.out.println("Used Memory: "
			+ (instance.totalMemory() - instance.freeMemory()) / mb);

	// Maximum available memory
	System.out.println("Max Memory: " + instance.maxMemory() / mb);
   Runtime.getRuntime().gc();
   
   
   

	//int mb2 = 1024 * 1024; 

	System.out.println("Before");
	// get Runtime instance
	Runtime instance2 = Runtime.getRuntime();

	System.out.println("***** Heap utilization statistics [MB] *****\n");

	// available memory
	System.out.println("Total Memory: " + instance2.totalMemory() / mb);

	// free memory
	System.out.println("Free Memory: " + instance2.freeMemory() / mb);

	// used memory
	System.out.println("Used Memory: "
			+ (instance.totalMemory() - instance2.freeMemory()) / mb);

	// Maximum available memory
	System.out.println("Max Memory: " + instance2.maxMemory() / mb);
   } %>
   <div align="center"> 
     <a href="instructor_hw.jsp?hwselected=${hwss}">Go to Back Page </a></div>
</body>
</html>