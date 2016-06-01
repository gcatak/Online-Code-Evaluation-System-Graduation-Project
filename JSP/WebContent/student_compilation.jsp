<%@ page import="java.io.*" %>
<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCES</title>
</head>
<body bgcolor="#E6E6FA">

<jsp:useBean id="kaydet1" scope="session" class="bean.comprun"/>
<jsp:setProperty property="*" name="kaydet1"/>
   <%
   synchronized(this){
   kaydet1.DosyayaYaz(kaydet1.getInputfile(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\input.txt");
   kaydet1.DosyayaYaz(kaydet1.getCode(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\code.java");
   %>
 	

<b>Your console(cmd) output:</b><br>

<%
long startTime = System.nanoTime();  
long startTime1 = System.currentTimeMillis();
 %>
<textarea style="width:700px;height:290px;"><%=kaydet1.compilefile("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse","code","input.txt")%></textarea>
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


<br><b>Your file output:</b><br>
<textarea style="width:700px;height:290px;"><%=kaydet1.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\output.txt")%></textarea>   
   
	 <br><b>Runtime of your code: (ms)</b><br>
	 <textarea style="width:100px;height:20px;"><%=estimatedTime2%></textarea>   
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
   
</body>
</html>