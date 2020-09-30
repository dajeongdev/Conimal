package kr.com.conimal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.conimal.dao.UserDao;
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
	@RequestMapping(value = "main")
	public ModelAndView selectAll() {
		ModelAndView mav = new ModelAndView();
		//List<UserDto> users = ud.getAll();
		mav.setViewName("main");
		//mav.addObject("users", users);
		System.out.println("메인 페이지 이동");
		return mav;
	} 
	
	// 회원가입 선택 페이지로 이동 
	@RequestMapping(value = "/join/join-select")
	public String joinPage() {
		System.out.println("회원가입 선택 페이지 이동");
		return "/join/join-select";
	}
	
	// 회원가입 입력 페이지로 이동 
	@RequestMapping(value = "/join/join-form")
	public String joinForm() {
		System.out.println("회원가입 입력 페이지 이동");
		return "/join/join-form";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/join-form/checkId", method = RequestMethod.GET)
	@ResponseBody // ajax 사용 
	public int checkId(@RequestParam("user_id") String user_id) throws Exception {
		System.out.println("UserController checkId() 호출");
		int result = us.checkId(user_id);
		return result;
	} 
	
	// 이메일 중복 체크 
	@RequestMapping(value = "/join-form/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public int checkEmail(@RequestParam("email") String email) throws Exception {
		System.out.println("UserController checkEmail() 호출");
		int result = us.checkEmail(email);
		return result;
	} 
	
	// 닉네임 중복 체크
	@RequestMapping(value = "/join-form/checkNick", method = RequestMethod.GET)
	@ResponseBody
	public int checkNick(@RequestParam("nickname") String nickname) throws Exception {
		System.out.println("UserController checkNick() 호출");
		int result = us.checkNick(nickname);
		return result;
	} 
	
	// 회원가입
	@RequestMapping(value = "/join/join-form", method = RequestMethod.POST)
	public String join(UserDto userDto, HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("UserController join() 진입");
		// 회원가입 메서드
		us.join(userDto);
		// 인증 메일 보내기 메서드 
		System.out.println("UserController 인증 메일 보내기");
		emailService.sendEmail(userDto.getEmail(), userDto.getNickname(), request);

		return "redirect:/";
	}
	
	// 이메일 인증 
	@RequestMapping(value = "/join-form/updUserKey", method = RequestMethod.GET)
	public String updUserKey(@RequestParam("user_id") String user_id, @RequestParam("user_key") String user_key) throws Exception {
		emailService.updUserKey(user_id, user_key);
		return "join/join-success";
	}
	
	// 로그인 페이지로 이동 
	@RequestMapping(value = "/join/login")
	public String loginPage() {
		System.out.println("로그인 페이지 이동");
		return "/join/login";
	}
	
	// 로그인
	@RequestMapping(value = "/login/login-success", method = RequestMethod.POST)
	public String login(UserDto userDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto login = us.login(userDto);
		
		System.out.println("UserController login() 호출");
		
		if(login == null) { // 로그인 실패 
			session.setAttribute("user", null);
			return "redirect:/join/login";
		} else { // 로그인 성공 
			session.setAttribute("user", login);
			return "redirect:/";
		}
	} 
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logut(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	// ID 찾기 페이지 이동
	@RequestMapping(value = "/join/findId", method = RequestMethod.GET)
	public String findIdPage() {
		System.out.println("UserController 아이디 찾기 페이지 이동");
		return "/join/findId";
	}
	// ID 찾기
	@RequestMapping(value = "/join/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam String email) {
		return us.findId(email);
	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/join/findPwd", method = RequestMethod.GET)
	public String findPwdPage() {
		System.out.println("UserController 비밀번호 찾기 페이지 이동");
		return "/join/findPwd";
	}
	
	// 비밀번호 찾기 
	
	// API 로그인 
	

	
}
