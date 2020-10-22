package kr.com.conimal.controller;

import java.util.List;

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
import kr.com.conimal.model.command.SessionCommand;
import kr.com.conimal.model.dto.BoardUsedTagDto;
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
	TagDao tagDao;
	
	@Autowired
	UserService us;

	// 커뮤니티 메인(목록) 페이지
	@RequestMapping(value = "/community/community-list")
	public ModelAndView listing(CommunityDto dto, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.getAttribute("user");
		
		List<TagDto> hitTagList = cs.getHitTagList();
		List<CommunityDto> list = cs.list();
		List<TagDto> tagList = cs.tagList();
		
		mav.addObject("hitTagList", hitTagList);
		mav.addObject("community", list);
		mav.addObject("tags", tagList);
		
		mav.setViewName("/community/community-list");
		return mav;
	}
	
	// 커뮤니티 글 작성
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.GET)
	public ModelAndView writePage(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.getAttribute("user");
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//UserDto info = session.getUserDto();
		return mav;
	}
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.POST)
	public String writeCommunity(CommunityDto community, CommunityFileDto file, int[] rdTag, MultipartHttpServletRequest request, HttpSession session) throws Exception {
		session.getAttribute("user");
		
		int i = cs.writeCommunity(community, request);
		int community_idx = community.getCommunity_idx();
		ts.writeUsedTag(community.getUser_idx(), "c", community_idx, rdTag);
		System.out.println(community.getCommunity_idx());
		System.out.println(file.getFile_size());
		return "/community/community-list";
	}
	// 태그
	@RequestMapping(value = "/community-write-form/checkTag", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkTag(HttpServletRequest request, @RequestParam String tag_name) {
		SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//int user_idx = session.getUserDto().getUser_idx();
		TagDto tag = ts.checkTag(tag_name);
		
		Gson json = new Gson();
		return json.toJson(tag);
	}
	
	// 커뮤니티 상세 보기
	@RequestMapping(value = "/community/community-detail", method = RequestMethod.GET)
	public ModelAndView community(int community_idx, String tag_name, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		CommunityDto dto = cs.readCommunity(community_idx);
		List<CommunityFileDto> fileDto = cs.readCommunityFile(community_idx);
		community_idx = dto.getCommunity_idx();
		List<TagDto> tags = cs.getTags(community_idx);
		cs.hitCount(community_idx);
		
		mav.addObject("community", dto);
		mav.addObject("file", fileDto);
		mav.addObject("tags", tags);
		mav.setViewName("/community/community-detail");
		return mav;
	}

}
