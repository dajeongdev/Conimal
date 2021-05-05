package kr.com.conimal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.BoardDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.FileDto;
import kr.com.conimal.service.CommunityService;
import kr.com.conimal.service.TagService;
import kr.com.conimal.service.UserService;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cs;
	
	@Autowired
	TagService ts;
	
	@Autowired
	UserService us;

	// 게시판 목록
	@RequestMapping(value = "/community/community-list")
	public ModelAndView boardList(BoardDto board, 
			@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int listCount = cs.findBoardCount();
		
		PagingCommand paging = new PagingCommand();
		paging.pageInfo(page, range, listCount);
		List<BoardDto> list = cs.findBoardAll(paging);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
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
	public String saveBoard(BoardDto board, FileDto file, MultipartHttpServletRequest request) throws Exception {

		Long board_id = cs.saveBoard(board);
		
		if(file != null) {
			System.out.println(file);
			cs.saveFile(board_id, request);
		}
		
		return "/community/community-list";
	}
	
	// 상세 보기
	@RequestMapping(value = "/community/community-detail", method = RequestMethod.GET)
	public ModelAndView community(Long board_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		BoardDto dto = cs.findBoard(board_id);
		List<FileDto> fileDto = cs.findFile(board_id);
		List<CommentDto> comments = cs.findCommentAll(board_id);
		cs.hitCount(board_id);
		
		mav.addObject("board", dto);
		mav.addObject("file", fileDto);
		mav.addObject("comments", comments);
		mav.setViewName("/community/community-detail");
		return mav;
	}
	
	
	// 글 수정
	
	
	// 글 삭제
	
	
	
	// 댓글 작성
	@RequestMapping(value = "/community/writeCom", method = RequestMethod.POST)
	public String writeCom(CommentDto comment) throws Exception {

		cs.saveComment(comment);
		Long board_id = comment.getBoard_id();
		
		return "redirect:/community/community-detail?board_id=" + board_id;
	}
	
	// 댓글 수정
	@RequestMapping(value = "/community/updateCom", method = RequestMethod.GET)
	public ModelAndView updateCom(CommentDto comment) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Long board_id = comment.getBoard_id();
		List<CommentDto> com = cs.findCommentAll(comment.getComment_id());
		
		mav.addObject("board_id", board_id);
		mav.addObject("commentList", com);
		mav.setViewName("/community/communtiy-detail?board_id=" + board_id);
		return mav;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/community/deleteCom", method = RequestMethod.GET)
	public String deleteCom(CommentDto comment) throws Exception {
		Long board_id = comment.getBoard_id();
		cs.deleteComment(comment.getComment_id());
		
		return "redirect:/community/communtiy-detail?board_id=" + board_id;
	}

}
