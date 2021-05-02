package kr.com.conimal.model.command;

import java.util.List;

import kr.com.conimal.model.dto.CommunityDto;
import kr.com.conimal.model.dto.CommunityFileDto;

public class CommunityCommand {
	private CommunityDto community;
	private List<CommunityFileDto> file;
	
	public CommunityDto getCommunity() {
		return community;
	}
	public void setCommunity(CommunityDto community) {
		this.community = community;
	}
	public List<CommunityFileDto> getFile() {
		return file;
	}
	public void setFile(List<CommunityFileDto> file) {
		this.file = file;
	}
	
}
