package kr.com.conimal.service;

import java.time.LocalDateTime;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.com.conimal.dao.CommunityDao;
import kr.com.conimal.model.command.FileUploadCommand;
import kr.com.conimal.model.command.PagingCommand;
import kr.com.conimal.model.dto.CommentDto;
import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;
import kr.com.conimal.model.dto.TagDto;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao dao;
	
	CommunityDto dto;
	
	@Autowired
	FileUploadService fileService;
	
	// 인기 태그 목록
	@Override
	public List<TagDto> getHitTagList() {
		return dao.getHitTagList();
	}
	
	// 글 목록
	@Override
	public List<Map<String, Object>> list(PagingCommand page) {
		return dao.list(page);
	}
	@Override
	public int getCount() {
		return dao.getCount();
	}
	@Override
	public List<TagDto> tagList(int community_idx) {
		return dao.tagList(community_idx);
	}

	
	// 글 작성
	@Override
	public int writeCommunity(CommunityDto community) throws Exception {
		community.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")));
		int result = dao.writeCommunity(community);
		return result;
	}
	
	public CommunityDto requesting(MultipartHttpServletRequest request) {
		dto = new CommunityDto();
		
		if(request.getParameter("community_idx") != null && request.getParameter("community_idx") == "") {
			dto.setCommunity_idx(Integer.parseInt(request.getParameter("community_idx")));
		}
		Integer community_idx = (Integer) request.getSession().getAttribute("community_idx");
		if(community_idx != null) {
			dto.setCommunity_idx(community_idx);
		}
		dto.setContent(request.getParameter("content"));
		dto.setTitle(request.getParameter("title"));
		dto.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")));
		return dto;
	}
	
	@Override
	public void writeCommunityFile(int community_idx, MultipartHttpServletRequest request) throws Exception {
		List<FileUploadCommand> files = fileService.upload(request, "/img/community/");
		
		for(FileUploadCommand file : files) {
			CommunityFileDto filedto = new CommunityFileDto();
			filedto.setCommunity_idx(community_idx);
			filedto.setFile_name(file.getFile_name());
			filedto.setFile_path(file.getFile_path());
			filedto.setFile_size(file.getFile_size());
			filedto.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss")));
			
			dao.writeCommunityFile(filedto);
		}
	}

	// 글 상세 보기
	@Override
	public CommunityDto readCommunity(int community_idx) throws Exception {
		return dao.readCommunity(community_idx);
	}
	@Override
	public List<CommunityFileDto> readCommunityFile(int community_idx) throws Exception {
		return dao.readCommunityFile(community_idx);
	}
	@Override
	public List<TagDto> getTags(int community_idx) throws Exception {
		return dao.getTags(community_idx);
	}
	// 조회수 증가
	@Override
	public int hitCount(int community_idx) throws Exception {
		return dao.hitCount(community_idx);
	}
	
	// 글 수정
	@Override
	public int editCommunity(CommunityDto community) throws Exception {
		return 0;
	}
	
	// 글 삭제
	@Override
	public int deleteCommunity(int community_idx) throws Exception {
		return dao.deleteCommunity(community_idx);
	}

	
	// 댓글 작성
	@Override
	public int writeComment(CommentDto comment) throws Exception {
		comment.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));
		return dao.writeComment(comment);
	}
	// 댓글 읽기
	@Override
	public List<CommentDto> readComment(int community_idx) throws Exception {
		return dao.readComment(community_idx);
	}
	// 댓글 수정
	@Override
	public int editComment(CommentDto comment) throws Exception {
		return dao.editComment(comment);
	}
	// 댓글 삭제
	@Override
	public int deleteComment(int comment_idx) throws Exception {
		return dao.deleteComment(comment_idx);
	}
	// 선택 댓글 보기
	public CommentDto getComment(int comment_idx) throws Exception {
		return dao.getComment(comment_idx);
	}
	
}
