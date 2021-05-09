package kr.com.conimal.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.FileDto;

public class CommunityDaoImpl extends SqlSessionDaoSupport implements CommunityDao {
	
	// 글 목록
	@Override
	public List<BoardDto> findBoardAll(PagingCommand page) {
		return getSqlSession().selectList("board.findBoardAll", page);
	}
	@Override
	public int findBoardCount() throws Exception {
		return getSqlSession().selectOne("board.findBoardCount");
	}
	
	// 글 작성
	@Override
	public int saveBoard(BoardDto board) throws Exception {
		System.out.println("Dao user_id : " + board.getUser_id());
		return getSqlSession().insert("board.saveBoard", board);
	}
	@Override
	public int saveFile(FileDto file) throws Exception {
		System.out.println("Dao file_name : " + file.getFile_name());
		return getSqlSession().insert("board.saveFile", file);
	}
	
	// 글 상세 보기
	@Override
	public BoardDto findBoard(Long board_id) throws Exception {
		return getSqlSession().selectOne("board.findBoard", board_id);
	}
	@Override
	public List<FileDto> findFile(Long board_id) throws Exception {
		return getSqlSession().selectList("board.findFile", board_id);
	}
	@Override
	public int hitCount(Long board_id) throws Exception {
		return getSqlSession().update("board.hitCount", board_id);
	}
	@Override
	public List<CommentDto> findCommentAll(Long board_id) throws Exception {
		return getSqlSession().selectList("board.findCommentAll", board_id);
	}
	
	// 글 수정
	@Override
	public int updateBoard(BoardDto board) throws Exception {
		return getSqlSession().update("board.updateBoard", board);
	}
	
	// 글 삭제
	@Override
	public int deleteBoard(Long board_id) throws Exception {
		return getSqlSession().delete("board.deleteBoard", board_id);
	}
	@Override
	public int deleteFile(Long board_id) throws Exception {
		return getSqlSession().delete("board.deleteFile", board_id);
	}
	
	// 댓글 작성
	@Override
	public int saveComment(CommentDto comment) throws Exception {
		return getSqlSession().insert("board.saveComment", comment);
	}
	// 댓글 수정
	@Override
	public int updateComment(CommentDto comment) throws Exception {
		return getSqlSession().update("board.updateComment", comment);
	}
	// 댓글 삭제
	@Override
	public int deleteComment(Long comment_id) throws Exception {
		return getSqlSession().delete("board.deleteComment", comment_id);
	}
	
}