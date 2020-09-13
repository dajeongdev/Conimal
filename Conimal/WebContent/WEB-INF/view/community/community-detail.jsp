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
			</div>
			
		
			
			<div> 
				<h6 class="detail-header">
					<span id="cm-title">게시판 리스트:콘텐츠 제목</span>
					<img src="#" id="">
					<span id="cm-viewCnt">0</span>					
				</h6>
				<div class="detail-header justify">
					<span id="cm-writer">작성자</span>
					<span id="cm-date">2020.02.02</span>
				</div>
				<div class ="detail-header justify">
					<ul class="tags">
						<li class="tag-name"><span>#고양이</span></li>
						<li class="tag-name"><span>#강아지</span></li>
					</ul>
					<div class="light-gray">
						<span>북마크</span>
						<span>공유</span>
						<span>신고</span>
					</div>
				</div>
			</div>
			
			<div class="detail-contents">
				본문 영역입니다

				<div class="img-area">
					<img>
				</div>							
			</div>


			<!-- 덧글  -->
			
			<input type="text" class="marB_30" id="comment" placeholder="덧글을 입력하세요"/>
			
			<div class="comment-box marB_30">
		
				<div class="comment-items">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							사용자
						</div>
						<div>
							<span class="comment-date">2020.02.02</span>
							<span class="light-gray">
								<span>대댓글달기</span>
								<span>신고</span>
							</span>
						</div>
					</div>
					<div class="comment-contents" id="comment-contents">
						덧글 내용
					</div>
				</div>		
				
			</div>
			
			
			<!-- 하단 버튼 -->
			<div class="justify">
				<div>
					<button class="btn marR_10">목록</button>
					<button class="btn marR_10">이전 글</button>
					<button class="btn">다음 글</button>
				</div>
				<div>
					<button class="btn marR_10">삭제</button>
					<button class="btn">수정</button>
				</div>
			</div>
			



			
		</div>	
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
