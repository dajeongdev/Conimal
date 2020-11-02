package kr.com.conimal.model.command;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerCommand {
	private PagingCommand page;
	private int totalCount; // 총 게시글 수 
	private int startPage; // 화면에 보여질 첫번째 페이지 번호
	private int endPage; // 화면에 보여질 마지막 페이지 번호 
	private boolean prev; // 이전 버튼 생성 여부 
	private boolean next; // 다음 버튼 생성 여부 
	private int displayPageNum = 5; // 화면 하단에 보여지는 페이지 버튼의 수 
	
	public PagingCommand getPage() {
		return page;
	}

	public void setPage(PagingCommand page) {
		this.page = page;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		cal();
	}
	
	private void cal() {
		endPage = (int) (Math.ceil(page.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		if(startPage <= 0) startPage = 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));
		if(endPage > tempEndPage) endPage = tempEndPage;
		
		prev = startPage == 1 ? false : true;
		next = endPage * page.getPerPageNum() < totalCount ? true : false;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public String makeQueryPage(int pages) {
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", pages)
				.queryParam("perPageNum", page.getPerPageNum())
				.build();
		
		return uri.toUriString();
	}
	
	public String makeQueryPage(int idx, int pages) {
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("idx", idx)
				.queryParam("page", pages)
				.queryParam("perPageNum", page.getPerPageNum())
				.build();
		
		return uri.toUriString();
	}
	
}
