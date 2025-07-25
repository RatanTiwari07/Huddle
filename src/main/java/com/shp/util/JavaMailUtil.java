package com.shp.util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {

	protected static void sendMail(String recipient, String subject, String htmlTextMessage) throws MessagingException {

//		(recipientEmail, subject, htmlTextMessage)

		System.out.println("Preparing to send Mail");

		Properties properties = new Properties();
		String host = "smtp.gmail.com";
		properties.put("mail.smtp.host", host);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.port", "587");

		String password = System.getenv("APP_PASSWORD_1");
		if (password == null) {
			System.err.println("MY_API_KEY environment variable not set!");
			return;
		}

		String emailId = System.getenv("MY_EMAIL_ID");
		if (emailId == null) {
			System.err.println("MY_API_KEY environment variable not set!");
			return;
		}

//		https://myaccount.google.com/apppasswords  FOR CREATING NEW PASSOWORDS

		System.out.println("authentication");

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailId, password);
			}

		});

		Message message = prepareMessage(session, emailId, recipient, subject, htmlTextMessage);

		System.out.println(emailId + " recipient : " + recipient + " subject : " + subject + " text : " + htmlTextMessage);

		System.out.println("Message creation Successfully!");

		Transport.send(message);

		System.out.println("Message Sent Successfully!");

	}

	private static Message prepareMessage(Session session, String myAccountEmail, String recipientEmail, String subject,
			String htmlTextMessage) {

		try {

			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress(myAccountEmail));
			message.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recipientEmail));
			message.setSubject(subject);
			message.setContent(htmlTextMessage, "text/html");
			return message;

		} catch (Exception exception) {
			Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, exception);
		}
		return null;

	}
}