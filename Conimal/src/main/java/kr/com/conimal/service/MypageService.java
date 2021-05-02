package kr.com.conimal.service;

import kr.com.conimal.model.dto.UserDto;

public interface MypageService {

	// 정보 변경
	public int updateUserInfo(UserDto user);
		
	// 비밀번호 확인 
	public boolean checkPwd(String id, String password);
		
	// 회원 탈퇴
	public int secession(UserDto user);
}
