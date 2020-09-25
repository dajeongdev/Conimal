package kr.com.conimal.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.dto.EmailDto;

@Service
public class EmailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	UserDao dao;
	
	// 이메일 난수 만들기
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) +48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while(sb.length() < size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일 (인증키 발송)
	public void sendEmail(String email, String user_id, HttpServletRequest request) throws Exception {
		
		String key = getKey(false, 20);
		
		dao.getUserKey(user_id, key);
		
		// 이메일 객체
		MimeMessage message = mailSender.createMimeMessage();
		
		// 이메일 내용 
		String content = "<h1>안녕하세요 코니멀입니다!</h1><br><br>" +
						"<h2>" + user_id + "님</h2>" + "<h3>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " +
						"<a href='http://localhost:8080" + request.getContextPath() + "/join-form/updUserKey?user_id=" + user_id + "&user_key=" + key + "'>인증하기</a></h3>" +
						"<h3>감사합니다!</h3>";
		
		try {

			/*
			 * createMimeMessage(): MimeMessage 객체를 생성시키고 이를 이용해서 메시지를 구성한 뒤 메일 발송
			 * addRecipent(): 메시지의 발신자를 설정
			 * InternetAddress(): 이메일 주소 
			 * getReceiveMail(): 수신자 이메일 주소 
			 * */
			
			// 이메일 제목 (인코딩 필수)
			message.setSubject("[Conimal] 코니멀 :: 본인인증을 위한 인증 메일입니다.", "UTF-8");
			
			// 이메일 내용 (인코딩 필수) - HTML 컨텐츠 
			message.setText(content, "UTF-8", "html");
			
			// 이메일 발신자
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
			
			// 이메일 보내기
			mailSender.send(message);		
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	// 인증 확인 
	public int updUserKey(String user_id, String user_key) throws Exception {
		int result =  dao.updUserKey(user_id, user_key);
		return result;
	}
	
}
