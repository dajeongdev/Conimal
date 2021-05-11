package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class UserDao extends SqlSessionDaoSupport {
	
	/* 회원가입 */
	public int join(UserDto user) throws Exception {
		return getSqlSession().insert("user.join", user);
	}
	
	/* 닉네임 중복 체크 */
	public int checkNick(String nickname) throws Exception {
		return getSqlSession().selectOne("user.checkNick", nickname);
	}
	
	/* 아이디 중복 체크 */
	public int checkId(String id) throws Exception {
		return getSqlSession().selectOne("user.checkId", id);
	}

	/* 이메일 중복 체크 */
	public int checkEmail(String email) throws Exception {
		return getSqlSession().selectOne("user.checkEmail", email);
	}
	/* 이메일 인증키 */
	public int getUserKey(Long user_id, String user_key) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_key", user_key);
		return getSqlSession().update("user.getUserKey", map);
	}
	/* 인증 완료 */
	public int updUserKey(Long user_id) throws Exception {
		return getSqlSession().update("user.updUserKey", user_id);
	}

	/* 로그인*/
	public UserDto login(UserDto user) throws Exception {
		return getSqlSession().selectOne("user.login", user);
	}
	/* 마지막 로그인 날짜 저장 */
	public int lastLogin(Long user_id) throws Exception {
		return getSqlSession().update("user.lastLogin", user_id);
	}
	
	/* 전체 회원 정보*/
	public List<UserDto> findAll() throws Exception {
		return getSqlSession().selectList("user.findAll");
	}
	
	/* 회원 정보 가져오기 */
	public UserDto findByUserId(Long user_id) throws Exception {
		return getSqlSession().selectOne("user.findByUserId", user_id);
	}
	public UserDto findById(String id) throws Exception {
		return getSqlSession().selectOne("user.findById", id);
	}

}
