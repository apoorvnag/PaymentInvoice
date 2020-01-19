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
		
		Connection conn=null;
		Statement stmt;
		Statement stm,st;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apn","root","AmitKaushik$");
			stmt=conn.createStatement();
			
						
			String usersids="select id from users"; //taking ids of all users
			ResultSet rs0= stmt.executeQuery(usersids);//getting userids
			
			 Date cur_date= new java.util.Date();//current date
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 String a=sdf.format(cur_date);//formatting current date
			
			 
			 while(rs0.next()) {			//running loop for users
				
				int u= rs0.getInt("id"); 
				st=conn.createStatement();

				String vuser="select username from users where users.id='"+u+"'";
				ResultSet rs1=st.executeQuery(vuser);
				
				String user= rs1.getString(1); //plzz check this line
				
				System.out.println(user);
				String over="select due_date from invoices where invoices.user_id='"+u+"'"; //getting his all invoice duedate
				
				stm=conn.createStatement();
				ResultSet rs2_1 = stm.executeQuery(over); //selecting due date 
				
				while(rs2_1.next()) {
					
					Date d=rs2_1.getDate("due_date"); //selecting each due date at a time
					
					String b=sdf.format(d); //formatting date
				
					System.out.println(d);
				    if(b.compareTo(a)<0) { //comparing to current date
				    	
				    	String sub="your invoice over its due date";
				    	String cont=" you are requested to pay your invoice on time else interest will be charges accordingly.";
				    	javamail.msend(user,sub,cont);
				    	
				    							}		
									}
				rs2_1.close();
			    			}
			rs0.close();
		 	      
		}
		catch(SQLException se){
									//Handle errors for JDBC
		      se.printStackTrace();
		   }
		catch (Exception e)
		{
		e.printStackTrace();

		}
		finally{
		 
		      try{
		         if(conn!=null)
		            conn.close();
		         }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }
	}

}
