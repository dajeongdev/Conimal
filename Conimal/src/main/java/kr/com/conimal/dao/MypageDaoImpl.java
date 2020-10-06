package kr.com.conimal.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.ConimalDto;
import kr.com.conimal.model.dto.UserDto;

public class MypageDaoImpl extends SqlSessionDaoSupport implements MypageDao {

	@Override
	public int registerConimal(ConimalDto conimal) {
		return getSqlSession().insert("mypage.registerConimal", conimal);
	}

	@Override
	public int updateNick(UserDto user) {
		Map<String, String> map = new HashMap<>();
		map.put("nickname", user.getNickname());
		map.put("update_date", user.getUpdate_date());
		map.put("password", user.getPassword());
		System.out.println("MypageDaoImpl updateNick() : " + user.getNickname());
		System.out.println("MypageDaoImpl updateNick() : " + user.getPassword());
		return getSqlSession().update("mypage.updateNick", map);
	}

	@Override
	public int updatePassword(UserDto user) {
		Map<String, String> map = new HashMap<>();
		map.put("password", user.getPassword());
		map.put("update_date", user.getUpdate_date());
		System.out.println("MypageDaoImpl updatePassword() : " + user.getPassword());
		return getSqlSession().update("mypage.updatePassword", map);
	}

	@Override
	public int updateEmail(UserDto user) {
		Map<String, String> map = new HashMap<>();
		map.put("nickname", user.getEmail());
		map.put("update_date", user.getUpdate_date());
		map.put("password", user.getPassword());
		System.out.println("MypageDaoImpl updateEmail() : " + user.getEmail());
		System.out.println("MypageDaoImpl updateEmail() : " + user.getPassword());
		return getSqlSession().update("mypage.updateEmail", map);
	}

	@Override
	public boolean checkPwd(String user_id, String password) {
		boolean result = false;
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		int i = getSqlSession().selectOne("mypage.checkPwd", map);
		if(i == 1) result = true;
		return result;
	}

	@Override
	public int secession(UserDto user) {
		return getSqlSession().update("mypage.secession", user);
	}

}
