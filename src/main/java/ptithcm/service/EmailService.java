package ptithcm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String text) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);

            helper.setFrom("phambuinamphuong@gmail.com", "phambuinamphuong@gmail.com");
            helper.setTo(to);
            helper.setReplyTo("phambuinamphuong@gmail.com", "phambuinamphuong@gmail.com");
            helper.setSubject(subject);
            helper.setText(text);

            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in sending email: " + e.getMessage());
        }
    }
}
