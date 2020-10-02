package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

public interface UserDao {
	// 회원가입 
	public int join(UserDto userDto) throws Exception;
	
	// 아이디 중복 체크
	public int checkId(String user_id) throws Exception;
	
	// 이메일 중복 체크
	public int checkEmail(String email) throws Exception;
	
	// 회원 인증키 생성
	public int getUserKey(Map<String, Object> map, String user_id, String user_key) throws Exception;
	
	// 회원 인증키 확인 
	public int updUserKey(String user_id);
	
	// 닉네임 중복 체크 
	public int checkNick(String nickname) throws Exception;
	
	// 로그인 
	public UserDto login(UserDto userDto);
	
	// 회원 정보 가져오기
	public UserDto selectUser(String user_id);
	
	// 아아디 찾기
	public String findId(String email);
	
	// 비밀번호 찾기
	public UserDto findPwd(String user_id);
	public int findPassword(String user_id, String email, String key);
	
	// API 로그인 
	public void authentication(UserDto userDto);
	
	// 전체 회원 정보 가져오기 
	public List<UserDto> getAll();
	
	// 회원 정보 가져오기 
	public UserDto getUserInfo(String user_id);
}
