package kr.com.conimal.service;

import javax.servlet.http.HttpSession;

import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

public interface UserService {
	// 회원가입 
	public int join(UserDto userDto) throws Exception;
	
	// 닉네임 중복 체크 
	public int checkNick(String nickname) throws Exception;

	// 아이디 중복 체크
	public int checkId(String user_id) throws Exception;
	
	// 이메일 중복 체크
	public int checkEmail(String email) throws Exception;
	
	// 로그인 
	public UserDto login(UserDto userDto);
	
	// 아이디 찾기
	public String findId(String email);
	
	// 회원정보 가져오기
	public UserDto getUserInfo(String user_id);

	// API 로그인 
	public void authentication(UserDto userDto);
	
}
