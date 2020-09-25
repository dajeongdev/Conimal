package kr.com.conimal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

	// 커뮤니티 메인 페이지로 이동 
	@RequestMapping(value = "/community/community-list")
	public String communityPage() {
		System.out.println("커뮤니티 메인 페이지 이동");
		return "/community/community-list";
	}
}
