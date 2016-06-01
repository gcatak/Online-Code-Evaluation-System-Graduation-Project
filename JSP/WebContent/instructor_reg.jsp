<%@ page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OCES</title>
    </head>
    <body bgcolor="#E6E6FA">
        <form method="post" action="instructor_registration.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Your Information</th>
                    </tr>
                </thead>
                <tbody>
                 <tr>
                        <td>Instructor Username</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                 
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>Secret Question </td>
                        <td><input type="text" name="secretquestion" value="" /></td>
                    </tr>
                    <tr>
                        <td>Secret Answer </td>
                        <td><input type="text" name="secretanswer" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Register" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered? <a href="instructor_index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>