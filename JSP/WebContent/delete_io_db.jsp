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
    String deletedcourse =(String)session.getAttribute("deletedcourse");    
    String deletedpass = (String)session.getAttribute("deletedpass");
    String deletedio = (String)session.getAttribute("deletedio");
    String deletedhwio = (String)session.getAttribute("hwss");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser?useUnicode=true&characterEncoding=UTF-8",
            "root", "root2");
   // Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginuser",
     //       "root", "root2");
    //Statement st = con.createStatement();
 //   ResultSet rs;
    
    String sql = "DELETE FROM ins_input WHERE hw= ? and name = ?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, deletedhwio);
    ps.setString(2, deletedio);

    ps.executeUpdate();
    
    

    
    
    out.println(deletedhwio + deletedio);
    
    
    response.sendRedirect("input_output.jsp");
    
    
    
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