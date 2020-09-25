package kr.com.conimal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetdictionaryController {

	// 펫과사전 메인 페이지로 이동
	@RequestMapping(value = "/pet_dictionary/pet_dictionary")
	public String petDictionaryPage() {
		System.out.println("펫과사전 메인 페이지 이동");
		return "/pet_dictionary/pet_dictionary";
	}
}
