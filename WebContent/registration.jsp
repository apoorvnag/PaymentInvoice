<%@ page import ="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
<%
    String id = "1";
	
    String username = request.getParameter("username"); 
	
    String handle = "username"+"xyz";
    
    String verification_key = "username"+"A1";
    
    String password = request.getParameter("password");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apn","root","");
    PreparedStatement st = con.prepareStatement("insert into users (id, username, password, verification_key, handle, contact, address)" + "values ('" + id + "','" + username + "','" + password + "','" + verification_key + "','" + handle + "','" + contact + "','" + address + "')");
    //ResultSet rs;
    int i = st.executeUpdate();
    if (i > 0) {
        
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>