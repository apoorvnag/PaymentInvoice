package com.joo;

import java.awt.print.PrinterJob;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.event.PrintJobAdapter;
import javax.print.event.PrintJobEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class displayinginvoices
 */
@WebServlet("/diaplayinginvoices")
public class diaplayinginvoices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public diaplayinginvoices() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		}

			      
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
			         
	import java.sql.*;
	import java.io.IOException;
	import java.io.PrintWriter;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	/**
	 * Servlet implementation class AdminDashboard
	 */
	@WebServlet("/AdminDashboard")
	public class invoices extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public AdminDashboard() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	    {
	       PrintWriter out = res.getWriter();
	       res.setContentType("text/html");
	       out.println("<html><body>");
	       try
	       {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
				Statement stmt=conn.createStatement();
	           ResultSet rs = stmt.executeQuery("select * from invoices");
	           out.println("<table border=1 width=50% height=50%>");
	           out.println("<tr><th>EmId</th><th>user</th><th>Status</th><tr>");
	           while (rs.next())
	           {
	               int n = rs.getInt("id");
	               int s = rs.getInt("user_id");
	               String nm = rs.getString("Status");
	               out.println("<tr><td>" + n + "</td><td>" + s + "</td><td>" + nm + "</td></tr>");
	           }
	           out.println("</table>");
	           out.println("</html></body>");
	           conn.close();
	          }
	       catch(Exception e) {
	    	   e.printStackTrace();
	       }
	}
			      

				



			       
					
				}
			  }
}