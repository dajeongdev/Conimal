package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

public interface UserDao {
	// 회원가입 
	public int join(UserDto userDto);
	
	// 아이디 체크
	public int checkId(LoginCommand lc) throws Exception;
	
	// 이메일 체크
	public int checkEmail(LoginCommand lc) throws Exception;
	
	// 닉네임 체크 
	public int checkNick(LoginCommand lc);
	
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
