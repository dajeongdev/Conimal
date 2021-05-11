package kr.com.conimal.service;

import kr.com.conimal.model.dto.UserDto;

public interface MypageService {

	// 정보 변경
	public int updateUserInfo(UserDto user);
		
	// 회원 탈퇴
	public int secession(UserDto user);
}
