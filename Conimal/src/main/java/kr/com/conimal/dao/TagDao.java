package kr.com.conimal.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.TagDto;

public class TagDao extends SqlSessionDaoSupport {
	
	// 태그 이름 있으면 불러오기
	public TagDto getTag(String tag_name) {
		System.out.println("TagDao getTag() : " +tag_name);
		return getSqlSession().selectOne("tag.getTag", tag_name);
	}
	
	// 태그 이름 없으면 DB에 입력
	public int writeTag(TagDto tag) {
		tag.getTag_idx();
		System.out.println("TagDao writeTag() : " +tag);
		return getSqlSession().insert("tag.writeTag", tag);
	}
	
	// 태그 이름 유무에 상관없이 글 작성 시 태그가 있으면 DB에 입력
	public int writeTagType(BoardUsedTagDto btdto) {
		System.out.println("TagDao writeTagType : " + btdto);
		return getSqlSession().insert("tag.writeTagType", btdto);
	}
}
