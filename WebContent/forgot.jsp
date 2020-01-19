<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
<jsp:include page='header.jsp'/>
<h1>Forgot Password</h1>
<form action="forgotpass.jsp" method="post"><br><br>

Enter E-mail: <input type="email" name="username"><br><br>
<input type="submit" />
</form>
</body>
</html>