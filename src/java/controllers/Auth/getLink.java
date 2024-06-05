package controllers.Auth;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class getLink {

    public boolean sendEmailResetPass(String emailReset) {
        boolean isSent = false;

        final String username = "quantahe170941@fpt.edu.vn";
        final String password = "amke bnae ynsy knmg";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailReset));
            message.setSubject("Reset Your Password");
            // Nội dung email dưới dạng HTML
            String htmlContent = "<p>Reset Your Password "
                + "<a href='http://localhost:8080/BookingFootballTicket/changePassForget'>Here</a></p>";
            
            message.setContent(htmlContent, "text/html");
            Transport.send(message);
            isSent = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return isSent;
    }

}
