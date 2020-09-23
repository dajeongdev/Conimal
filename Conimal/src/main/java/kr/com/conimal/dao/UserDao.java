package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

public interface UserDao {
	// 회원가입 
	public int join(UserDto userDto) throws Exception;
	
	// 아이디 체크
	public int checkId(String user_id) throws Exception;
	
	// 이메일 체크
	public int checkEmail(String email) throws Exception;
	
	// 회원 인증키 생성
	public int getUserKey(String user_id, String user_key) throws Exception;
	
	// 회원 인증키 확인 
	public int updUserKey(String user_id, String user_key) throws Exception;
	
	// 닉네임 체크 
	public int checkNick(String nickname) throws Exception;
	
	// 로그인 
	public List<UserDto> login(LoginCommand lc);
	
	// ID 찾기
	public UserDto findId(String user_id);
	
	/* 비밀번호 찾기
	public List<UserDto> findPassword(UserDto userDto);*/
	
	// API 로그인 
	public void authentication(UserDto userDto);
	
	public List<UserDto> selectAll();
}
