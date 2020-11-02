package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;

public class CommunityDaoImpl extends SqlSessionDaoSupport implements CommunityDao {
	
	// 인기 태그 목록
	@Override
	public List<TagDto> getHitTagList() {
		return getSqlSession().selectList("community.getHitTagList");
	}
	
	// 글 목록
	@Override
	public List<Map<String, Object>> list(PagingCommand page) {
		return getSqlSession().selectList("community.list", page);
	}
	@Override
	public int getCount() {
		return getSqlSession().selectOne("community.getCount");
	}
	@Override
	public List<TagDto> tagList(int community_idx) {
		return getSqlSession().selectList("community.tagList", community_idx);
	}
	
	// 글 작성
	@Override
	public int writeCommunity(CommunityDto community) throws Exception {
		getSqlSession().insert("community.writeCommunity", community);
		return community.getCommunity_idx();
	}
	@Override
	public int writeCommunityFile(CommunityFileDto file) throws Exception {
		return getSqlSession().insert("community.writeCommunityFile", file);
	}
	@Override
	public void writeFile(Map<String, Object> map) throws Exception {
		getSqlSession().insert("community.writeFile", map);
	}
	
	// 글 상세 보기
	@Override
	public CommunityDto readCommunity(int community_idx) throws Exception {
		return getSqlSession().selectOne("community.readCommunity", community_idx);
	}
	@Override
	public List<CommunityFileDto> readCommunityFile(int community_idx) throws Exception {
		return getSqlSession().selectList("community.readFile", community_idx);
	}
	@Override
	public List<TagDto> getTags(int board_idx) throws Exception {
		return getSqlSession().selectList("community.getTags", board_idx);
	}
	// 조회수 증가
	@Override
	public int hitCount(int community_idx) throws Exception {
		return getSqlSession().update("community.hitCount", community_idx);
	}
	
	// 글 수정
	@Override
	public int editCommunity(CommunityDto community) throws Exception {
		return getSqlSession().update("community.editCommunity", community);
	}
	
	// 글 삭제
	@Override
	public int deleteCommunity(int community_idx) {
		return getSqlSession().update("community.deleteCommunity", community_idx);
	}
	
	
	// 댓글 작성
	@Override
	public int writeComment(CommentDto comment) throws Exception {
		return getSqlSession().insert("community.writeComment", comment);
	}
	// 댓글 보기
	@Override
	public List<CommentDto> readComment(int community_idx) throws Exception {
		return getSqlSession().selectList("community.readComment", community_idx);
	}
	// 댓글 수정
	@Override
	public int editComment(CommentDto comment) throws Exception {
		return getSqlSession().update("community.editComment", comment);
	}
	// 댓글 삭제
	@Override
	public int deleteComment(int comment_idx) throws Exception {
		return getSqlSession().delete("community.deleteComment", comment_idx);
	}
	// 선택 댓글 보기
	@Override
	public CommentDto getComment(int comment_idx) throws Exception {
		return getSqlSession().selectOne("community.getComment", comment_idx);
	}

}
