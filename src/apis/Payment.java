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
		String invoiceId="I1011";
		String paymentCapture = "1";
		
		String credential = Credentials.basic("rzp_test_25DvslaTSjz9fD", "cRLhxt1N6BGqfsdGylV3nPLf");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("amount", amount);
	       jsonObject.put("currency", currency);
	       jsonObject.put("invoiceId", invoiceId);
	       jsonObject.put("paymentCapture", paymentCapture);
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
        try {
        	api_response = httpClient.newCall(requestObject).execute();
            String resStr = api_response.body().string();
            System.out.println(resStr);
            if (!api_response.isSuccessful()) throw new IOException("Unexpected code " + response);

            // Get response body
            System.out.println(api_response.body().string());
            api_response_string = api_response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        

		
//		URL url = new URL("https://api.razorpay.com/v1/orders");
//		HttpURLConnection conn = (HttpURLConnection)url.openConnection();  
//        conn.setRequestMethod("POST");
//        
//        conn.setRequestProperty("Accept", "application/json");
//        String username="rzp_test_25DvslaTSjz9fD";
//        String password="cRLhxt1N6BGqfsdGylV3nPLf";
//        String authStr = Base64.getEncoder()
//                .encodeToString((username+":"+password).getBytes());
        
    	//setting Authorization header
//        conn.setRequestProperty("Authorization", "Basic " + authStr);
//        int responseCode = conn.getResponseCode();
//        if (responseCode != 200) {
//            throw new RuntimeException("Request Failed with Error code : "
//                          + responseCode);
//        }
//        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
//        String output = null;  
//        StringBuilder strBuf = new StringBuilder();  
//        while ((output = reader.readLine()) != null)  
//            strBuf.append(output); 
//        
        
        
        System.out.println(api_response_string);
        Gson g = new Gson();
        RazorPayOrderModel model = g.fromJson(api_response_string.toString(), RazorPayOrderModel.class);
        System.out.println(model.getCreated_at());
        
        PaymentRepository pr = new PaymentRepository();
        pr.saveRazorPayResponse();
        
		response.getWriter().append("{\"message\": \"Success"+api_response_string.toString()+"\"}");

		
	}

}
