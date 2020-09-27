<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
				<p class="sub">지금 코니멀 커뮤니티에서 사용되고 있는 해시태그를 확인하고 대화에 참여해보세요</p>
				<div class="community-nav">
					<div class="search-box">
						<button class="btn small-btn">검색</button>
						<input class="search-input" type ="text" placeholder ="검색어를 입력하세요"/>
						<button class="btn small-btn">10개</button>	
					</div>
					<button class="btn small-btn" onclick="location.href='/community/community-write-form'">글쓰기</button>
				</div>
				
				<div class="tags">
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
				</div>
			</div>

			<div class="board-list" id="noticeTable">
				<div class="board-item">
					<div class="board-first-raw">
						<div>
							<span class="title bold">게시판 리스트: 콘텐츠 제목1</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">1</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">사용자</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
						</div>
						<span class="date bold">2020.06.25</span>
					</div>
				</div>
				<div class="board-item">
					<div class="board-first-raw">
						<div>
							<span class="title bold">게시판 리스트: 콘텐츠 제목1</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">1</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">사용자</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
						</div>
						<span class="date bold">2020.06.25</span>
					</div>
				</div>						
			</div>
			
			<ul class="pagination clr">
				<li class="paging-item">r</li>
				<li class="paging-item">1</li>
				<li class="paging-item">2</li>
				<li class="paging-item">3</li>
				<li class="paging-item">4</li>
				<li class="paging-item">5</li>
				<li class="paging-item">r</li>
			</ul>
	
		</div>
	
		
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
