package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.command.LoginCommand;
import kr.com.conimal.model.dto.UserDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao  {

	@Override
	public int join(UserDto userDto) {
		return getSqlSession().insert("user.join", userDto);
	}

	@Override
	public int checkId(LoginCommand lc) throws Exception {
		return getSqlSession().selectOne("user.checkId", lc);
	}

	@Override
	public int checkEmail(LoginCommand lc) throws Exception {
		return getSqlSession().selectOne("user.checkEmail", lc);
	}

	@Override
	public int checkNick(LoginCommand lc) {
		return getSqlSession().selectOne("user.checkNick", lc);
	}
	
	@Override
	public UserDto findId(String user_id) {
		return getSqlSession().selectOne("user.findId", user_id);
	}

	@Override
	public List<UserDto> login(LoginCommand lc) {
		return getSqlSession().selectList("user.login", lc);
	}

	@Override
	public List<UserDto> selectAll() {
		return getSqlSession().selectList("user.selectAll");
	}
	
	@Override
	public void authentication(UserDto userDto) {
		getSqlSession().insert("user.authentication", userDto);
		
	}

}
