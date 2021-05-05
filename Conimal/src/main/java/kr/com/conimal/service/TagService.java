package kr.com.conimal.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.com.conimal.dao.TagDao;
import kr.com.conimal.model.dto.BoardTagDto;
import kr.com.conimal.model.dto.TagDto;

@Service
public class TagService {
	
	@Autowired
	TagDao dao;
	
	public TagDto checkTag(String name) {
		TagDto tag = dao.getTag(name);
		
		// 태그 중복 확인 결과 태그가 없는 경우 
		if(tag == null) {
			tag = new TagDto();
			tag.setName(name);
			dao.writeTag(tag);
		}
		return tag;
	}
	
	// 새로운 태그 입력
	public TagDto writeTag(int tag_idx, String name) {
		TagDto tag = new TagDto();
		tag.setName(name);
		dao.writeTag(tag);
		return tag;
	}
	
	public int writeTagType(BoardTagDto boardUsedTag) {
		int result = dao.writeTagType(boardUsedTag);
		System.out.println("TagService writeTagType boardUsedTag.tag_idx : " + boardUsedTag.getTag_id());
		return result;
	}	
	
	// 태그 타입 입력
	public int writeUsedTag(Long board_id, Long[] tags) {
		BoardTagDto boardUsedTag = new BoardTagDto();
		boardUsedTag.setTag_id(board_id);
		
		int result = 0;
		for(int i = 0; i < tags.length; i++) {
			boardUsedTag.setTag_id(tags[i]);
			System.out.println("TagService tag_idx[] : " + tags[i]);
			result += writeTagType(boardUsedTag);
			System.out.println("TagService result : " + result);
		}
		return result;
	}
	
	public TagDto readTag(String name) {
		return dao.getTag(name);
	}

}
