package kr.com.conimal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.CommunityDao;
import kr.com.conimal.dao.TagDao;
import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.TagDto;

@Service
public class TagService {
	
	@Autowired
	TagDao dao;
	
	public TagDto checkTag(String tag_name) {
		TagDto tag = dao.getTag(tag_name);
		
		// 태그 중복 확인 결과 태그가 없는 경우 
		if(tag == null) {
			tag = new TagDto();
			tag.setTag_name(tag_name);
			dao.writeTag(tag);
		}
		return tag;
	}
	
	public TagDto writeTag(int tag_idx, String tag_name) {
		TagDto tag = new TagDto();
		tag.setTag_name(tag_name);
		dao.writeTag(tag);
		return tag;
	}
	
	public int writeTagType(BoardUsedTagDto but) {
		int result = dao.writeTagType(but);
		return result;
	}
	
	public int writeUsedTag(int user_idx, String board_type, int board_idx, int[] tags) {
		BoardUsedTagDto but = new BoardUsedTagDto();
		but.setUser_idx(user_idx);
		but.setBoard_idx(board_idx);
		but.setBoard_type(board_type);

		int result = 0;
		for(int i = 0; i < tags.length; i++) {
			but.setTag_idx(tags[i]);
			result += writeTagType(but);
			dao.tagCount(but.getTag_idx());
		}
		return result;
	}	
	
	public TagDto readTag(String tag_name) {
		return dao.getTag(tag_name);
	}

}
