<%-- 
    Document   : Logout
    Created on : 14 Nov, 2024, 9:08:14 PM
    Author     : mitesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("Login.html");
        %>
    </body>
</html>
