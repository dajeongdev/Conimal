package kr.com.conimal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.command.SessionCommand;
import kr.com.conimal.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public int join(UserDto userDto) throws Exception {
		userDto.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		userDto.setUpdate_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		System.out.println("UserServiceImpl join() 호출");
		return dao.join(userDto);
	}

	@Override
	public int checkId(String user_id) throws Exception {
		System.out.println("UserServiceImpl checkId() 호출");
		return dao.checkId(user_id);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		System.out.println("UserServiceImpl checkEmail() 호출");
		return dao.checkEmail(email);
	}

	@Override
	public int checkNick(String nickname) throws Exception {
		System.out.println("UserServiceImpl checkNick() 호출");
		return dao.checkNick(nickname);
	}

	@Override
	public UserDto login(UserDto userDto) {
		System.out.println("UserService login() 호출");
		return dao.login(userDto);
	}
	
	@Override
	public void setSession(HttpSession session, LoginCommand lc) {
		UserDto user = getUserInfo(lc.getUser_id());
		
		SessionCommand sc = new SessionCommand();
		sc.setUserDto(user);
		session.setAttribute("sc", sc);
		session.setAttribute("nick", lc.getNickname());
		System.out.println("UserService setSession() 호출");
	}
	
	@Override
	public UserDto getUserInfo(String user_id) {
		return dao.getUserInfo(user_id);
	}

	@Override
	public UserDto selectUser(String user_id) {
		return dao.selectUser(user_id);
	}
	
	@Override
	public String findId(String email) {
		return dao.findId(email);
	}
	
	@Override
	public void authentication(UserDto userDto) {
		dao.authentication(userDto);
	}
	
}
