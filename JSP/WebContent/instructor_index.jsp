<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OCES</title>
    </head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example</title>
    </head>
    <body bgcolor="#E6E6FA">
        <form method="post" action="instructor_login.jsp">
            <center>
            <br><br><br>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">LOGIN(Instructor Page)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Instructor username</td>
                        <td><input type="text" name="instructorusername" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="instructorpass" value="" /></td>
                    </tr>
                    <tr>
                       <th colspan="2"> <input type="submit" value="LOGIN" /></th>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"><a href="instructor_reg.jsp">Register Here.</a></td>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"> <a href="instructor_forgetpw.jsp">I forget the password.</a></td>
                    </tr>
                    <tr>
                        <td align = "center" colspan="2"> <a href="about_i.jsp">About OCES</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        
        <br><br>
    <div id="footer" align="center">
    <br> Graduation Project - 2016 <br> by
 Gürkan Çatak & Muhammet Altıntaş, Asst. Prof Ömer Korçak<br>
    
       &copy; All rights reserved

</div>
    
    </body>
</html>