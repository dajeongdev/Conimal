package kr.com.conimal.model.dto;

public class BoardUsedTagDto {
	private int board_used_tag_idx; 
	private int board_idx; // 글 번호 
	private int tag_idx; // 태그 번호 
	private String board_type; // 게시판 타입 
	
	public int getBoard_used_tag_idx() {
		return board_used_tag_idx;
	}
	public void setBoard_used_tag_idx(int board_used_tag_idx) {
		this.board_used_tag_idx = board_used_tag_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getTag_idx() {
		return tag_idx;
	}
	public void setTag_idx(int tag_idx) {
		this.tag_idx = tag_idx;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	
}
