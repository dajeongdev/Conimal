package kr.com.conimal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.com.conimal.model.command.SessionCommand;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;
import kr.com.conimal.model.dto.UserDto;
import kr.com.conimal.service.CommunityService;
import kr.com.conimal.service.TagService;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService comService;
	
	@Autowired
	TagService tagService;

	// 커뮤니티 메인 페이지
	@RequestMapping(value = "/community/community-list")
	public ModelAndView listing(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("커뮤니티 메인 페이지 이동");
		mav.setViewName("/community/community-list");
		return mav;
	}
	
	// 커뮤니티 글 작성
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.GET)
	public ModelAndView writePage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//UserDto info = session.getUserDto();
		//mav.addObject("info", info);
		return mav;
	}
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.POST)
	public String writeCommunity(CommunityDto community, CommunityFileDto file, int[] tags, MultipartHttpServletRequest request) {
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//community.setUser_idx(session.getUserDto().getUser_idx());
		
		int i = comService.writeCommunity(community, request);
		int community_idx = community.getCommunity_idx();
		tagService.writeUsedTag("c", community_idx, tags);
		
		return "/community/community-form";
	}
	
	// 태그
	@RequestMapping(value = "/community-write-form/checkTag", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkTag(HttpServletRequest request, String tag_name) {
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//int user_idx = session.getUserDto().getUser_idx();
		
		//TagDto tag = tagService.checkTag(tag_name, user_idx);
		Gson json = new Gson();
		return json.toJson(tag);
	}
	@RequestMapping(value = "/community-write-form/writeTag", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String writeTag(HttpServletRequest request, String tag_name, int board_idx) {
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//int user_idx = session.getUserDto().getUser_idx();
		
		TagDto tag = new TagDto();
		tag.setTag_name(tag_name);
		//tagService.writeTag(tag_name, user_idx);
		Gson json = new Gson();
		return json.toJson(tag);
	}

}
