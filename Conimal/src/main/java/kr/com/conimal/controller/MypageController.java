package kr.com.conimal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.conimal.dao.MypageDao;
import kr.com.conimal.model.dto.UserDto;
import kr.com.conimal.service.EmailService;
import kr.com.conimal.service.MypageService;
import kr.com.conimal.service.UserService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService ms;
	
	@Autowired
	UserService us;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	EmailService emailService;

	// 마이페이지 메인 페이지로 이동
	@RequestMapping(value = "/my-page/my-page", method = RequestMethod.GET)
	public String mypagePage(HttpSession session) {
		session.getAttribute("user");
		return "/my-page/my-page";
	}
	
	// 마이페이지 뱃지 페이지로 이동
	@RequestMapping(value = "/my-page/my-badge", method = RequestMethod.GET)
	public String mybadgePage() {
		return "/my-page/my-badge";
	}
	
	/* 마이페이지 뱃지 페이지로 이동
	@RequestMapping(value = "/my-page/my-conimal")
	public String myconimalPage() {
		return "/my-page/my-conimal";
	} */
	
	// 마이페이지 작성글 페이지로 이동
	@RequestMapping(value = "/my-page/my-post", method = RequestMethod.GET)
	public String mypostPage() {
		return "/my-page/my-post";
	}
	
	// 마이페이지 댓글 페이지로 이동
	@RequestMapping(value = "/my-page/my-comment", method = RequestMethod.GET)
	public String mycommentPage() {
		return "/my-page/my-comment";
	}
	
	// 마이페이지 북마크 페이지로 이동
	@RequestMapping(value = "/my-page/my-bookmark", method = RequestMethod.GET)
	public String mybookmarkPage() {
		return "/my-page/my-bookmark";
	}
	
	// 마이페이지 계정 정보 페이지로 이동
	@RequestMapping(value = "/my-page/my-account", method = RequestMethod.GET)
	public String myaccountPage(HttpSession session) {
		session.getAttribute("user");
		return "/my-page/my-account";
	}
	
	// 정보 수정
	@RequestMapping(value = "/my-page/my-account", method = RequestMethod.POST)
	@ResponseBody
	public String updateUserInfo(@RequestParam String email, @RequestParam String user_id, HttpServletRequest request, UserDto user, HttpSession session) throws Exception {
		ms.updateUserInfo(user);
		System.out.println("MypageController updateUserInfo");
		int result = us.checkEmail(email);
		// 이메일 변경 시 인증 이메일 보내기
		if(result == 0) { // 중복 아님 
			System.out.println("MypageController updateEmail");
			emailService.updateEmail(email, user_id, request);
		} 
		
		return "/main";
	}
	
	// 이메일 인증 
	@RequestMapping(value = "/updateUserKey", method = RequestMethod.GET)
	public String updateUserKey(@RequestParam String user_id, @RequestParam String email, UserDto user) throws Exception {
		emailService.updateUserKey(user_id, email, user);
		return "/join/login";
	}
	
	// 비밀번호 확인
	@RequestMapping(value = "/checkPwd", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkPwd(UserDto user) {
		UserDto login = us.login(user);
		boolean chkPwd = pwdEncoder.matches(user.getPassword(), login.getPassword());
		return chkPwd;
	}
	
	@RequestMapping(value = "/secession", method = RequestMethod.POST)
	public String secession(UserDto user, HttpSession session) {
		boolean result = checkPwd(user);
		if(result) {
			ms.secession(user);
			session.invalidate();
			return "redirect:/";
		} else {
			return "/my-page/my-account";
		}
	}
}
