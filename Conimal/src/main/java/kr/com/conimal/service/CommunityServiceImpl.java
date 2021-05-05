package kr.com.conimal.service;

import java.time.LocalDate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.com.conimal.dao.CommunityDao;
import kr.com.conimal.model.command.FileUploadCommand;
import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.FileDto;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao dao;
	
	BoardDto dto;
	
	@Autowired
	FileUploadService fileService;
	
	// 글 목록
	@Override
	public List<BoardDto> findBoardAll(PagingCommand page) {
		return dao.findBoardAll(page);
	}
	@Override
	public int findBoardCount() throws Exception {
		return dao.findBoardCount();
	}

	
	// 글 작성
	@Override
	public Long saveBoard(BoardDto dto) throws Exception {
		BoardDto board = new BoardDto();
		board.setCreate_date(LocalDate.now());
		board.setUpdate_date(LocalDate.now());
		dao.saveBoard(board);
		return board.getBoard_id();
	}
	
	public BoardDto requesting(MultipartHttpServletRequest request) {
		BoardDto dto = new BoardDto();
		
		if(request.getParameter("board_id") != null && request.getParameter("board_id") == "") {
			dto.setBoard_id(Long.parseLong(request.getParameter("board_id")));
		}
		Long board_id = (Long) request.getSession().getAttribute("board_id");
		if(board_id != null) {
			dto.setBoard_id(board_id);
		}
		dto.setContents(request.getParameter("contents"));
		dto.setTitle(request.getParameter("title"));
		dto.setCreate_date(LocalDate.now());
		dto.setUpdate_date(LocalDate.now());
		return dto;
	}
	@Override
	public void saveFile(Long board_id, MultipartHttpServletRequest request) throws Exception {
		List<FileUploadCommand> files = fileService.upload(request, "/img/board/");
		
		for(FileUploadCommand file : files) {
			FileDto filedto = new FileDto();
			filedto.setBoard_id(board_id);
			filedto.setFile_name(file.getFile_name());
			filedto.setFile_path(file.getFile_path());
			filedto.setCreate_date(LocalDate.now());
			
			dao.saveFile(filedto);
		}
	}
	
	// 글 보기
	@Override
	public BoardDto findBoard(Long board_id) throws Exception {
		return dao.findBoard(board_id);
	}
	@Override
	public List<FileDto> findFile(Long board_id) throws Exception {
		return dao.findFile(board_id);
	}
	// 조회수 증가 
	@Override
	public int hitCount(Long board_id) throws Exception {
		return dao.hitCount(board_id);
	}
	// 댓글 목록 보기
	@Override
	public List<CommentDto> findCommentAll(Long board_id) throws Exception {
		return dao.findCommentAll(board_id);
	}
	
	// 글 수정
	@Override
	public int updateBoard(BoardDto board) throws Exception {
		return dao.updateBoard(board);
	}
	
	// 글 삭제
	@Override
	public int deleteBoard(Long board_id) throws Exception {
		return dao.deleteBoard(board_id);
	}
	// 파일 삭제
	@Override
	public int deleteFile(Long board_id) throws Exception {
		return dao.deleteFile(board_id);
	}
	
	// 댓글 작성
	@Override
	public int saveComment(CommentDto comment) throws Exception {
		return dao.saveComment(comment);
	}
	// 댓글 수정
	@Override
	public int updateComment(CommentDto comment) throws Exception {
		return dao.updateComment(comment);
	}
	// 댓글 삭제
	@Override
	public int deleteComment(Long comment_id) throws Exception {
		return dao.deleteComment(comment_id);
	}

}
