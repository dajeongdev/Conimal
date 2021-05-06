package kr.com.conimal.model.dto;

import java.time.LocalDate;

public class BoardDto {
	
	private Long board_id; // 게시글 번호
	private Long user_id; // 회원 번호 
	private String title; // 제목 
	private String contents; // 내용 
	private int hit; // 조회수 
	private char show_yn; // default 'Y'
	private LocalDate create_date; // 등록일
	private LocalDate update_date; // 수정일
	
	private UserDto user;
	
	public Long getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Long board_id) {
		this.board_id = board_id;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public char getShow_yn() {
		return show_yn;
	}
	public void setShow_yn(char show_yn) {
		this.show_yn = show_yn;
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
	public UserDto getUser() {
		return user;
	}
	public void setUser(UserDto user) {
		this.user = user;
	}
}
