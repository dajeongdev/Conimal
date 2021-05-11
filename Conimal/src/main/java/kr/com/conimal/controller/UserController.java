package kr.com.conimal.controller;

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
	EmailService es;
	
	/* 메인 페이지 */
	@RequestMapping(value = "main")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		return mav;
	} 
	
	/* 로그인 페이지로 이동 */
	@RequestMapping(value = "/join/login")
	public String loginPage() {
		return "/join/login";
	}
	
	/* 회원가입 입력 페이지로 이동 */
	@RequestMapping(value = "/join/join-form")
	public String joinForm() {
		return "/join/join-form";
	}
	
	/* 아이디 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/join-form/checkId", method = RequestMethod.GET)
	public int checkId(@RequestParam("id") String id) throws Exception {
		int result = us.checkId(id);
		
		return result;
	} 
	
	/* 이메일 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/join-form/checkEmail", method = RequestMethod.GET)
	public int checkEmail(@RequestParam("email") String email) throws Exception {
		int result = us.checkEmail(email);
		
		return result;
	} 
	
	/* 닉네임 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/join-form/checkNick", method = RequestMethod.GET)
	public int checkNick(@RequestParam("nickname") String nickname) throws Exception {
		int result = us.checkNick(nickname);
		
		return result;
	} 
	
	/* 회원가입 */
	@RequestMapping(value = "/join/join-form", method = RequestMethod.POST)
	public String join(UserDto userDto) throws Exception {
		
		us.join(userDto); // 회원가입
		
		UserDto user = us.findByUserId(userDto.getUser_id());
		es.sendEmail(user.getEmail(), user.getUser_id()); // 인증 메일 보내기
		
		return "redirect:/";
	}
	
	/* 이메일 인증 */
	@RequestMapping(value = "/updUserKey", method = RequestMethod.GET)
	public String updUserKey(@RequestParam("user_id") Long user_id) throws Exception {
		
		es.updUserKey(user_id);
		
		return "/join/login";
	}
	
	/* 로그인 */
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(UserDto userDto, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		UserDto result = us.login(userDto);
		
		UserDto user = us.findById(userDto.getId());
		
		if(result != null) { // 로그인 성공 
			session.setAttribute("user", user);
			mav.setViewName("redirect:/");
		} else { // 로그인 실패 
			session.setAttribute("user", null);
			mav.setViewName("redirect:/join/login");
		}
		
		return mav;
	} 
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
