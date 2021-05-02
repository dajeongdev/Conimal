package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.ConimalDto;
import kr.com.conimal.model.dto.UserDto;

public class MypageDaoImpl extends SqlSessionDaoSupport implements MypageDao {
	
	@Override
	public int updateUserInfo(UserDto user) {
		return getSqlSession().update("mypage.updateUserInfo", user);
	}

	@Override
	public int updateEmail(UserDto user) {
		return getSqlSession().update("mypage.updateEmail", user);
	}
	
	@Override
	public int getUserKey(String id, String user_key) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("user_key", user_key);
		return getSqlSession().update("mypage.getUserKey", map);
	}

	@Override
	public int updUserKey(String id) {
		return getSqlSession().update("mypage.updUserKey", id);
	}

	@Override
	public boolean checkPwd(String id, String password) {
		boolean result = false;
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		int i = getSqlSession().selectOne("mypage.checkPwd", map);
		if(i == 1) result = true;
		return result;
	}

	@Override
	public int secession(UserDto user) {
		return getSqlSession().delete("mypage.secession", user);
	}

}
