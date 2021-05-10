package kr.com.conimal.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.conimal.dao.CommentDao;
import kr.com.conimal.model.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDao dao;
	
	// 댓글 목록 보기
	@Override
	public List<CommentDto> findCommentAll(Long board_id) throws Exception {
		return dao.findCommentAll(board_id);
	}
	
	// 선택 댓글 가져오기
	@Override
	public CommentDto findByCommentId(Long comment_id) throws Exception {
		return dao.findByCommentId(comment_id);
	}
	
	// 댓글 작성
	@Override
	public int saveComment(CommentDto comment) throws Exception {
		comment.setCreate_date(LocalDate.now());
		comment.setUpdate_date(LocalDate.now());
		return dao.saveComment(comment);
	}
	
	// 댓글 수정
	@Override
	public int updateComment(CommentDto comment) throws Exception {
		comment.setUpdate_date(LocalDate.now());
		return dao.updateComment(comment);
	}
	
	// 댓글 삭제
	@Override
	public int deleteComment(Long comment_id) throws Exception {
		System.out.println("CommentService deleteComment");
		return dao.deleteComment(comment_id);
	}

}
