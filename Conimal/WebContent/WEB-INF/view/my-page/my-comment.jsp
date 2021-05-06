<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
	
	
	<div class = "page-container">
	
	
	
	<%@ include file=../include/side-menu.jsp" %>
	

	<div class="sub-container">
		
		
		
		<h3 class="marB_30">내 댓글</h3>
		<div class="my-comment marB_50" id="my-comment">
		
			<div class="board-item">
				<div class="board-first-raw">
					<span class="comment bold">덧글내용</span>
					<span class="user bold">사용자</span>
				</div>
				<div class="board-second-raw">				
					<div>
						<span class="title bold">게시판 리스트: 콘텐츠 제목1</span>
						<span class="chat-icon"></span>
						<span class="view-cnt">1</span>
						<span class="new">new</span>
					</div>
					<span class="date bold">2020.06.25</span>
				</div>
			</div>
			
		</div>
		
		<!-- 페이징 -->
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
