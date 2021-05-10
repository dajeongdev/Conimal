package kr.com.conimal.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.dto.CommentDto;

public class CommentDao extends SqlSessionDaoSupport {
	
	// 댓글 목록
	public List<CommentDto> findCommentAll(Long board_id) throws Exception {
		return getSqlSession().selectList("comment.findCommentAll", board_id);
	}
	
	// 선택 댓글 가져오기
	public CommentDto findByCommentId(Long comment_id) throws Exception {
		return getSqlSession().selectOne("comment.findByCommentId", comment_id);
	}
	
	// 댓글 작성
	public int saveComment(CommentDto comment) throws Exception {
		return getSqlSession().insert("comment.saveComment", comment);
	}
	
	// 댓글 수정
	public int updateComment(CommentDto comment) throws Exception {
		return getSqlSession().update("comment.updateComment", comment);
	}
	
	// 댓글 삭제
	public int deleteComment(Long comment_id) throws Exception {
		System.out.println("CommentDao deleteComment");
		return getSqlSession().delete("comment.deleteComment", comment_id);
	}
}
