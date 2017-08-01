/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/**
 *
 * @author Administrator
 */
import java.security.SecureRandom;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
  public static int sendEmail(String email)throws Exception{
  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
  // Get a Properties object
     Properties props = System.getProperties();
     props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");
     final String username = "garvitpatel196@gmail.com";//
     final String password = "garvitpatelsb";
     Session session = Session.getInstance(props, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, password);
    }
});

   // -- Create a new message --
     Message msg = new MimeMessage(session);

  // -- Set the FROM and TO fields --
      //System.out.println("HIIIIIIIIIIII  adityanptel@gmail.com ");
     msg.setFrom(new InternetAddress("garvitpatel196@gmail.com"));
    msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
     /*InternetAddress I[]=InternetAddress.parse("adityanptel@gmail.com");
     for(InternetAddress i :I)
     {
         System.out.println("HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"+i+"EXIT"); 
     }*/
     msg.setSubject("Charusat Cloud Verification");
     Random rnd = new Random();
     int n = 100000 + rnd.nextInt(900000);
     msg.setText("Your Verification Number:"+n);
    // msg.setSentDate(new Date());
     Transport.send(msg);
     System.out.println("Message sent.");
     return n;
  }
}