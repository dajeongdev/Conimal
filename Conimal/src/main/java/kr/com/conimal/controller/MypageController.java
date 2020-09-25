package kr.com.conimal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	// 마이페이지 메인 페이지로 이동
	@RequestMapping(value = "/my-page/my-page")
	public String mypagePage() {
		System.out.println("마이페이지 메인 이동");
		return "/my-page/my-page";
	}
}
