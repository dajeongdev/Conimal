package kr.com.conimal.service;

import java.util.List;

import kr.com.conimal.model.dto.CommentDto;

public interface CommentService {
	
	/* 댓글 목록 보기 */
	public List<CommentDto> findCommentAll(Long board_id) throws Exception;
	
	/* 선택 댓글 가져오기 */
	public CommentDto findByCommentId(Long comment_id) throws Exception;
	
	/* 댓글 작성 */
	public int saveComment(CommentDto comment) throws Exception;
	
	/* 댓글 수정 */
	public int updateComment(CommentDto comment) throws Exception;
	
	/* 댓글 삭제 */
	public int deleteComment(Long comment_id) throws Exception;
	
}
