package apis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.Sha2Crypt;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Payment() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		System.out.println(password);

		response.getWriter().append("Served at:>> ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("asd");
		String amount = request.getParameter("amount");
		String currency="INR";
		String invoiceId="I101";
		int paymentCapture = 1;
		URL url = new URL("https://api.razorpay.com/v1/orders");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();  
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        String username="rzp_test_25DvslaTSjz9fD";
        String password="cRLhxt1N6BGqfsdGylV3nPLf";
        String authStr = Base64.getEncoder()
                .encodeToString((username+":"+password).getBytes());
    	//setting Authorization header
        conn.setRequestProperty("Authorization", "Basic " + authStr);
        
        if (conn.getResponseCode() != 200) {
            throw new RuntimeException("HTTP GET Request Failed with Error code : "
                          + conn.getResponseCode());
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
        String output = null;  
        StringBuilder strBuf = new StringBuilder();  
        while ((output = reader.readLine()) != null)  
            strBuf.append(output); 
        System.out.println(strBuf);
        
		response.getWriter().append("{\"message\": \"Success"+strBuf.toString()+"\"}");

		
	}

}
