<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>OCES</title>
    </head>
    <body bgcolor="#E6E6FA">

        <form method="post" action="login.jsp">
            <center>
            <br><br><br>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">LOGIN</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Student ID</td>
                        <td><input type="text" name="id" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                       <th colspan="2"> <input type="submit" value="LOGIN" /></th>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"><a href="reg.jsp">Register Here.</a></td>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"> <a href="student_forgetpw.jsp">I forget the password.</a></td>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"> <a href="about.jsp">About OCES</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
    <br>
    <br>

    
    <div id="footer" align="center">
    <br> Graduation Project - 2016 <br> by
 Gürkan Çatak & Muhammet Altıntaş, Asst. Prof Ömer Korçak<br>
    
       &copy; All rights reserved

</div>
    
</html>