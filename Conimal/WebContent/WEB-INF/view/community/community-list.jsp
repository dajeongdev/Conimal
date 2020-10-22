<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
	<c:if test="${user.user_idx eq session.user_idx}">
		<c:set var="isOwnPet" value="Y" />
	</c:if>
	<div class = "page-container">
	<input type="hidden" name="user_idx" id="user_idx" value="1" readonly />
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
					<button class="btn small-btn" onclick="document.location.href='/community/community-write-form'">글쓰기</button>
				</div>
				
				<div class="tags">
					<c:forEach var="taglist" items="${hitTagList}">
					<div class="tag-name">
						<span>#<c:out value="${taglist.tag_name}"/></span>
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="board-list" id="noticeTable">
				<div class="board-item">
					<div class="board-first-raw">
						<div>
							<span class="title bold"><a href="/community/community-detail">게시판 리스트: 콘텐츠 제목1</a></span>
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
				
				<c:forEach var="community" items="${community}">
				<div class="board-item">
					
					<div class="board-first-raw">
						<div>
							<span class="title bold" onClick="document.location.href='/community/community-detail?community_idx=${community.community_idx}'">${community.title}</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">${community.hit}</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">${community.user_idx}</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<c:forEach var="tag" items="${tags}">
								
									<div class="tag-name">
										<span>#<c:out value="${tag.tag_name}"/></span>
									</div>
								
							</c:forEach>
						</div>
						<span class="date bold">${community.reg_date}</span>
					</div>
					
				</div>
				</c:forEach>
			
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
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
