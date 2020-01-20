<%@ page import ="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout | Adani Ports</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>