package kr.com.conimal.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.TagDto;

public class TagDao extends SqlSessionDaoSupport {
	
	public TagDto getTag(String tag_name) {
		return getSqlSession().selectOne("tag.getTag", tag_name);
	}
	
	public int writeTag(TagDto tag) {
		getSqlSession().insert("tag.writeTag", tag);
		return tag.getTag_idx();
	}
	
	public int writeTagType(BoardUsedTagDto btdto) {
		return getSqlSession().insert("tag.writeTagType", btdto);
	}
}
