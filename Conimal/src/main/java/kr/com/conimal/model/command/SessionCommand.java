package kr.com.conimal.model.command;

import kr.com.conimal.model.dto.UserDto;

public class SessionCommand {
	private UserDto userDto;
	private int conimal_idx;
	
	public UserDto getUserDto() {
		return userDto;
	}
	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}
	public int getConimal_idx() {
		return conimal_idx;
	}
	public void setConimal_idx(int conimal_idx) {
		this.conimal_idx = conimal_idx;
	}
	
}
