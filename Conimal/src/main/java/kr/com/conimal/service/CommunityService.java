package kr.com.conimal.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.FileDto;

public interface CommunityService {
	
	// 글 목록
	public List<BoardDto> findBoardAll(PagingCommand page);
	public int findBoardCount() throws Exception;
	
	// 글 작성 
	public Long saveBoard(BoardDto board) throws Exception;
	public void saveFile(Long board_id, MultipartHttpServletRequest request) throws Exception;
	
	// 글 보기 
	public BoardDto findBoard(Long board_id) throws Exception;
	public List<FileDto> findFile(Long board_id) throws Exception;
	// 댓글 보기 
	public List<CommentDto> findCommentAll(Long board_id) throws Exception;
	
	// 글 수정
	public int updateBoard(BoardDto board) throws Exception;
	// 파일 수정 
	// public int updateFile(FileDto file) throws Exception;
	
	// 글 삭제
	public int deleteBoard(Long board_id) throws Exception;
	// 파일 삭제 
	public int deleteFile(Long board_id) throws Exception;

	// 댓글 작성 
	public int saveComment(CommentDto comment) throws Exception;
	// 댓글 수정
	public int updateComment(CommentDto comment) throws Exception;
	// 댓글 삭제
	public int deleteComment(Long comment_id) throws Exception;
	// 선택 댓글 보기
	//public CommentDto findComment(Long comment_id) throws Exception;

	
	// 좋아요 수 증가
	
	// 검색 
	
	// 10개씩 보기
	
	// 페이징
		
}
