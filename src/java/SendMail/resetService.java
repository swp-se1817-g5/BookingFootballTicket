/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SendMail;

import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author AD
 */
public class resetService {
    private final int LIMIT_MINUS = 5;
    static final String from = "quantahe170941@fpt.edu.vn";
    static final String password = "amke bnae ynsy knmg";
    
    public String generateToken() {
        return UUID.randomUUID().toString();
    }
    
    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }
    
    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }
    
    
    public boolean sendEmail(String to, String link, String name) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };
        
        Session session = Session.getInstance(props, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        try {
            msg.addHeader("Content-type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("BookingFootballTicket", "UTF-8");
            String content = "<h1>Xin chào "+ name +" , </h1>"+"<p>Vui lòng bấm vào đường link để đặt lại mật khẩu của bạn."
                    + "<a href="+link+">Ở đây</a></p>";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Gửi thành công!");
            return true;
        } catch (Exception e) {
            System.out.println("Lỗi!");
            System.out.println(e);
            return false;
        }
    }
//    public boolean sendEmailQr(String to, String qrCode, String name) {
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        
//        
//        Authenticator auth = new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(from, password);
//            }
//        };
//        
//        Session session = Session.getInstance(props, auth);
//        
//        MimeMessage msg = new MimeMessage(session);
//        
//        try {
//            msg.addHeader("Content-type", "text/html; charset=UTF-8");
//            msg.setFrom(from);
//            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
//            msg.setSubject("BookingFootballTicket", "UTF-8");
//            String content = "<h1>Xin chào " + name + ", </h1>" + "<p>" + qrCode + "</p>";
//            msg.setContent(content, "text/html; charset=UTF-8");
//            Transport.send(msg);
//            System.out.println("Gửi thành công!");
//            return true;
//        } catch (Exception e) {
//            System.out.println("Lỗi!");
//            System.out.println(e);
//            return false;
//        }
//    }
}
