package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;

public interface CommunityDao {
	// 인기 태그 리스트
	public List<TagDto> getHitTagList();
	
	// 글 목록
	public List<Map<String, Object>> list(PagingCommand page);
	public int getCount();
	public List<TagDto> tagList(int community_idx);
	
	// 글 작성 
	public int writeCommunity(CommunityDto community) throws Exception;
	public int writeCommunityFile(CommunityFileDto file) throws Exception;
	public void writeFile(Map<String, Object> map) throws Exception;
	
	// 글 보기 
	public CommunityDto readCommunity(int community_idx) throws Exception;
	public List<CommunityFileDto> readCommunityFile(int community_idx) throws Exception;
	public List<TagDto> getTags(int board_idx) throws Exception;
	// 조회수 증가 
	public int hitCount(int community_idx) throws Exception;
	// 글 수정
	public int editCommunity(CommunityDto community) throws Exception;
	// 파일 수정 
	// 글 삭제
	public int deleteCommunity(int community_idx) throws Exception;
	// 파일 삭제 

	// 댓글 작성 
	public int writeComment(CommentDto comment) throws Exception;
	// 댓글 보기 
	public List<CommentDto> readComment(int community_idx) throws Exception;
	// 댓글 수정
	public int editComment(CommentDto comment) throws Exception;
	// 댓글 삭제
	public int deleteComment(int comment_idx) throws Exception;
	// 선택 댓글 보기
	public CommentDto getComment(int comment_idx) throws Exception;
	
	
	// 좋아요 수 증가
	
	// 검색 
	
	// 10개씩 보기
	
	// 페이징
	
	
}
