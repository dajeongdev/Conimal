package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class MypageDao extends SqlSessionDaoSupport {
	
	public int updateUserInfo(UserDto user) {
		return getSqlSession().update("mypage.updateUserInfo", user);
	}

	public int updateEmail(UserDto user) {
		return getSqlSession().update("mypage.updateEmail", user);
	}
	
	public int getUserKey(Long user_id, String user_key) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_key", user_key);
		
		return getSqlSession().update("mypage.getUserKey", map);
	}

	public int updUserKey(Long user_id) {
		return getSqlSession().update("mypage.updUserKey", user_id);
	}

	public int secession(UserDto user) {
		return getSqlSession().delete("mypage.secession", user);
	}

}
