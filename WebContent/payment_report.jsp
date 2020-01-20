<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page='header.jsp'/>
<h1 class="page-header">Payments Report</h1>

    <table border="1" style="margin: auto;" class="table">
<%
System.out.println("a");
 	 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
	    	 Statement st = con.createStatement();
	    	 ResultSet re = st.executeQuery("Select * from razorpay_responses");
	           out.println("<tr>"+
	    	 			"<th>S. No.</th>"+
	        		   "<th>order_id</th>"+
	        		   "<th>entity</th>"+
	        		   "<th>amount</th>"+
	        		   "<th>amount_paid</th>"+
	        		   "<th>currency</th>"+
	        		   "<th>receipt</th>"+
	        		   "<th>offer_id</th>"+
	        		   "<th>payment status</th>"+
	        		   "<th>attempts</th>"+
	        		   "<th>notes</th>"+
	        		   "<th>created_at</th>"+
	    	 			"<tr>");
	           while (re.next())
	           {
	               int id = re.getInt("id");
	               String razorpay_id = re.getString("razorpay_id");
	               String entity = re.getString("entity");
	               Long amount= re.getLong("amount");
	               Long amount_paid = re.getLong("amount_paid");
	               String currency = re.getString("currency");
	               if (currency == null){
	            	   currency="";
	               }
	               String receipt= re.getString("receipt");
	               if (receipt==null){
	            	   receipt="";
	               }
	               String offer_id= re.getString("offer_id");
	               if(offer_id==null){
	            	   offer_id="";
	               }
	               String status= re.getString("status");
	               if(status==null){
	            	   status="";
	               }
	               int attempts = re.getInt("attempts");
	               if(attempts==0){
	            	   attempts=0;
	               }
	               String notes= re.getString("notes");
	               if(notes==null){
	            	   notes="";
	               }
	               String created_at= re.getString("created_at");
	               if(created_at==null){
	            	   created_at="";
	               } else {
	            	   Timestamp ts=new Timestamp(Long.parseLong(created_at)*1000);
	            	   created_at=ts.toString();  
	                    
	               }
	               
	               out.println("<tr><td>" + id + "</td>"+
	               			"<td>" + razorpay_id + "</td>"+
	            		   	"<td>" + entity + "</td>"+
	               			"<td>" + amount + "</td>"+
	            		   	"<td>"+amount_paid+"</td>"+
	               			"<td>"+currency +"</td>"+
	            		   	"<td>"+receipt+"</td>"+
	            		   	"<td>"+offer_id+"</td>"+
	            		   	"<td>"+status+"</td>"+
	            		   	"<td>"+attempts+"</td>"+
	            		   	"<td>"+notes+"</td>"+
	            		   	"<td>"+created_at+"</td>"+
	               "</tr>");
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
</body>
</html>