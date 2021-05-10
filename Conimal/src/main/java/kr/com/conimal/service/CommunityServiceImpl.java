package kr.com.conimal.service;

import java.time.LocalDate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.com.conimal.dao.CommunityDao;
import kr.com.conimal.model.command.FileUploadCommand;
import kr.com.conimal.model.command.SearchCommand;
import kr.com.conimal.model.dto.BoardDto;
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
	public List<BoardDto> findBoardAll(SearchCommand search) {
		return dao.findBoardAll(search);
	}
	@Override
	public int findBoardCount(SearchCommand search) throws Exception {
		return dao.findBoardCount(search);
	}

	// 글 작성
	@Override
	public Long saveBoard(BoardDto dto) throws Exception {
		BoardDto board = new BoardDto();
		if (dto.getTitle() != null) {
			board.setTitle(dto.getTitle());
		}
		if (dto.getUser_id() != null) {
			board.setUser_id(dto.getUser_id());
		}
		if (dto.getContents() != null) {
			board.setContents(dto.getContents());
		}
		board.setCreate_date(LocalDate.now());
		board.setUpdate_date(LocalDate.now());
		dao.saveBoard(board);
		return board.getBoard_id();
	}
	@Override
	public void saveFile(Long board_id, MultipartHttpServletRequest request) throws Exception {
		List<FileUploadCommand> files = fileService.uploadList(request, "/img/board/");
		
		for(FileUploadCommand file : files) {
			FileDto fileDto = new FileDto();
			fileDto.setBoard_id(board_id);
			fileDto.setFile_name(file.getFile_name());
			fileDto.setFile_path(file.getFile_path());
			fileDto.setCreate_date(LocalDate.now());
			
			System.out.println("BoardService fileDto : " + fileDto);
			dao.saveFile(fileDto);
		}
	}
	
	// 글 보기
	@Override
	public BoardDto findBoard(Long board_id) throws Exception {
		// 조회수 증가
		dao.hitCount(board_id);
		return dao.findBoard(board_id);
	}
	@Override
	public List<FileDto> findFile(Long board_id) throws Exception {
		return dao.findFile(board_id);
	}
	
	// 글 수정
	@Override
	public int updateBoard(BoardDto board) throws Exception {
		board.setUpdate_date(LocalDate.now());
		return dao.updateBoard(board);
	}
	
	// 글 삭제
	@Override
	public int deleteBoard(Long board_id) throws Exception {
		return dao.deleteBoard(board_id);
	}
	
}
