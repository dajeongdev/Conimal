package kr.com.conimal.model.dto;

import java.util.Date;

public class BadgeDto {
	private int badge_idx; // 배지 번호 
	private String badge_name; // 배지 이름 
	private String badge_path; // 배지 경로 
	private int badge_size; // 배지 사이즈 
	private Date reg_date;
	
	public int getBadge_idx() {
		return badge_idx;
	}
	public void setBadge_idx(int badge_idx) {
		this.badge_idx = badge_idx;
	}
	public String getBadge_name() {
		return badge_name;
	}
	public void setBadge_name(String badge_name) {
		this.badge_name = badge_name;
	}
	public String getBadge_path() {
		return badge_path;
	}
	public void setBadge_path(String badge_path) {
		this.badge_path = badge_path;
	}
	public int getBadge_size() {
		return badge_size;
	}
	public void setBadge_size(int badge_size) {
		this.badge_size = badge_size;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
