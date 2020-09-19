package kr.com.conimal.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.EmailDto;
import kr.com.conimal.model.dto.UserDto;
import kr.com.conimal.service.EmailService;
import kr.com.conimal.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService us;
	
	@Autowired
	UserDao ud;
	
	@Autowired
	EmailService emailService;
	
	// 메인 페이지
	@RequestMapping(value = "/main")
	public ModelAndView selectAll() {
		ModelAndView mav = new ModelAndView();
		List<UserDto> users = ud.selectAll();
		mav.setViewName("main");
		mav.addObject("users", users);
		return mav;
	}
	
	// 회원가입 입력 페이지로 이동 
	@RequestMapping(value = "/join/join-form")
	public String joinForm() {
		return "/join/join-form";
	}
	
	// 회원가입
	@RequestMapping(value = "/join-form/insert", method = RequestMethod.POST)
	public String join(UserDto userDto, HttpSession session) throws Exception {
		System.out.println("join-form.jsp 진입");
		int i = us.join(userDto);
		if(i == 1) { // 정보 불일치 시 가입 진행
			session.setAttribute("success", userDto.getUser_idx());
			System.out.println("join :: " + i);
			session.setAttribute("sc", i);
			return "redirect:join/login";
		} else {
			return "redirect:join/join-form";
		}
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/login/checkId", method = RequestMethod.POST)
	@ResponseBody
	public int checkId(LoginCommand lc) throws Exception {
		int i = us.checkId(lc);
		return i;
	}
	
	// 이메일 중복 체크 
	@RequestMapping(value = "/login/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public int checkEmail(LoginCommand lc) throws Exception {
		int i = us.checkEmail(lc);
		return i;
	}
	
	// 메일 보내기 
	@RequestMapping(value = "/join/sendCode", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String mailSending(String email) throws Exception {
		EmailDto edto = new EmailDto();
		
		String receiver = email; // 받는 사람 
		String subject = "[Conimal] 회원가입 인증 이메일입니다."; // 제목 
		String content = "";
		
		edto.setReceiverMail(receiver);
		edto.setSubject(subject);
		edto.setContent(content);
		
		int result = emailService.sendEmail(edto);
		return result + "";
	}
	
	// 닉네임 중복 체크
	@RequestMapping(value = "/login/checkNick", method = RequestMethod.POST)
	@ResponseBody
	public int checkNick(LoginCommand lc) throws Exception {
		int i = us.checkNick(lc);
		return i;
	}
	
	// 로그인 페이지로 이동 
	@RequestMapping(value = "/join/login", method = RequestMethod.GET)
	public String loginPage() {
		return "join/login";
	}
	
	// 로그인
	@RequestMapping(value = "/login/loginOk") // login.jsp의 loginOk 라는 form 태그가 넘어올 때 
	public String login(LoginCommand lc, HttpSession session) {
		int i = us.login(lc, session);
		
		System.out.println(i);
		
		if(i == 0) { // 로그인 실패 
			return "redirect:login";
		} else { // 로그인 성공 
			us.setSession(session, lc);
			return "redirect:main";
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/login/logout")
	public String logut(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	
	// ID 찾기
	
	// 비밀번호 찾기 
	
	// API 로그인 
	

	
}
