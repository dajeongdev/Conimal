package kr.com.conimal.model.dto;

public class BoardUsedTagDto {
	private int board_used_tag_idx; 
	private int board_idx; // 글 번호
	private String user_idx; // 회원 번호
	private int tag_idx; // 태그 번호 
	private String board_type; // 게시판 타입 
	
	private CommunityDto community;
	private TagDto tag;
	
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
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
	public CommunityDto getCommunity() {
		return community;
	}
	public void setCommunity(CommunityDto community) {
		this.community = community;
	}
	public TagDto getTag() {
		return tag;
	}
	public void setTag(TagDto tag) {
		this.tag = tag;
	}
	
}
