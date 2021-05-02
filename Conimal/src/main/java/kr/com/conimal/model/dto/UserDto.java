package kr.com.conimal.model.dto;

import java.time.LocalDate;

public class UserDto {
	
	private Long user_id; // 회원 번호 
	private String id;  
	private String password;
	private String nickname;
	private String email; 
	private String user_key; // 이메일 인증키
	private String grade; // A: 관리자, D: 일반(default), B: 블랙리스트
	private LocalDate create_date; // 등록일
	private LocalDate update_date; // 수정일
	private LocalDate last_login; // 마지막 로그인 일자
	
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public LocalDate getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}
	public LocalDate getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(LocalDate update_date) {
		this.update_date = update_date;
	}
	public LocalDate getLast_login() {
		return last_login;
	}
	public void setLast_login(LocalDate last_login) {
		this.last_login = last_login;
	}
}
