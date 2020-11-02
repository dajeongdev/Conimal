package kr.com.conimal.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.com.conimal.dao.TagDao;
import kr.com.conimal.model.command.PageMakerCommand;
import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.command.SessionCommand;
import kr.com.conimal.model.dto.BoardUsedTagDto;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;
import kr.com.conimal.model.dto.UserDto;
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

	// 메인(목록) 페이지
	@RequestMapping(value = "/community/community-list")
	public ModelAndView listing(CommunityDto dto, HttpServletRequest request, PagingCommand page) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		List<TagDto> hitTagList = cs.getHitTagList();

		PageMakerCommand pageMaker = new PageMakerCommand();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(cs.getCount());
		List<Map<String, Object>> list = cs.list(page);
		
		List<TagDto> tagList = cs.getTags(dto.getCommunity_idx()); // *글번호마다 태그 가져오기
		
		mav.addObject("hitTagList", hitTagList);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("tags", tagList);
		
		mav.setViewName("/community/community-list");
		return mav;
	}
	
	// 글 작성
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.GET)
	public ModelAndView writePage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.getAttribute("user");

		return mav;
	}
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.POST)
	public String writeCommunity(CommunityDto community, CommunityFileDto file, int[] rdTag, MultipartHttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("user");

		cs.writeCommunity(community);
		int community_idx = community.getCommunity_idx();
		
		if(file != null) {
			System.out.println(file);
			cs.writeCommunityFile(community_idx, request);
		}
		
		ts.writeUsedTag(community.getUser_idx(), "C", community_idx, rdTag);
		
		return "/community/community-list";
	}
	// 태그
	@RequestMapping(value = "/community-write-form/checkTag", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkTag(HttpServletRequest request, @RequestParam String tag_name) {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		TagDto tag = ts.checkTag(tag_name);
		
		System.out.println(tag_name);
		Gson json = new Gson();
		return json.toJson(tag);
	}
	
	// 상세 보기
	@RequestMapping(value = "/community/community-detail", method = RequestMethod.GET)
	public ModelAndView community(int community_idx, String tag_name, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		
		CommunityDto dto = cs.readCommunity(community_idx);
		List<CommunityFileDto> fileDto = cs.readCommunityFile(community_idx);
		community_idx = dto.getCommunity_idx();
		List<TagDto> tags = cs.getTags(community_idx);
		List<CommentDto> comments = cs.readComment(community_idx);
		cs.hitCount(community_idx);
		
		mav.addObject("community", dto);
		mav.addObject("file", fileDto);
		mav.addObject("tags", tags);
		mav.addObject("comments", comments);
		mav.setViewName("/community/community-detail");
		return mav;
	}
	
	// 댓글 작성
	@RequestMapping(value = "/community/writeCom", method = RequestMethod.POST)
	public String writeCom(HttpServletRequest request, CommentDto comment) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("user");

		cs.writeComment(comment);
		int idx = comment.getCommunity_idx();
		
		return "redirect:/community/community-detail?community_idx=" + idx;
	}
	// 댓글 수정
	@RequestMapping(value = "/community/updateCom", method = RequestMethod.GET)
	public ModelAndView updateCom(HttpServletRequest request, CommentDto comment, int community_idx) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView();
		CommunityDto community = cs.readCommunity(community_idx);
		List<CommentDto> com = cs.readComment(comment.getComment_idx());
		
		mav.addObject("community_idx", community.getCommunity_idx());
		mav.addObject("comment", com);
		mav.setViewName("/community/communtiy-detail?community_idx=" + community_idx);
		return mav;
	}
	// 댓글 삭제
	@RequestMapping(value = "/community/deleteCom", method = RequestMethod.GET)
	public String deleteCom(HttpServletRequest request, CommentDto comment) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("user");
		
		int community_idx = comment.getCommunity_idx();
		cs.deleteComment(comment.getComment_idx());
		
		return "redirect:/community/communtiy-detail?community_idx=" + community_idx;
	}

}
