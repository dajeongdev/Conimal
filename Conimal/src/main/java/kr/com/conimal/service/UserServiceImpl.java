package kr.com.conimal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	// 회원가입
	@Override
	public int join(UserDto userDto) throws Exception {
		userDto.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm")));
		return dao.join(userDto);
	}

	// 닉네임 중복 체크
	@Override
	public int checkNick(String nickname) throws Exception {
		return dao.checkNick(nickname);
	}
	
	// 아이디 중복 체크
	@Override
	public int checkId(String user_id) throws Exception {
		return dao.checkId(user_id);
	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	// 로그인
	@Override
	public UserDto login(UserDto userDto) {
		userDto.setLast_login(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm")));
		return dao.login(userDto);
	}
	
	// 아이디 찾기
	@Override
	public String findId(String email) {
		return dao.findId(email);
	}
	
	// 회원 정보 가져오기
	@Override
	public UserDto getUserInfo(String user_id) {
		return dao.getUserInfo(user_id);
	}
	
	@Override
	public void authentication(UserDto userDto) {
		dao.authentication(userDto);
	}
	
}
