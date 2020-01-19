package apis;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.gson.Gson;

import models.RazorPayOrderModel;
import okhttp3.Credentials;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import repositories.PaymentRepository;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String keyId = "rzp_test_25DvslaTSjz9fD";
	private static final String secretKey = "cRLhxt1N6BGqfsdGylV3nPLf";

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
		Long amount = Long.parseLong(request.getParameter("amount"));
		System.out.println(amount);
		String currency="INR";
		String invoiceId="I10112";
		String paymentCapture = "1";
		
		String credential = Credentials.basic(keyId, secretKey);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("amount", amount);
	    jsonObject.put("currency", currency);
//	       jsonObject.put("invoiceId", invoiceId);
//	       jsonObject.put("paymentCapture", paymentCapture);
       MediaType JSON = MediaType.parse("application/json; charset=utf-8");
		
       RequestBody body = RequestBody.create(JSON, jsonObject.toString());
        
		Request requestObject = new Request.Builder()
		        .url("https://api.razorpay.com/v1/orders")
		        .addHeader("Authorization", credential)
		        .post(body)
		        .build();
        
        Response api_response = null;
        OkHttpClient httpClient = new OkHttpClient();
        String api_response_string = "";
        
        RazorPayOrderModel model=null;
        try {
        	api_response = httpClient.newCall(requestObject).execute();
        	if (!api_response.isSuccessful()) throw new IOException("Unexpected code " + response);
        	// Get response body
        	api_response_string = api_response.body().string();
            
            System.out.println(api_response_string);
            Gson g = new Gson();
            model = g.fromJson(api_response_string, RazorPayOrderModel.class);
            System.out.println(model.getCreated_at());
            
            PaymentRepository pr = new PaymentRepository();
            pr.saveRazorPayResponse();
        } catch (IOException e) {
            e.printStackTrace();
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
		response.getWriter().append(
				"{"+
					"\"message\": \"Success!!\""+","+
					"\"orderId\": \""+model.getId()+"\","+
					"\"amount\": "+model.getAmount()+","+
					"\"currency\": \""+model.getCurrency()+"\""+
				"}");
//		response.getWriter().append(model.getId());
	}

}
