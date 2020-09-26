package kr.com.conimal.model.dto;

import java.util.Date;

public class CommunityFileDto {
	private int community_file_idx;
	private int community_idx; // 글 번호 
	private String file_name; // 파일 이름 
	private String file_path; // 파일 경로 
	private Long file_size; // 파일 사이즈 
	private Date reg_date;
	private Date update_date;
	
	public int getCommunity_file_idx() {
		return community_file_idx;
	}
	public void setCommunity_file_idx(int community_file_idx) {
		this.community_file_idx = community_file_idx;
	}
	public int getCommunity_idx() {
		return community_idx;
	}
	public void setCommunity_idx(int community_idx) {
		this.community_idx = community_idx;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Long getFile_size() {
		return file_size;
	}
	public void setFile_size(Long file_size) {
		this.file_size = file_size;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
}
