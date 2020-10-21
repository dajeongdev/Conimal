package kr.com.conimal.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
		userDto.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
		return dao.join(userDto);
	}

	@Override
	public int checkId(String user_id) throws Exception {
		return dao.checkId(user_id);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int checkNick(String nickname) throws Exception {
		return dao.checkNick(nickname);
	}

	@Override
	public UserDto login(UserDto userDto) {
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
