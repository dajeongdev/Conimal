package kr.com.conimal.dao;

import kr.com.conimal.model.dto.UserDto;

public interface MypageDao {
	
	// 정보 변경
	public int updateUserInfo(UserDto user);
	public int updateEmail(UserDto user);
	public int getUserKey(Long user_id, String user_key);
	public int updUserKey(Long user_id);
	
	// 비밀번호 확인
	public boolean checkPwd(String id, String password);
	
	// 회원 탈퇴
	public int secession(UserDto user);
	
}
