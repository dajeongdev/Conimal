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
	
	// 새로운 태그 입력
	public TagDto writeTag(int tag_idx, String tag_name) {
		TagDto tag = new TagDto();
		tag.setTag_name(tag_name);
		dao.writeTag(tag);
		return tag;
	}
	
	public int writeTagType(BoardUsedTagDto boardUsedTag) {
		int result = dao.writeTagType(boardUsedTag);
		dao.tagCount(boardUsedTag.getTag_idx());
		System.out.println("TagService writeTagType boardUsedTag.tag_idx : " + boardUsedTag.getTag_idx());
		return result;
	}	
	// 태그 타입 입력
	public int writeUsedTag(String user_idx, String board_type, int board_idx, int[] tags) {
		BoardUsedTagDto boardUsedTag = new BoardUsedTagDto();
		boardUsedTag.setUser_idx(user_idx);
		boardUsedTag.setBoard_idx(board_idx);
		boardUsedTag.setBoard_type(board_type);
		
		int result = 0;
		for(int i = 0; i < tags.length; i++) {
			boardUsedTag.setTag_idx(tags[i]);
			System.out.println("TagService tag_idx[] : " + tags[i]);
			result += writeTagType(boardUsedTag);
			System.out.println("TagService result : " + result);
		}
		return result;
	}
	
	public TagDto readTag(String tag_name) {
		return dao.getTag(tag_name);
	}

}
