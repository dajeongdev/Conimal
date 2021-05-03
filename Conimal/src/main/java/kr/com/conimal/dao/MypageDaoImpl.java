package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.UserDto;

public class MypageDaoImpl extends SqlSessionDaoSupport implements MypageDao {
	
	@Override
	public int updateUserInfo(UserDto user) {
		System.out.println("MypageDao user.id : " + user.getUser_id());
		System.out.println("MypageDao user.password : " + user.getPassword());
		System.out.println("MypageDao user.email : " + user.getEmail());
		System.out.println("MypageDao user.update_date : " + user.getUpdate_date());
		return getSqlSession().update("mypage.updateUserInfo", user);
	}

	@Override
	public int updateEmail(UserDto user) {
		return getSqlSession().update("mypage.updateEmail", user);
	}
	
	@Override
	public int getUserKey(Long user_id, String user_key) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_key", user_key);
		return getSqlSession().update("mypage.getUserKey", map);
	}

	@Override
	public int updUserKey(Long user_id) {
		return getSqlSession().update("mypage.updUserKey", user_id);
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
