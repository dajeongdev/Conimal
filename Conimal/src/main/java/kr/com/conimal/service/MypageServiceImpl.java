package kr.com.conimal.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.MypageDao;
import kr.com.conimal.model.dto.UserDto;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;

	@Override
	public int updateUserInfo(UserDto user) {
		user.setUpdate_date(LocalDate.now());
		return dao.updateUserInfo(user);
	}

	@Override
	public int secession(UserDto user) {
		return dao.secession(user);
	}

}
