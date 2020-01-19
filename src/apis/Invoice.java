package apis;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.razorpay.RazorpayClient;

/**
 * Servlet implementation class Invoice
 */
@WebServlet("/Invoice")
public class Invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Invoice() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("javax.servlet.http.HttpServlet");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/apn","tripoto_admin","tripoto123");
			System.out.println("---------");
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("SELECT * FROM invoices LIMIT 10, 5");
			System.out.println("123123");
			while(rs.next())  
			{
				System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
			}
				  
			con.close();  
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().append("Served: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("asd");
		doGet(request, response);
	}

}
