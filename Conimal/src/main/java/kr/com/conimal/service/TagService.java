package kr.com.conimal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.TagDao;
import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.TagDto;

@Service
public class TagService {
	
	@Autowired
	TagDao dao;
	
	public TagDto checkTag(String tag_name) {
		TagDto tag = dao.getTag(tag_name);
		
		if(tag == null) {
			tag = new TagDto();
			tag.setTag_name(tag_name);
			
			dao.writeTag(tag);
		}
		return tag;
	}
	
	public TagDto writeTag(String tag_name) {
		TagDto tag = new TagDto();
		tag.setTag_name(tag_name);
		System.out.println("TagService writeTag() tag_name : " + tag_name);
		dao.writeTag(tag);
		return tag;
	}
	
	public int writeTagType(BoardUsedTagDto but) {
		int result = dao.writeTagType(but);
		System.out.println("TagService writeTagType() but : " + but);
		return result;
	}
	
	public int writeUsedTag(int user_idx, String board_type, int board_idx, int[] tag_idx) {
		BoardUsedTagDto but = new BoardUsedTagDto();
		but.setUser_idx(user_idx);
		but.setBoard_idx(board_idx);
		but.setBoard_type(board_type);
		
		int result = 0;
		for(int i = 0; i < tag_idx.length; i++) {
			but.setTag_idx(tag_idx[i]);
			System.out.println("tag_idx[] = " + tag_idx[i]);
			result += writeTagType(but);
		}
		return result;
	}	
	
	public TagDto readTag(String tag_name) {
		return dao.getTag(tag_name);
	}

}
