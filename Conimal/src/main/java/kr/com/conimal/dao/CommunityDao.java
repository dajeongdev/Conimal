package kr.com.conimal.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kr.com.conimal.model.command.SearchCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.FileDto;

public class CommunityDao extends SqlSessionDaoSupport {
	
	/* 글 목록 */
	public List<BoardDto> findBoardAll(SearchCommand search) {
		return getSqlSession().selectList("board.findBoardAll", search);
	}
	
	/* 글 갯수 조회 */
	public int findBoardCount(SearchCommand search) throws Exception {
		return getSqlSession().selectOne("board.findBoardCount", search);
	}
	
	/* 글 작성 */
	public int saveBoard(BoardDto board) throws Exception {
		return getSqlSession().insert("board.saveBoard", board);
	}
	
	/* 파일 저장 */
	public int saveFile(FileDto file) throws Exception {
		return getSqlSession().insert("board.saveFile", file);
	}
	
	/* 글 상세 보기 */
	public BoardDto findBoard(Long board_id) throws Exception {
		return getSqlSession().selectOne("board.findBoard", board_id);
	}
	
	/* 파일 가져오기 */
	public List<FileDto> findFile(Long board_id) throws Exception {
		return getSqlSession().selectList("board.findFile", board_id);
	}
	
	/* 조회수 증가 */
	public int hitCount(Long board_id) throws Exception {
		return getSqlSession().update("board.hitCount", board_id);
	}
	
	/* 글 수정 */
	public int updateBoard(BoardDto board) throws Exception {
		return getSqlSession().update("board.updateBoard", board);
	}
	
	/* 글 삭제 */
	public int deleteBoard(Long board_id) throws Exception {
		return getSqlSession().delete("board.deleteBoard", board_id);
	}
	
}