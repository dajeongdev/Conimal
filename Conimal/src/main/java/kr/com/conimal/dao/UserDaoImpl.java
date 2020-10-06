package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao  {

	@Override
	public int join(UserDto userDto) throws Exception {
		System.out.println("UserDaoImpl join() 호출");
		return getSqlSession().insert("user.join", userDto);
	}
	
	@Override
	public int checkNick(String nickname) throws Exception {
		int i = getSqlSession().selectOne("user.checkNick", nickname);
		System.out.println("UserDaoImpl checkNick() 호출");
		return i;
	}

	@Override
	public int checkId(String user_id) throws Exception {
		int i = getSqlSession().selectOne("user.checkId", user_id);
		System.out.println("UserDaoImpl checkId() 호출");
		return i;
	}

	@Override
	public int checkEmail(String email) throws Exception {
		int i = getSqlSession().selectOne("user.checkEmail", email);
		System.out.println("UserDaoImpl checkEmail() 호출");
		return i;
	}
	
	@Override
	public int getUserKey(String user_id, String user_key) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_key", user_key);
		return getSqlSession().update("user.getUserKey", map);
	}
	
	@Override
	public int updUserKey(String user_id) {
		return getSqlSession().update("user.updUserKey", user_id);
	}

	@Override
	public UserDto login(UserDto userDto) {
		System.out.println("UserDaoImpl login() 호출");
		return getSqlSession().selectOne("user.login", userDto);
	}

	@Override
	public List<UserDto> getAll() {
		System.out.println("UserDaoImpl selectAll() 호출");
		return getSqlSession().selectList("user.getAll");
	}
	
	@Override
	public UserDto getUserInfo(String user_id) {
		return getSqlSession().selectOne("user.getUserInfo", user_id);
	}
	
	@Override
	public String findId(String email) {
		return getSqlSession().selectOne("user.findId", email);
	}
	
	@Override
	public int findPassword(String user_id, String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("email", email);
		map.put("password", password);
		System.out.println("UserDaoImpl user_id 값 :" + user_id);
		System.out.println("UserDaoImpl email 값 :" + email);
		System.out.println("UserDaoImpl password 값 :" + password);
		System.out.println("UserDaoImpl map 값 :" + map);
		return getSqlSession().update("user.findPassword", map);
	}
	
	@Override
	public void authentication(UserDto userDto) {
		System.out.println("UserDaoImpl authentication() 호출");
		getSqlSession().insert("user.authentication", userDto);
	}

	@Override
	public UserDto selectUser(String user_id) {
		return null;
	}

}
