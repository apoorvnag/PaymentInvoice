package mail_jdbc;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class javamail {

    	 
public static void msend(String to,String subject,String msg){  
        final String username = "adaniportsez@gmail.com";//input your email address
        final String password = "AmitkaushiK$";//input your password

        Properties prop = new Properties();
	prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //tls
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(to)
            );
            message.setSubject(subject);
            
            message.setText(msg);
          
            Transport.send(message);

            System.out.println("Done");

        	} 
        catch (MessagingException e) {
            e.printStackTrace();
        							}
    	 	}
    }



