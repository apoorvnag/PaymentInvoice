<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Adani Ports</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<font size=10>Welcome</font> 
<a href='logout.jsp'>Log out</a>
<a href='invoices.jsp'>Invoices</a>
<a href='amount.jsp'>Amount Pending</a>
<%
    }
%>
</body>
</html>