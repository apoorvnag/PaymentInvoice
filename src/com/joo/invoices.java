package com.joo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class invoices extends HttpServlet

{	private static final long serialVersionUID = 1L;
/**
 * @see HttpServlet#HttpServlet()
 */
public invoices() {
    super();
}
public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
{
   PrintWriter out = res.getWriter();
   res.setContentType("text/html");
   out.println("<html><body>");
    	 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
	    	 Statement st = con.createStatement();
	    	 ResultSet re = st.executeQuery("Select * from invoice");
	    	 out.println("<table border=1 width=50% height=50%>");
	           out.println("<tr><th>EmId</th><th>user</th><th>Status</th><tr>");
	           while (re.next())
	           {
	               int n = re.getInt("id");
	               int s = re.getInt("user_id");
	               String nm = re.getString("Status");
	               out.println("<tr><td>" + n + "</td><td>" + s + "</td><td>" + nm + "</td></tr>");
	           }
	           out.println("</table>");
	           out.println("</html></body>");
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
    	 
     } 
}
