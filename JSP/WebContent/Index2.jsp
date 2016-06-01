
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

<b>OUTPUT PAGE</b>







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
	
     ResultSet rs,rs2,rs3,rs4;
     rs = st.executeQuery("select first_name from student where id='" + session.getAttribute("userid") + "'");
     rs2 = st2.executeQuery("select last_name from student where id='" + session.getAttribute("userid") + "'");
     rs3 = st3.executeQuery("select name from ins_input where hw='" + session.getAttribute("hws") + "'" + "and" + " status='visible'" );
     rs4 = st4.executeQuery("select output from ins_input where hw='" + session.getAttribute("hws") + "'" + "and" + " status='visible'" + "and" + " name=" + "'"+ session.getAttribute("inputnamex") + "'"  );
    
     
	  String output = "";
	  while(rs4.next()){ 
			
	output = rs4.getString(1);

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
</table>
</div>
 <form method ="post" action="student_test.jsp?groupselected_i=${groupselected}">  
<br>
<jsp:useBean id="kaydet1" scope="session" class="bean.comprun"/>
<jsp:setProperty property="*" name="kaydet1"/>

   <%
   session.setAttribute("studentcode",kaydet1.getCode());
   synchronized(this){
   kaydet1.DosyayaYaz(kaydet1.getInputfile(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\input.txt");
   kaydet1.DosyayaYaz(kaydet1.getCode(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\code.java");
   %>
 	
<table  style="width:100%" align="center">
<td>
<b>Console(cmd) output:</b><br>

<%
long startTime = System.nanoTime();  
long startTime1 = System.currentTimeMillis();
 %>
<textarea readonly="readonly" style="width:400px;height:290px;"><%=kaydet1.compilefile("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse","code","input.txt")%></textarea>
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
<b>Selected input file: [<%=session.getAttribute("inputnamex") %>] </b><br>
<textarea  readonly="readonly" style="width:400px;height:290px;"><%=kaydet1.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\input.txt")%></textarea>   
   </td>
	 <td><b>Generated output file:</b><br>
	 <textarea name="outputfile" readonly="readonly" style="width:400px;height:290px;"><%=kaydet1.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\output.txt")%></textarea>   </td>
	  </table>
	  <table  style="width:100%" align="center"> 
	  <td> 

	  <br><b>Runtime of your code: (ms)</b><br>
	 <textarea style="width:100px;height:20px;"><%=estimatedTime2%></textarea>
	
	 <td> <br><input type="submit" value="Test Your Code"> </td>
	 </td>
	 
	 <td>
	  
	  </td>

	  <td>
	  </td>
	  </table> 
	 
	 </form>
   <%kaydet1.deletefiles();
   session.removeAttribute("kaydet1");
   

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
     <a href="student_hwinput.jsp?groupselected_i=${groupselected}">Go to Back Page </a></div>
</body>
</html>