package kr.com.conimal.model.dto;

import java.time.LocalDate;

public class FileDto {
	
	private Long file_id;
	private Long board_id; 
	private String file_name; 
	private String file_path;
	private LocalDate create_date;
	
	public Long getFile_id() {
		return file_id;
	}
	public void setFile_id(Long file_id) {
		this.file_id = file_id;
	}
	public Long getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Long board_id) {
		this.board_id = board_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public LocalDate getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}
	
}
