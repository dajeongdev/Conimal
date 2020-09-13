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
	
	
	
	<%@ include file="../include/side-menu.jsp" %>
	

	<div class="sub-container">
		
		
		<h3 class="marB_30">내 뱃지</h3>
		<div class="badge-box marB_50"> 
			<div class="my-badge">
				<div class="badge"></div>
				<p class="badge-title">뱃지타이틀</p>
			</div>
			<div class="my-badge">
				<div class="badge"></div>
				<p class="badge-title">뱃지타이틀</p>
			</div>
			<div class="my-badge">
				<div class="badge"></div>
				<p class="badge-title">뱃지타이틀</p>
			</div>
			<div class="my-badge">
				<div class="badge"></div>
				<p class="badge-title">뱃지타이틀</p>
			</div>
			<div class="my-badge">
				<div class="badge"></div>
				<p class="badge-title">뱃지타이틀</p>
			</div>
		</div>
		
		<h3 class="marB_30">내 반려동물</h3>
		<div class="my-pets marB_50"> 
			<div class="pet">
				<h6 class="pet-name">치즈</h6>
				<div class="pet-info">
					<span>종류</span>
					<span>ㅣ</span>
					<span>성별</span>
					<span>ㅣ</span>
					<span>나이</span>
				</div>
			</div>
			<div class="pet">
				<h6 class="pet-name">치즈</h6>
				<div class="pet-info">
					<span>종류</span>
					<span>ㅣ</span>
					<span>성별</span>
					<span>ㅣ</span>
					<span>나이</span>
				</div>
			</div>
		</div>
		
		
		<h3 class="marB_30">내 게시글</h3>
		<div class="my-board marB_50" id="my-board">
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
		
		
		<h3 class="marB_30">내 댓글</h3>
		<div class="my-comment marB_50" id="my-comment">
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
		
		
		<h3 class="marB_30">내 북마크</h3>
		<div class="my-bookmark marB_50" id="my-bookmark">
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
		
	
		
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
