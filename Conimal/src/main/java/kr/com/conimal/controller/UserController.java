package kr.com.conimal.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
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
	EmailService es;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	// Google API
	@Autowired
	GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	OAuth2Parameters googleOAuth2Parameters;
	
	// 메인 페이지 
	@RequestMapping(value = "main")
	public ModelAndView main(HttpSession session) {
		session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		//List<UserDto> users = ud.getAll();
		mav.setViewName("main");
		//mav.addObject("users", users);
		return mav;
	} 
	
	// 로그인 페이지로 이동 
	@RequestMapping(value = "/join/login")
	public String loginPage() {
		return "/join/login";
	}
	
	// 회원가입 선택 페이지로 이동 
	@RequestMapping(value = "/join/join-select")
	public String joinPage() {
		return "/join/join-select";
	}
	
	// 회원가입 입력 페이지로 이동 
	@RequestMapping(value = "/join/join-form")
	public String joinForm() {
		return "/join/join-form";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/join-form/checkId", method = RequestMethod.GET)
	@ResponseBody // ajax 사용 
	public int checkId(@RequestParam("user_id") String user_id) throws Exception {
		int result = us.checkId(user_id);
		return result;
	} 
	
	// 이메일 중복 체크 
	@RequestMapping(value = "/join-form/checkEmail", method = RequestMethod.GET)
	@ResponseBody
	public int checkEmail(@RequestParam("email") String email) throws Exception {
		int result = us.checkEmail(email);
		return result;
	} 
	
	// 닉네임 중복 체크
	@RequestMapping(value = "/join-form/checkNick", method = RequestMethod.GET)
	@ResponseBody
	public int checkNick(@RequestParam("nickname") String nickname) throws Exception {
		int result = us.checkNick(nickname);
		return result;
	} 
	
	// 회원가입
	@RequestMapping(value = "/join/join-form", method = RequestMethod.POST)
	public String join(UserDto userDto, HttpServletRequest request) throws Exception {
		// 비밀번호 암호화 
		/*String pwd = userDto.getPassword();
		String encoding = pwdEncoder.encode(pwd);
		userDto.setPassword(encoding);*/
		// 회원가입 메서드
		us.join(userDto);
		// 인증 메일 보내기 메서드 
		es.sendEmail(userDto.getEmail(), userDto.getUser_id(), request);
		return "redirect:/";
	}
	
	// 이메일 인증 
	@RequestMapping(value = "/updUserKey", method = RequestMethod.GET)
	public String updUserKey(@RequestParam("nickname") String nickname) throws Exception {
		es.updUserKey(nickname);
		return "/join/join-success";
	}
	
	// Google API
	@RequestMapping(value = "/login/google", method = RequestMethod.POST)
	public void googleCallback(HttpServletResponse response) {
		OAuth2Operations operations = googleConnectionFactory.getOAuthOperations();
		String url = operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(url);
			out.flush();
			out.close();
		} catch(IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}	
	@RequestMapping(value = "/login/googleCallback")
	public String doSessionAssignActionPage(HttpServletRequest request){
		System.out.println("/member/googleSignInCallback");
		String code = request.getParameter("code");
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		
		//UserDto user = new UserDto();
		//user.setNickname(person.getDisplayName());

		HttpSession session = request.getSession();
		//session.setAttribute("google", user);
		
		System.out.println(person.getDisplayName());
		
		return "redirect:/";
		/*System.out.println(person.getAccountEmail());
		System.out.println(person.getAboutMe());
		System.out.println(person.getDisplayName());
		System.out.println(person.getEtag());
		System.out.println(person.getFamilyName());
		System.out.println(person.getGender());
		*/
		
	}
	
	// 로그인
	@RequestMapping(value = "/login/login-success", method = RequestMethod.POST)
	public String login(UserDto user, HttpServletRequest request) throws Exception {
		UserDto login = us.login(user);
		HttpSession session = request.getSession();
		
		//boolean pwdMatch = pwdEncoder.matches(user.getPassword(), login.getPassword());
		
		if(login != null) { // 로그인 성공 
			session.setAttribute("user", login);
			return "redirect:/";
		} else { // 로그인 실패 
			session.setAttribute("user", null);
			return "/join/login";
		}
	} 
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// ID 찾기 페이지 이동
	@RequestMapping(value = "/join/find-id", method = RequestMethod.GET)
	public String findIdPage() {
		return "/join/find-id";
	}
	// ID 찾기
	@RequestMapping(value = "/join/find-id", method = RequestMethod.POST)
	@ResponseBody
	public String findId(@RequestParam String email) throws Exception {
		return us.findId(email);
	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/join/find-password", method = RequestMethod.GET)
	public String findPwdPage() {
		return "/join/find-password";
	}
	// 비밀번호 찾기 
	@RequestMapping(value = "/join/find-password", method = RequestMethod.POST)
	@ResponseBody
	public String findPwd(@RequestParam String user_id, @RequestParam String email, HttpServletRequest request) throws Exception {
		es.sendPwd(user_id, email, request);
		return "/join/login";
	}
	
	// API 로그인 

	
}
