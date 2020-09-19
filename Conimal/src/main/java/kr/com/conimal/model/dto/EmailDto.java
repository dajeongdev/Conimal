package kr.com.conimal.model.dto;

public class EmailDto {
	private String receiver; // 수신자 메일 주소 
	private String subject; // 제목
	private String content; // 본문 
	private String date;
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiverMail(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
