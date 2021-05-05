package kr.com.conimal.model.dto;

public class BoardTagDto {
	
	private Long board_tag_id;
	private Long board_id;
	private Long tag_id;
	
	public Long getBoard_tag_id() {
		return board_tag_id;
	}
	public void setBoard_tag_id(Long board_tag_id) {
		this.board_tag_id = board_tag_id;
	}
	public Long getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Long board_id) {
		this.board_id = board_id;
	}
	public Long getTag_id() {
		return tag_id;
	}
	public void setTag_id(Long tag_id) {
		this.tag_id = tag_id;
	}
}
