package mail_jdbc;

import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class maildata
 */
@WebServlet("/maildata")
public class maildata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/g","root","AmitKaushik$");
			Statement stmt=conn.createStatement();
			 String sql = "SELECT * from users";
			 
			 //please input the querrry;
			String due="Select duedate from invoices";
			 	      
			ResultSet rs = stmt.executeQuery(sql);
		     ResultSet r = stmt.executeQuery(due);
		      
		     int invoice_id ;
		        String email ;
		        Date due_date ;
		         
		      while(rs.next()){
		        
		         invoice_id  = rs.getInt("id");
		         email  =rs.getString("username");
		        due_date = rs.getDate("due_date");
		         
		      }
		      rs.close();
			
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		      Date cur_date= new java.util.Date();
//		        sdf.format(due_date);
//		        sdf.format(cur_date);
//		      if (cur_date.compareTo(due_date) > 0) {
//		            javamail.msend(email);
		        
//		        }
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
