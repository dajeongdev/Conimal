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

@Service("CommunityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao dao;
	
	@Autowired
	FileUploadService fileService;

	@Override
	public List<CommunityDto> getListing(PagingCommand paging) {
		return dao.getListing(paging);
	}

	@Override
	public List<CommunityDto> getPaging(Map<String, Integer> map) {
		return dao.getPaging(map);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public List<CommunityFileDto> fileListing() {
		return dao.getFileListing();
	}

	@Override
	public int writeCommunity(CommunityDto community, MultipartHttpServletRequest request) {
		community.setReg_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
		int i = dao.writeCommunity(community);
		int d = community.getCommunity_idx();
		if(d > 0) {
			writeCommunityFile(d, request);
		}
		return i;
	}
	
	@Override
	public void writeCommunityFile(int community_idx, MultipartHttpServletRequest request) {
		List<FileUploadCommand> files = fileService.upload(request, "/img/community");
		
		for(FileUploadCommand file : files) {
			CommunityFileDto dto = new CommunityFileDto();
			dto.setCommunity_idx(community_idx);
			dto.setFile_name(file.getFile_name());
			dto.setFile_path(file.getFile_path());
			dto.setFile_size(file.getFile_size());
			
			dao.writeCommunityFile(dto);
		}
	}

	@Override
	public int writeComment(CommentDto comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommunityDto readCommunity(int community_idx) {
		return dao.readCommunity(community_idx);
	}

	@Override
	public List<CommunityFileDto> readCommunityFile(int community_idx) {
		return dao.readCommunityFile(community_idx);
	}

	@Override
	public List<TagDto> readTag(int community_idx) {
		return null;
	}

	@Override
	public List<CommentDto> readComment(int community_idx) {
		return dao.readComment(community_idx);
	}

	@Override
	public CommentDto readCommentIdx(int comment_idx) {
		return dao.readCommentIdx(comment_idx);
	}

	@Override
	public int hitCount(int community_idx) {
		return dao.hitCount(community_idx);
	}

	@Override
	public int editCommunity(CommunityDto community) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editComment(CommentDto comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommunity(int community_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int comment_idx) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
