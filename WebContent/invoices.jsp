<%@ page import ="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
    <table border="1">
<%
System.out.println("a");
 	 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
	    	 Statement st = con.createStatement();
	    	 ResultSet re = st.executeQuery("Select * from invoices");
	           out.println("<tr><th>EmId</th><th>user</th><th>Status</th><tr>");
	           while (re.next())
	           {
	               int n = re.getInt("id");
	               int s = re.getInt("user_id");
	               String nm = re.getString("Status");
	               out.println("<tr><td>" + n + "</td><td>" + s + "</td><td>" + nm + "</td></tr>");
	           }
	           con.close();
	           
	    	 re.next();
	    	 out.println(re.getInt(1)+" "+ re.getInt(2)+ " "+ re.getString(3)+" "+ re.getString(4)
	    	 +" "+re.getInt(5)+""+re.getInt(6));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 	 

%>
</table>
</body>
</html>