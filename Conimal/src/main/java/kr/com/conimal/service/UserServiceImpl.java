package kr.com.conimal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.UserDao;
import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public int join(UserDto userDto) {
		int i = dao.join(userDto);
		return i;
	}

	@Override
	public int checkId(LoginCommand lc) throws Exception {
		return dao.checkId(lc);
	}

	@Override
	public int checkEmail(LoginCommand lc) throws Exception {
		return dao.checkEmail(lc);
	}

	@Override
	public int checkNick(LoginCommand lc) throws Exception {
		return dao.checkNick(lc);
	}
	
	// 세션 서비스
	public void setSession(HttpSession session, LoginCommand lc) {
		UserDto user = selectUser(lc.getUser_id());
		
		session.setAttribute("sc", user);
		session.setAttribute("UI", lc.getNickname());
	}

	@Override
	public int login(LoginCommand lc, HttpSession session) {
		List<UserDto> list = dao.login(lc);
		setSession(session, lc);
		return list.size();
	}

	@Override
	public UserDto selectUser(String user_id) {
		return dao.findId(user_id);
	}
	
	@Override
	public void authentication(UserDto userDto) {
		dao.authentication(userDto);
	}
	
}
