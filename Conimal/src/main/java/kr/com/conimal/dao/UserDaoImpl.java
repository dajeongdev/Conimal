package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao  {
	// 회원가입
	@Override
	public int join(UserDto user) throws Exception {
		return getSqlSession().insert("user.join", user);
	}
	
	// 닉네임 중복 체크
	@Override
	public int checkNick(String nickname) throws Exception {
		int i = getSqlSession().selectOne("user.checkNick", nickname);
		return i;
	}
	
	// 아이디 중복 체크
	@Override
	public int checkId(String user_id) throws Exception {
		int i = getSqlSession().selectOne("user.checkId", user_id);
		return i;
	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(String email) throws Exception {
		int i = getSqlSession().selectOne("user.checkEmail", email);;
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
	public int updUserKey(String user_id) throws Exception {
		return getSqlSession().update("user.updUserKey", user_id);
	}

	// 로그인
	@Override
	public UserDto login(UserDto user) throws Exception {
		return getSqlSession().selectOne("user.login", user);
	}
	
	// 아이디 찾기
	@Override
	public String findId(String email) throws Exception {
		return getSqlSession().selectOne("user.findId", email);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPassword(String user_id, String email, String password) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("email", email);
		map.put("password", password);
		return getSqlSession().update("user.findPassword", map);
	}
	
	// 전체 회원 정보
	@Override
	public List<UserDto> getAll() throws Exception {
		System.out.println("UserDaoImpl selectAll() 호출");
		return getSqlSession().selectList("user.getAll");
	}
	
	// 회원 정보 가져오기
	@Override
	public UserDto getUserInfo(String user_id) throws Exception {
		return getSqlSession().selectOne("user.getUserInfo", user_id);
	}
	
	@Override
	public void authentication(UserDto user) {
		System.out.println("UserDaoImpl authentication() 호출");
		getSqlSession().insert("user.authentication", user);
	}

}
