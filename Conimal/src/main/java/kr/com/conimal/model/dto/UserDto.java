package kr.com.conimal.model.dto;

import java.util.Date;

public class UserDto {
	private int user_idx;
	private String user_id;
	private String password;
	private String nickname;
	private String email; 
	private int level; // 0: 관리자, 1: 일반회원 
	private int badge_idx; // 기본 뱃지 필요 
	private Date reg_date;
	private Date update_date;
	private int last_login; // default 'Y'
	private char del_yn; // default 'N'
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getBadge_idx() {
		return badge_idx;
	}
	public void setBadge_idx(int badge_idx) {
		this.badge_idx = badge_idx;
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
	public int getLast_login() {
		return last_login;
	}
	public void setLast_login(int last_login) {
		this.last_login = last_login;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	
}
