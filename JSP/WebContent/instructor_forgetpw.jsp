<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OCES</title>
    </head>
    <body bgcolor="#E6E6FA">
        <form method="post" action="instructor_answer.jsp">
            <center>
            <br> <br>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Fill your information</th>
                    </tr>
                </thead>
                <tbody>
                 <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    
                    
                    <tr>
                        <td><input type="submit" value="Get Password" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="instructor_index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        
        
    </body>
    <script> 
    
 
    </script>
</html>