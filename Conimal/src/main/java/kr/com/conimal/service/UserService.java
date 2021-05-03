package kr.com.conimal.service;

import javax.servlet.http.HttpSession;

import kr.com.conimal.model.dto.UserDto;

public interface UserService {
	
	// 회원가입 
	public int join(UserDto userDto) throws Exception;
	
	// 닉네임 중복 체크 
	public int checkNick(String nickname) throws Exception;

	// 아이디 중복 체크
	public int checkId(String id) throws Exception;
	
	// 이메일 중복 체크
	public int checkEmail(String email) throws Exception;
	
	// 로그인 
	public UserDto login(UserDto userDto) throws Exception;
	// 로그인 체크
	public boolean loginCheck(UserDto userDto, HttpSession session) throws Exception;
	
	// 아이디 찾기
	public String findId(String email) throws Exception;
	
	// 회원정보 가져오기
	public UserDto findByUserId(Long user_id) throws Exception;
	public UserDto findById(String id) throws Exception;
}
