package kr.com.conimal.model.dto;

public class ConimalDto {
	private int conimal_idx;
	private String user_idx; // 회원 번호 
	private String name; // 이름 	
	private String birth; // 생일
	private String type; // 타입 
	private String sex; // 성별
	private String conimal_image; // 코니멀 이미지 
	private String image_path; // 이미지 경로 
	private Long image_isze; // 이미지 사이즈 
	private String reg_date; // 등록일
	private String update_date; // 수정일
	
	public int getConimal_idx() {
		return conimal_idx;
	}
	public void setConimal_idx(int conimal_idx) {
		this.conimal_idx = conimal_idx;
	}
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getConimal_image() {
		return conimal_image;
	}
	public void setConimal_image(String conimal_image) {
		this.conimal_image = conimal_image;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public Long getImage_isze() {
		return image_isze;
	}
	public void setImage_isze(Long image_isze) {
		this.image_isze = image_isze;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
}
