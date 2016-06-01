<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.Date" %>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">


<%

	request.setCharacterEncoding("UTF-8");
    String hwname =(String)session.getAttribute("hws");    
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");

    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select duedate from hw where name='" + hwname + "'");
    
    Date date = new Date();
    String datestring = "";
	  while(rs.next()){ 
			
		date = rs.getDate(1);
	datestring = rs.getDate(1).toString();
}
	  
	  
	  Date currentdate = new Date();
	  
	  int temp;
	  
	  temp =  date.compareTo(currentdate);

	  String str = Integer.toString(temp);
	  
			
	//  System.out.println(date);
	  
	  if(temp == 1)
    response.sendRedirect("student_savecode.jsp");
    
    
    
    /*
    int k = st.executeUpdate("delete from course where name='" + deletedcourse + "' and pass='" + deletedpass + "'");
    if (k>0) {
       // session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
       response.sendRedirect("instructor_success.jsp");
      //  out.println("Are you sure to delete this course? <br><br><br> <a href='instructor_success.jsp'>YES</a> <br><br><br><a href='instructor_success.jsp'>Go Back.</a>");
    } else {
        out.println("Invalid password <a href='instructor_success.jsp'>Please, try again</a>");
    }
    */
%><br><br>
Due date of <%=hwname %> is: 
<%= datestring %><br><br>


<br>
Due date time is expired. You can not save your code.<br> <br>

<a href="studentcoursepage.jsp?value1=${ics2}">Go to Back Page </a></div>

 </body>
</html>