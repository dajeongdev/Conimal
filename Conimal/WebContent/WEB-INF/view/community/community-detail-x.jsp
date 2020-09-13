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
	

		<h1 class="detail-title">게시글 제목</h1>

		
		<div class="detail-header">
			<div class="detail-info">
				<div class="detail-user">
					<span class="user-img"></span>
					사용자
				</div>

				<div class="detail-date">
					<span>2020.03.29</span>
				</div>
				<div class="detail-view-cnt">
					<span>000</span>
				</div>
				<ul class="tags">
					<li class="tag-name"><span>#고양이</span></li>
					<li class="tag-name"><span>#강아지</span></li>
				</ul>
			</div>
			
			<div class="social-box">
				<div>A</div>
				<div>B</div>
				<div>C</div>
			</div>
	
		</div>
		
		
		<div class="detail-contents">
			본문 영역입니다.
		</div>
		
		<div class="detail-comment">
			<div class="detail-cnt">
				<div>덧글 <span>3개</span></div>
				<div class="like-cnt">
					<span id="like-cnt">10</span>
				</div>
			</div>
			
			
			<div class="comment-box">
		
				<div class="comment">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							사용자
						</div>
						<span class="comment-date">2020.02.02</span>
					</div>
					<div class="comment-contents">
						덧글을 달았다.<br/>
						줄바꿈
					</div>
				</div>		
				<div class="comment">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							사용자
						</div>
						<span class="comment-date">2020.02.02</span>
					</div>
					<div class="comment-contents">
						덧글을 달았다.<br/>
						줄바꿈
					</div>
				</div>
				<div class="comment child">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							사용자
						</div>
						<span class="comment-date">2020.02.02</span>
					</div>
					<div class="comment-contents">
						덧글을 달았다.<br/>
						줄바꿈
					</div>
				</div>		
			</div>
		
			
			
		</div>
		


		<div class="board-list" id="noticeTable">
			<div class="board-item">
				<div class="board pre-next">이전 글</div>
				<div class="board tit">
					<span>게시글 제목</span>
				</div>
				<div class="board name">
					<span class="user-img"></span>
					사용자
				</div>
				<div class="board date">2020.05.04</div>
				<div class="board view-cnt">000</div>
			</div>
			<div class="board-item">
				<div class="board pre-next">다음 글</div>
				<div class="board tit">
					<span>게시글 제목</span>
				</div>
				<div class="board name">
					<span class="user-img"></span>
					사용자
				</div>
				<div class="board date">2020.05.04</div>
				<div class="board view-cnt">000</div>
			</div>	
		</div>


		<button class="more-btn">목록</button>

	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
