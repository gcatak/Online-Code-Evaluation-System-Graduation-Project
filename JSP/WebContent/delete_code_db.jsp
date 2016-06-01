<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<html> 
    <head>
        <title>OCES</title>
    </head>
<body align = "center" bgcolor="#E6E6FA">


<%

	request.setCharacterEncoding("UTF-8");
    String deletedhwname =(String)session.getAttribute("hws");    
    String groupname = (String)session.getAttribute("groupselectedd");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
   // Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
     //       "root", "root2");
    //Statement st = con.createStatement();
 //   ResultSet rs;
    
    String sql = "DELETE FROM student_submission WHERE hwname= ? and groupname = ?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, deletedhwname);
    ps.setString(2, groupname);

    ps.executeUpdate();
    
    

    
    
    out.println(deletedhwname + groupname);
    
    
    response.sendRedirect("student_hwinput.jsp?groupselected_i=" + groupname );
    
    
    
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
%>
 </body>
</html>