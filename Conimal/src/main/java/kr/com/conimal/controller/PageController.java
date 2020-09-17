package kr.com.conimal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	// 메인 페이지로 이동
	@RequestMapping(value = "main")
	public String main() {
		return "main";
	}
	
	// 로그인 페이지로 이동 
	@RequestMapping(value = "/join/login")
	public String login() {
		return "/join/login";
	}
	
	// 회원가입 선택 페이지로 이동 
	@RequestMapping(value = "/join/join-select")
	public String join() {
		return "/join/join-select";
	}
	
	// 회원가입 입력 페이지로 이동 
	@RequestMapping(value = "/join/join-form")
	public String joinForm() {
		return "/join/join-form";
	}

	// 펫과사전 페이지로 이동
	@RequestMapping(value = "pet_dictionary/pet_dictionary")
	public String petDictionary() {
		return "pet_dictionary/pet_dictionary";
	}
	
	// 커뮤니티 페이지로 이동 
	@RequestMapping(value = "community/community-list")
	public String community() {
		return "community/community-list";
	}
}
