<%@ page import ="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amount | Adani Ports</title>
</head>
<body>
<jsp:include page='header.jsp'/>
<div class="container">
	<h1 class="page-header">Invoices</h1>
    <table border="1" style="margin: 0 auto;" class="table table-striped">
<%
System.out.println("a");
 	 try {
 		    String pen = "pending";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
	    	 Statement st = con.createStatement();
	    	 ResultSet re = st.executeQuery("Select * from invoices where status='"+pen+"'");
	           out.println("<tr><th>Id</th><th>Transaction ID</th><th>Order ID</th><th>Pending Amount</th><th>Status</th><th>Invoice ID</th><th>Mode</th><tr>");
	           while (re.next())
	           {
	               int n = re.getInt("id");
	               String nm = re.getString("order_id");
	               int d= re.getInt("amount");
	               String e = re.getString("status");
	               int f = re.getInt("invoice_id");
	               String a= re.getString("amount");
	               out.println("<tr><td>" + n + "</td><td>"  + nm + "</td><td>"
	               + d + "</td><td>"+e+"</td><td"+f +"</td><td>"+a+"</td></tr>");
	           }
	           con.close();
	           
	    	 re.next();
	    	 out.println(re.getInt(1)+" "+ re.getInt(2)+ " "+ re.getString(3)+" "+ re.getString(4)
	    	 +" "+re.getInt(5)+""+re.getInt(6)+""+ re.getInt(7));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 	 

%>
</table>
</div>
</body>
</html>