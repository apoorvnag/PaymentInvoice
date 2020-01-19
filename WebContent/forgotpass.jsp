
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="mail_jdbc.javamail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>forgot password</title>
</head>
<body>
<jsp:include page='header.jsp'/>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apn","root","");
Statement st=con.createStatement();
String username=request.getParameter("username");
String strQuery = "SELECT password FROM users where username='"+username+"'";
ResultSet rs = st.executeQuery(strQuery);

if(rs.next()){
String Countrow = rs.getString(1);
System.out.println(Countrow);
/*if(Countrow.equals(1)){
	System.out.println(Countrow);*/
	
	String temp = Long.toHexString(Double.doubleToLongBits(Math.random()));
	mail_jdbc.javamail.msend(username,"forgot password","This is your new password is  "+temp);

/*
jm.msend(username,"forgot password","This is your new password");
mail code
paste your mail code here
------------------
Mail code*/
out.println("Password send to your email id successfully !");
} 
else{
out.println("Invalid Email Id !");
} 
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>