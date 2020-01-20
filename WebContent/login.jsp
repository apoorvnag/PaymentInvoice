<%@ page import ="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Adani Ports</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select username from users where username='" + username + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("invoices.jsp");
    } else {
    	rs = st.executeQuery("select username from admin where username='" + username + "' and password='" + password + "'");
    	if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("adminsuccess.jsp");
        } else {
    	out.println("Invalid password <a href='index.jsp'>try again</a>\n\n");
        out.println("<a href='forgot.jsp'>Forgot Password</a>");
        }
    }
%>
</body>
</html>