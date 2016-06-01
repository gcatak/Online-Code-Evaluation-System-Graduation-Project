<%@ page errorPage="error.jsp" %>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/loginuser"
        user="root" password="root2"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT name FROM course_student where id = ?;
        <sql:param value="${userid}" />
    </sql:query>
    
    
     
    <div align="center">
        <table width= "23%" border="1" cellpadding="5">
           
            <tr>
                <th>Your courses</th>
              
            </tr>
            <c:forEach var="x" items="${listUsers.rows}">
                <tr>
                    <td><a href=student_course.jsp> <c:out value="${x.name}" /></a></td>
                    <c:set var="test" value="${x.name}"
    				scope="session" />
					<c:out value="${sessionScope.test}" />
            
                </tr>
            </c:forEach>
        </table>
    </div>
