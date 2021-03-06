package mx.edu.ilce.intranet.mail;

import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Clase encargada de envío de correos electrónicos automatizados
 */

public class Mail {
    String error;

    /**
     * Recupera error relacionado al envío de correos
     * @return mensaje de error
     */
    public String getError() {
        return error;
    }
    
    /**
     * Envía correo electrónico de la plataforma
     * @param from          Sirve como referencia solamente puesto que solo se envía desde siap@ilce.edu.mx
     * @param to            Correo del destinatario
     * @param subject       Asunto
     * @param bodyText      Mensaje
     * @param filename      Archivo adjunto
     * @throws Exception    si ocurre un error relacioando con el envío de correo
     */
    public void sendEmail(String from, String to, String subject, String bodyText, String filename) throws Exception{
       Properties properties = new Properties();
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.user", "intranet@ilce.edu.mx");
        properties.put("mail.smtp.auth", "true");
        properties.put("pass", "intranet2013_");        
        properties.put("separador", ";");
        
        Session session = Session.getDefaultInstance(properties, null);
        Transport t = session.getTransport("smtp");
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setSentDate(new Date());
            
            //
            // Set the email message text.
            //
            /*MimeBodyPart messagePart = new MimeBodyPart();
            messagePart.setText(bodyText); */
            
            //
            // Set the email attachment file
            //
            /*MimeBodyPart attachmentPart = new MimeBodyPart();
            FileDataSource fileDataSource = new FileDataSource(filename) {
                @Override
                public String getContentType() {
                    return "application/octet-stream";
                }
            };
            attachmentPart.setDataHandler(new DataHandler(fileDataSource));
            attachmentPart.setFileName(filename); */
            
            /*Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messagePart);*/
            //multipart.addBodyPart(attachmentPart);
            //msg.setContent(message, "text/html; charset=utf-8");
            message.setContent(bodyText, "text/html; charset=utf-8");
            if (properties.getProperty("mail.smtp.auth").equals("true"))
                t.connect(properties.getProperty("mail.smtp.user"),properties.getProperty("pass"));
           
            t.sendMessage(message, message.getAllRecipients()); 
            
            //Transport.send(message);
        } catch (MessagingException e) {
             throw new Exception (e.getMessage()); 
            //e.printStackTrace();
        } finally {
            t.close();
        }
    }
}