package kr.com.conimal.controller;

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
	public ModelAndView listing(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("커뮤니티 메인 페이지 이동");
		//SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//UserDto info = session.getUserDto();
		//mav.addObject("info", info);
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
		System.out.println("CommunityController writePage() 이동");
		return mav;
	}
	@RequestMapping(value = "/community/community-write-form", method = RequestMethod.POST)
	public String writeCommunity(CommunityDto community, CommunityFileDto file, int[] rdTag, MultipartHttpServletRequest request) throws Exception {
		SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//community.setUser_idx(session.getUserDto().getUser_idx());
		
		int i = cs.writeCommunity(community, request);
		int community_idx = community.getCommunity_idx();
		ts.writeUsedTag(community.getUser_idx(), "c", community_idx, rdTag);
		
		return "/community/community-list";
	}
	// 태그
	@RequestMapping(value = "/community-write-form/checkTag", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkTag(HttpServletRequest request, @RequestParam String tag_name) {
		SessionCommand session = (SessionCommand) request.getSession().getAttribute("session");
		//int user_idx = session.getUserDto().getUser_idx();
		System.out.println("CommunityController checkTag start");
		TagDto tag = ts.checkTag(tag_name);
		
		/*if((tag = tagDao.getTag(tag_name)) == null) {
			tag = new TagDto();
			tag.setTag_name(tag_name);
			ts.writeTag(tag_name);
		} else {
			return tag.getTag_name();
		}*/
		if(tag != null) {
			System.out.println("CommunityController checkTag tag_idx : " + tag.getTag_idx());
			System.out.println("CommunityController checkTag tag_name : " + tag.getTag_name());
		}
		
		Gson json = new Gson();
		System.out.println("CommunityController checkTag() 호출");
		return json.toJson(tag);
	}


}
