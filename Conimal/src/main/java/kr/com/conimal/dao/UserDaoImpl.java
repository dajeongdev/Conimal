package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {
	
	// 회원가입
	@Override
	public int join(UserDto user) throws Exception {
		return getSqlSession().insert("user.join", user);
	}
	
	// 닉네임 중복 체크
	@Override
	public int checkNick(String nickname) throws Exception {
		return getSqlSession().selectOne("user.checkNick", nickname);
	}
	
	// 아이디 중복 체크
	@Override
	public int checkId(String id) throws Exception {
		return getSqlSession().selectOne("user.checkId", id);
	}

	// 이메일 중복 체크
	@Override
	public int checkEmail(String email) throws Exception {
		return getSqlSession().selectOne("user.checkEmail", email);
	}

	@Override
	public int getUserKey(String id, String user_key) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("user_key", user_key);
		return getSqlSession().update("user.getUserKey", map);
	}
	@Override
	public int updUserKey(String id) throws Exception {
		return getSqlSession().update("user.updUserKey", id);
	}

	// 로그인
	@Override
	public UserDto login(UserDto user) throws Exception {
		return getSqlSession().selectOne("user.login", user);
	}
	@Override
	public int lastLogin(String id) throws Exception {
		return getSqlSession().update("user.lastLogin", id);
	}
	
	// 아이디 찾기
	@Override
	public String findId(String email) throws Exception {
		return getSqlSession().selectOne("user.findId", email);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPassword(String id, String email, String password) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		map.put("password", password);
		return getSqlSession().update("user.findPassword", map);
	}
	
	// 전체 회원 정보
	@Override
	public List<UserDto> getAll() throws Exception {
		return getSqlSession().selectList("user.getAll");
	}
	
	// 회원 정보 가져오기
	@Override
	public UserDto getUserInfo(String id) throws Exception {
		return getSqlSession().selectOne("user.getUserInfo", id);
	}

}
