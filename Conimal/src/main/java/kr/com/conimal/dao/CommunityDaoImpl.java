package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;

public class CommunityDaoImpl extends SqlSessionDaoSupport implements CommunityDao {

	@Override
	public List<CommunityDto> getListing(PagingCommand paging) {
		return getSqlSession().selectList("community.getCommunityList", paging);
	}

	@Override
	public List<CommunityDto> getPaging(Map<String, Integer> map) {
		return getSqlSession().selectList("community.getCommunityList", map);
	}

	@Override
	public int getTotal() {
		return getSqlSession().selectOne("community.getTotal()");
	}
	
	@Override
	public List<CommunityFileDto> getFileListing() {
		return getSqlSession().selectList("community.fileList");
	}
	
	@Override
	public int writeCommunity(CommunityDto community) {
		getSqlSession().insert("community.writeCommunity", community);
		return community.getCommunity_idx();
	}
	
	@Override
	public int writeCommunityFile(CommunityFileDto file) {
		return getSqlSession().insert("community.writeCommunityFile", file);
	}

	@Override
	public int writeComment(CommentDto comment) {
		return getSqlSession().insert("community.writeComment", comment);
	}

	@Override
	public CommunityDto readCommunity(int community_idx) {
		return getSqlSession().selectOne("community.readCommunity", community_idx);
	}
	
	@Override
	public List<CommunityFileDto> readCommunityFile(int community_idx) {
		return getSqlSession().selectList("community.readCommunityFile", community_idx);
	}

	@Override
	public List<CommentDto> readComment(int community_idx) {
		return getSqlSession().selectList("community.readComment", community_idx);
	}

	@Override
	public CommentDto readCommentIdx(int comment_idx) {
		return getSqlSession().selectOne("community.readCommentIdx", comment_idx);
	}

	@Override
	public int hitCount(int community_idx) {
		return getSqlSession().update("community.hitCount", community_idx);
	}

	@Override
	public int editCommunity(CommunityDto community) {
		return getSqlSession().update("community.editCommunity", community);
	}

	@Override
	public int editComment(CommentDto comment) {
		return getSqlSession().update("community.editComment", comment);
	}

	@Override
	public int deleteCommunity(int community_idx) {
		return getSqlSession().update("community.deleteCommunity", community_idx);
	}

	@Override
	public int deleteComment(int comment_idx) {
		return getSqlSession().update("community.deleteComment", comment_idx);
	}

}
