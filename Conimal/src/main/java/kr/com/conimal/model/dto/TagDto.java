package kr.com.conimal.model.dto;

public class TagDto {
	
	private Long tag_id;
	private String name;
	private int hit;
	
	public Long getTag_id() {
		return tag_id;
	}
	public void setTag_id(Long tag_id) {
		this.tag_id = tag_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
