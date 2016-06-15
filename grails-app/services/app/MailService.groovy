package app

import grails.transaction.Transactional

import java.util.Properties

import javax.mail.Message
import javax.mail.MessagingException
import javax.mail.PasswordAuthentication
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeMessage

@Transactional
class MailService {

    final String username = "skyfoxxgamer6@gmail.com";
    final String password = "compufox2016";

    def sendMail(Technical technical, Ticket ticket, String action) {
        Properties props = new Properties()
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
            message.setFrom(new InternetAddress(technical.email));
            message.addRecipients(Message.RecipientType.CC,
                      InternetAddress.parse(technical.email + "," + ticket.user.email));
            message.setSubject("Compufox: Ticket " + action);

            message.setContent('<u>The ticket was ' + action + '</u><br><u>Subject:</u> ' + ticket.subject + '<br><u>Description</u><br>' + ticket.description, "text/html; charset=utf-8");

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
