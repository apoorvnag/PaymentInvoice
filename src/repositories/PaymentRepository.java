package repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import models.RazorPayOrderModel;

public class PaymentRepository {
	public void saveRazorPayResponse(RazorPayOrderModel model) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/g","tripoto_admin","tripoto123");
			System.out.println("---------");
			
			
			String razorpayId = model.getId();
			String entity = model.getEntity();
			Long amount = model.getAmount();
			Long amountPaid = model.getAmount_paid();
			Long amountDue = model.getAmount_due();
			String currency = model.getCurrency();
			String receipt=model.getReceipt();
			String offer_id = model.getOffer_id();
			String status=model.getStatus();
			int attemps = model.getAttempts();
			String created_at= model.getCreated_at();
			
			
			String query="INSERT INTO razorpay_responses (razorpay_id, entity, amount, amount_paid, currency, receipt, offer_id, status, attempts, created_at) VALUES (?,?,?,?,?,?,?,?,?, ?)";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, razorpayId);
            preparedStatement.setString(2, entity);
            preparedStatement.setLong(3, amount);
            preparedStatement.setLong(4, amountPaid);
            preparedStatement.setString(5, currency);
            preparedStatement.setString(6, receipt);
            preparedStatement.setString(7, offer_id);
            preparedStatement.setString(8, status);
            preparedStatement.setInt(9, attemps);
            preparedStatement.setString(10, created_at);
            int row = preparedStatement.executeUpdate();
				  
			conn.close();  
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void savePayment(RazorPayOrderModel model) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/g","tripoto_admin","tripoto123");
			System.out.println("---------");
			
			Random rand = new Random(); 
			  
	        // Generate random integers in range 0 to 999 
	        int rand_int1 = rand.nextInt(1000); 
			String razorpayId = model.getId();
			String entity = model.getEntity();
			Long amount = model.getAmount();
			Long amountPaid = model.getAmount_paid();
			Long amountDue = model.getAmount_due();
			String currency = model.getCurrency();
			String receipt=model.getReceipt();
			String offer_id = model.getOffer_id();
			String status=model.getStatus();
			int attemps = model.getAttempts();
			String created_at= model.getCreated_at();
			
			
			String query="INSERT INTO payments (txn_id, order_id, amount, status, invoice_id, mode) VALUES (?,?,?,?,?,'online')";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setLong(1, rand_int1);
            preparedStatement.setString(2, razorpayId);
            preparedStatement.setLong(3, amount);
            preparedStatement.setString(4, status);
            preparedStatement.setLong(5, rand_int1);
            int row = preparedStatement.executeUpdate();
				  
			conn.close();  
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
