package kr.com.conimal.dao;

import java.util.List;
import java.util.Map;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;

public interface CommunityDao {
	// 인기 태그 리스트
	
	// 전체 글 목록 
	public List<CommunityDto> getListing(PagingCommand paging);
	public List<CommunityDto> getPaging(Map<String, Integer> map);
	public int getTotal();
	public List<CommunityFileDto> getFileListing();
	
	// 글 작성 
	public int writeCommunity(CommunityDto community);
	public int writeCommunityFile(CommunityFileDto file);
	
	// 댓글 작성 
	public int writeComment(CommentDto comment);
	
	// 글 보기 
	public CommunityDto readCommunity(int community_idx);
	public List<CommunityFileDto> readCommunityFile(int community_idx);
	
	// 댓글 보기 
	public List<CommentDto> readComment(int community_idx);
	public CommentDto readCommentIdx(int comment_idx);
	
	// 조회수 증가 
	public int hitCount(int community_idx);
	
	// 글 수정
	public int editCommunity(CommunityDto community);
	// 파일 수정 
	// 댓글 수정
	public int editComment(CommentDto comment);
	
	// 글 삭제
	public int deleteCommunity(int community_idx);
	// 파일 삭제 
	// 댓글 삭제
	public int deleteComment(int comment_idx);
	
	// 좋아요 수 증가
	
	// 검색 
	
	// 10개씩 보기
	
	// 페이징
	
	
}
