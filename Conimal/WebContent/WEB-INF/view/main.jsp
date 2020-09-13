<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="include/head.jsp" %>
</head>

<body>
<%@ include file="include/header.jsp" %>
<div class = "main-container">
	<section class="pet-dictionary">
		<div class="list">
			<div class="title">
				<h1>콘텐츠 제목</h1>
			</div>
	
			<div class="date-and-tag">
				<div class="date">
					<span>2020.03.29</span>
				</div>
				<ul class="tags">
					<li class="tag-name"><span>#고양이</span></li>
					<li class="tag-name"><span>#강아지</span></li>
				</ul>
	
			</div>
		</div>
		<div class="list">
			<div class="title">
				<h1>콘텐츠 제목</h1>
			</div>
	
			<div class="date-and-tag">
				<div class="date">
					<span>2020.03.29</span>
				</div>
				<ul class="tags">
					<li class="tag-name"><span>#고양이</span></li>
					<li class="tag-name"><span>#강아지</span></li>
				</ul>
	
			</div>
		</div>
		<div class="list">
			<div class="title">
				<h1>콘텐츠 제목</h1>
			</div>
	
			<div class="date-and-tag">
				<div class="date">
					<span>2020.03.29</span>
				</div>
				<ul class="tags">
					<li class="tag-name"><span>#고양이</span></li>
					<li class="tag-name"><span>#강아지</span></li>
				</ul>
	
			</div>
		</div>

		<div class="mouse-wheel"></div>
	
	</section>
	<section class="community">
		<div class="board-list" id="noticeTable">
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			<div class="board-item">
				<div class="board tit">
					<span>게시글 제목</span>
					<div class="new"><span class="bold">new</span></div>
				</div>
				<div class="board name">사용자</div>
			</div>
			
			

		</div>


		<button class="more-btn">더보기</button>
	
	</section>
	
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>
