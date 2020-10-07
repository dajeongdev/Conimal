package kr.com.conimal.model.dto;

import java.util.Date;

public class ConimalDto {
	private int conimal_idx;
	private int user_idx; // 회원 번호 
	private String name; // 이름 
	private String conimal_type; // 코니멀 타입 
	private String conimal_image; // 코니멀 이미지 
	private String image_path; // 이미지 경로 
	private int image_isze; // 이미지 사이즈 
	private int weight; // 몸무게 
	private String reg_date;
	private String update_date;
	
	public int getConimal_idx() {
		return conimal_idx;
	}
	public void setConimal_idx(int conimal_idx) {
		this.conimal_idx = conimal_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getConimal_type() {
		return conimal_type;
	}
	public void setConimal_type(String conimal_type) {
		this.conimal_type = conimal_type;
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
	public int getImage_isze() {
		return image_isze;
	}
	public void setImage_isze(int image_isze) {
		this.image_isze = image_isze;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
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
