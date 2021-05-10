package kr.com.conimal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.command.SearchCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.FileDto;
import kr.com.conimal.service.CommentService;
import kr.com.conimal.service.CommunityService;
import kr.com.conimal.service.TagService;
import kr.com.conimal.service.UserService;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cs;
	
	@Autowired
	CommentService ms;
	
	@Autowired
	UserService us;

	// 게시판 목록
	@RequestMapping(value = "/community/community-list", method = RequestMethod.GET)
	public ModelAndView boardList(
			@RequestParam(value="page", required = false, defaultValue = "1") int page,
			@RequestParam(value="range", required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") SearchCommand search) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCount = cs.findBoardCount(search);
		
		// 검색 및 페이징
		search.pageInfo(page, range, listCount);
		
		List<BoardDto> list = cs.findBoardAll(search);
		
		mav.addObject("list", list);
		mav.addObject("paging", search);
		mav.addObject("search", search);
		mav.setViewName("/community/community-list");
		return mav;
	}
	
	// 글 작성
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.GET)
	public ModelAndView savePage() {
		ModelAndView mav = new ModelAndView("/community/community-write-form");
		return mav;
	}
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.POST)
	public String saveBoard(Long user_id, BoardDto board, MultipartHttpServletRequest request) throws Exception {

		Long board_id = cs.saveBoard(board);
		
		if(request.getFileNames().hasNext()) {
			System.out.println("Board has file : " + request.getFileNames().toString());
			cs.saveFile(board_id, request);
		}
		
		return "redirect:/community/community-list";
	}
	
	// 상세 보기
	@RequestMapping(value = "/community/community-detail", method = RequestMethod.GET)
	public ModelAndView community(Long board_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		BoardDto dto = cs.findBoard(board_id);
		List<FileDto> fileDto = cs.findFile(board_id);
		List<CommentDto> comments = ms.findCommentAll(board_id);
		
		mav.addObject("board", dto);
		mav.addObject("file", fileDto);
		mav.addObject("comments", comments);
		mav.setViewName("/community/community-detail");
		return mav;
	}
	
	
	// 글 수정
	@RequestMapping(value = "/community/community-update", method = RequestMethod.GET)
	public ModelAndView updatePage(Long board_id) throws Exception {
		ModelAndView mav = new ModelAndView("/community/community-update");
		
		BoardDto dto = cs.findBoard(board_id);
		List<FileDto> fileDto = cs.findFile(board_id);

		mav.addObject("board", dto);
		mav.addObject("file", fileDto);
		return mav;
	}
	@RequestMapping(value = "/community/update", method = RequestMethod.POST)
	public String updateBoard(BoardDto board, MultipartHttpServletRequest request) throws Exception {

		cs.updateBoard(board);
		Long board_id = board.getBoard_id();
		
		if(request.getFile("file").getSize() != 0) {
			if(request.getFileNames().hasNext()) {
				cs.saveFile(board_id, request);
			}
		}
		
		return "redirect:/community/community-detail?board_id=" + board_id;
	}
	
	// 글 삭제
	@RequestMapping(value = "/community/board-delete")
	public String deleteBoard(Long board_id) throws Exception {

		cs.deleteBoard(board_id);
		
		return "redirect:/community/community-list";
	}
	
	
	// 댓글 작성
	@RequestMapping(value = "/community/writeCom", method = RequestMethod.POST)
	public String writeCom(CommentDto comment) throws Exception {

		ms.saveComment(comment);
		Long board_id = comment.getBoard_id();
		
		return "redirect:/community/community-detail?board_id=" + board_id;
	}
	
	// 댓글 수정
	@RequestMapping(value = "/community/updateCom", method = RequestMethod.POST)
	public String updateCom(CommentDto comment) throws Exception {
		
		Long board_id = comment.getBoard_id();
		
		ms.updateComment(comment);

		return "/community/communtiy-detail?board_id=" + board_id;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/community/deleteCom")
	public ModelAndView deleteCom(Long comment_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		CommentDto dto = ms.findByCommentId(comment_id);
		Long board_id = dto.getBoard_id();
		
		ms.deleteComment(comment_id);
		
		mav.setViewName("redirect:/community/community-detail?board_id=" + board_id);
		return mav;
	}

}
