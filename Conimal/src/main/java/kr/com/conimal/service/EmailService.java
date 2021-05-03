package kr.com.conimal.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.MypageDao;
import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.dto.UserDto;

@Service("EmailService")
public class EmailService {

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	UserDao user;
	
	@Autowired
	MypageDao mypage;
	
	// 이메일 난수 만들기
	private String init() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
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
	public void sendEmail(String email, Long user_id) throws Exception {
		
		String key = getKey(false, 8);
		
		// 회원의 닉네임 가져오기
		UserDto dto = user.findByUserId(user_id);
		String nickname = dto.getNickname();
	
		// 이메일 객체
		MimeMessage message = mailSender.createMimeMessage();
		
		// 이메일 내용 
		String content = "<div style=\"background-color: #536dfe; border:3px solid #231815; box-sizing:border-box; padding:15px 0;text-align: center;\" >" +
						"<div style='padding:70px 20px; font: 700 16pt sans-serif; line-height: 140%;'>" +
						"안녕하세요 " + nickname + " 님!<br>" + "아래의 버튼을 누르시면 인증이 완료됩니다.</div>" +
						"<div style=\'background-color: #8c9eff; width: 50px; border: 3px solid #231815; margin:0 auto; margin-bottom: 30px; padding:10px 100px; font: 700 10pt sans-serif;\'>" + 
						"<a href='http://localhost:8080/updUserKey?user_id=" + user_id + "&user_key=" + key + "'>로그인</a></div></div>";

		try {
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_key", key);
		user.getUserKey(user_id, key);
	}
	
	// 인증 확인 
	public int updUserKey(Long user_id) throws Exception {
		int result = user.updUserKey(user_id);
		return result;
	}
	
	// 비밀번호 찾기 이메일 발송 
	public void sendPwd(Long user_id, String email) throws Exception {
		
		// 비밀번호는 8자리로 보내고 DB에 저장된 비밀번호를 변경
		String key = getKey(false, 8);
		
		// 회원의 닉네임 가져오기
		UserDto dto = user.findByUserId(user_id);
		String nickname = dto.getNickname();
		
		MimeMessage message = mailSender.createMimeMessage();
		String content = "<h1>안녕하세요 코니멀입니다!</h1><br><br>" +
				"<h2>" + nickname + "님</h2>" + "<h3>임시 비밀번호를 발급해드렸습니다." +
				"임시로 발급해드린 비밀번호는 </h3><h3 style='color: blue;'>" + key + "</h3><h3>입니다.</h3>" +
				"<h3>로그인 후 마이페이지에서 비밀번호를 변경해주세요.</h3>" +
				"<a href='http://localhost:8080/join/login'>코니멀 바로가기</a></h3>" +
				"<h3>감사합니다!</h3>";
		try {
			// 이메일 제목 (인코딩 필수)
			message.setSubject("[Conimal] 코니멀 :: 임시 비밀번호가 발급되었습니다.", "UTF-8");
						
			// 이메일 내용 (인코딩 필수) - HTML 컨텐츠 
			message.setText(content, "UTF-8", "html");
						
			// 이메일 발신자
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
						
			// 이메일 보내기
			mailSender.send(message);	
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", dto.getId());
		map.put("password", key);
		map.put("email", email);
		user.findPassword(dto.getId(), email, key);
	}
	
	// 이메일 변경용 인증
	public void updateEmail(String email, Long user_id) {

		String key = getKey(false, 20);
		
		// 이메일 객체
		MimeMessage message = mailSender.createMimeMessage();
		
		// 이메일 내용 
		String content = "<h1>안녕하세요 코니멀입니다!</h1><br><br>" +
				"<h2>이메일 변경을 위한 인증을 위한 메일입니다.</h2>" + "<h3>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " +
				"<a href='http://localhost:8080/updateUserKey?user_id=" + user_id + "&email=" + email + "'>인증하기</a></h3>" +
				"<h3>감사합니다!</h3>";
		
		try {
			// 이메일 제목 (인코딩 필수)
			message.setSubject("[Conimal] 코니멀 :: 이메일 변경을 위한 인증 메일입니다..", "UTF-8");
						
			// 이메일 내용 (인코딩 필수) - HTML 컨텐츠 
			message.setText(content, "UTF-8", "html");
						
			// 이메일 발신자
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
						
			// 이메일 보내기
			mailSender.send(message);	
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("user_id", user_id);
		mypage.getUserKey(user_id, key);
	}
	
	// 변경 이메일 인증 확인 
	public int updateUserKey(Long user_id, String email, UserDto user) {
		int result = mypage.updUserKey(user_id);
		user.setUpdate_date(LocalDate.now());
		result = mypage.updateEmail(user);
		return result;
	}
	
}
