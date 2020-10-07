package kr.com.conimal.service;

import kr.com.conimal.model.dto.ConimalDto;
import kr.com.conimal.model.dto.UserDto;

public interface MypageService {
		// 코니멀 등록 
		public int registerConimal(ConimalDto conimal);
		
		// 코니멀 목록
		
		
		// 배지 목록 
		
		
		// 작성 글 목록

		
		// 북마크 글 목록
		
		
		// 작성 댓글 목록
		
		// 정보 변경
		public int updateUserInfo(UserDto user);
		
		// 비밀번호 확인 
		public boolean checkPwd(String user_id, String password);
		
		// 회원 탈퇴
		public int secession(UserDto user);
}
