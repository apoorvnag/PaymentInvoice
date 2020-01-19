package mail_jdbc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class welcomemail
 */
@WebServlet("/welcomemail")
public class welcomemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String recipient = request.getParameter("username");
		 String sub="Welcome to our site!!";
		 String content="Your login to our site is succesfully done";
	       
		 javamail.msend(recipient, sub, content);
	}

}
