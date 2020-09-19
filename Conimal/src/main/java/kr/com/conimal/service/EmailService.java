package kr.com.conimal.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.com.conimal.model.dto.EmailDto;

@Service
public class EmailService {

	@Autowired
	JavaMailSender mailSender;
	
	public int sendEmail(EmailDto email) throws Exception {
		try {
			// 이메일 객체
			MimeMessage message = mailSender.createMimeMessage();
			
			// 랜덤값 생성
			int num = 1;
			while(true) {
				num = ((int) (Math.random() * 1000000));
				if (num > 99999) break;
			}
			
			System.out.println("sendEmail - num:: " + num);
			
			
			// 발신자 설정 (수신자, 발신자의 이메일 주소 객체를 생성하여 수신자의 이메일 주소를 담는다.)
			//message.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiverMail()));
			
			/*
			 * createMimeMessage(): MimeMessage 객체를 생성시키고 이를 이용해서 메시지를 구성한 뒤 메일 발송
			 * addRecipent(): 메시지의 발신자를 설정
			 * InternetAddress(): 이메일 주소 
			 * getReceiveMail(): 수신자 이메일 주소 
			 * */
			
			
			//message.addFrom(new InternetAddress[] {new InternetAddress(email.getSenderName(), email.getSenderMail())});
			
			// 이메일 제목 (인코딩 필수)
			message.setSubject(email.getSubject(), "UTF-8");
			// 이메일 내용 (인코딩 필수) - 일반 텍스트 
			message.setText(email.getContent(), "UTF-8");
			// 이메일 내용 - HTML 컨텐츠 
			message.setContent("<h1>[Conimal] 회원가입을 위한 인증번호 : " + num + "</h1>", "text/html; charset=UTF-8");
			
			System.out.println("email.getReceiver():: " + email.getReceiver());
			
			// 보내는 사람 (이메일 주소 + 이름)
			// 발신자, 수신자의 이메일 주소와 이름을 담는다.
			
			// 이메일 발신자
			message.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver())); // 수신자 세팅 
			
			// 이메일 보내기
			mailSender.send(message);
			
			return num;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
