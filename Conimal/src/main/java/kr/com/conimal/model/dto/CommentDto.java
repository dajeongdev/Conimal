package kr.com.conimal.model.dto;

public class CommentDto {
	private int comment_idx;
	private int community_idx; // 커뮤니티 글번호
	private int user_idx; // 회원 번호 
	private String content; // 내용 
	private int parent_comment_idx; // 상위 댓글 번호 
	private int depth; // 답글 단계 
	private String reg_date;
	private char del_yn; // default 'N'
	
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getCommunity_idx() {
		return community_idx;
	}
	public void setCommunity_idx(int community_idx) {
		this.community_idx = community_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getParent_comment_idx() {
		return parent_comment_idx;
	}
	public void setParent_comment_idx(int parent_comment_idx) {
		this.parent_comment_idx = parent_comment_idx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	
}
