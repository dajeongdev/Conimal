package kr.com.conimal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	EmailService emailService;
	
	/* 정보 수정 페이지로 이동 */
	@RequestMapping(value = "/my-page/my-account", method = RequestMethod.GET)
	public ModelAndView myaccountPage(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("/my-page/my-account");
		
		Long user_id = (Long) session.getAttribute("user_id");
		UserDto user = us.findByUserId(user_id);
		mav.addObject("user", user);
		return mav;
	} 
	
	/* 정보 수정 */
	@ResponseBody
	@RequestMapping(value = "/my-page/my-account", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(@ModelAttribute UserDto dto, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		UserDto user = us.findByUserId(dto.getUser_id());
		
		if (user.getPassword() != dto.getPassword() || user.getNickname() != dto.getNickname()) {
			ms.updateUserInfo(dto);
		} else if (user.getEmail() != dto.getEmail()) {
			emailService.updateEmail(dto.getEmail(), dto.getUser_id());
		} 
		
		session.invalidate();
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	/* 이메일 인증 */
	@RequestMapping(value = "/updateUserKey", method = RequestMethod.GET)
	public String updateUserKey(@RequestParam Long user_id, @RequestParam String email, UserDto user) throws Exception {
		emailService.updateUserKey(user_id, email, user);
		
		return "redirect:/join/login";
	}
	
	/* 회원 탈퇴 */
	@RequestMapping(value = "/secession", method = RequestMethod.POST)
	public String secession(UserDto user, HttpSession session) throws Exception {
		if(user.getPassword() != null) {
			ms.secession(user);
			session.invalidate();
			
			return "redirect:/";
		} else {
			return "/my-page/my-account";
		}
	}
}
