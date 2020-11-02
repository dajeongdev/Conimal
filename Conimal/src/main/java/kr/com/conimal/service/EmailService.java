package kr.com.conimal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

@Service
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
	public void sendEmail(String email, String user_id, HttpServletRequest request) throws Exception {
		
		String key = getKey(false, 20);
		
		// 회원의 닉네임 가져오기
		UserDto dto = user.getUserInfo(user_id);
		String nickname = dto.getNickname();
	
		// 이메일 객체
		MimeMessage message = mailSender.createMimeMessage();
		
		// 이메일 내용 
		String content = "<div style=\"background-color: #00AD84; border:4px solid #231815; text-align: center;\" >" +
						"<div><img src='https://www.notion.so/sohyeondada/HTML-e8fbccb4161f4f26807fbb6672d5c4d3#64dca44195aa4e12a359483a2c76fe59' alt='운동친구 로고' style='margin:60px 0 50px 0;' width='140px'></div>" + 
						"<div style='font: 700 16pt sans-serif; line-height: 140%;'>" +
						"안녕하세요 " + nickname + " 님!<br>" + "아래의 버튼을 누르시면 인증이 완료됩니다.</div>" +
						"<input type='submit' onclick='http://localhost:8080" + request.getContextPath() + "/updUserKey?user_id=" + nickname + "&user_key=" + key + "'" +
						" value='인증하기' style='background-color: white; border: 4px solid #231815; margin:50px 0 60px 0; padding:10px 100px; font: 700 10pt 'Black Han Sans', sans-serif;'" +
						" width='340px' height=40px'></div>";

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
	public int updUserKey(String user_id) throws Exception {
		int result = user.updUserKey(user_id);
		return result;
	}
	
	// 비밀번호 찾기 이메일 발송 
	public void sendPwd(String user_id, String email, HttpServletRequest request) throws Exception {
		
		// 비밀번호는 8자리로 보내고 DB에 저장된 비밀번호를 변경
		String key = getKey(false, 8);
		
		// 회원의 닉네임 가져오기
		UserDto dto = user.getUserInfo(user_id);
		String nickname = dto.getNickname();
		
		MimeMessage message = mailSender.createMimeMessage();
		String content = "<h1>안녕하세요 코니멀입니다!</h1><br><br>" +
				"<h2>" + nickname + "님</h2>" + "<h3>임시 비밀번호를 발급해드렸습니다." +
				"임시로 발급해드린 비밀번호는 </h3><h3 style='color: blue;'>" + key + "</h3><h3>입니다.</h3>" +
				"<h3>로그인 후 마이페이지에서 비밀번호를 변경해주세요.</h3>" +
				"<a href='http://localhost:8080" + request.getContextPath() + "/join/login'>코니멀 바로가기</a></h3>" +
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
		
		//key = PwdEncService.encrypt(key);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("password", key);
		map.put("email", email);
		user.findPassword(user_id, email, key);
	}
	
	// 이메일 변경용 인증
	public void updateEmail(String email, String user_id, HttpServletRequest request) {

		String key = getKey(false, 20);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("user_id",user_id);
		mypage.getUserKey(user_id, key);
		
		// 이메일 객체
		MimeMessage message = mailSender.createMimeMessage();
		
		// 이메일 내용 
		String content = "<h1>안녕하세요 코니멀입니다!</h1><br><br>" +
				"<h2>이메일 변경을 위한 인증을 위한 메일입니다.</h2>" + "<h3>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " +
				"<a href='http://localhost:8080" + request.getContextPath() + "/updateUserKey?user_id=" + user_id + "&email=" + email + "'>인증하기</a></h3>" +
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
	}
	
	// 변경 이메일 인증 확인 
	public int updateUserKey(String user_id, String email, UserDto user) {
		int result = mypage.updUserKey(user_id);
		user.setUpdate_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm")));
		result = mypage.updateEmail(user);
		return result;
	}
	
}
