<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script>
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	<input type="hidden" name="user_idx" id="user_idx" value="${user.user_idx}" readonly />
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
				<p class="sub">지금 코니멀 커뮤니티에서 사용되고 있는 해시태그를 확인하고 대화에 참여해보세요</p>
				<div class="community-nav">
					<div class="search-box">
						<button class="btn small-btn">검색</button>
						<input class="search-input" type ="text" placeholder ="검색어를 입력하세요"/>
						<button class="btn small-btn" id="cntPerPage">10개</button>	
					</div>
					<button class="btn small-btn" onclick="document.location.href='/community/community-write-form'">글쓰기</button>
				</div>
				
				<div class="tags">
					<c:forEach var="hitTagList" items="${hitTagList}">
					<div class="tag-name">
						<span>#<c:out value="${hitTagList.tag_name}"/></span>
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="board-list" id="noticeTable">
				
				<c:forEach var="community" items="${list}">
				<div class="board-item">
					
					<div class="board-first-raw">
						<div>
							<span class="title bold" onClick="document.location.href='/community/community-detail?community_idx=${community.community_idx}'">${community.title}</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">${community.hit}</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">${community.user.nickname}</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<c:forEach items="${tags}" var="tags">
									<div class="tag-name">
										<span>#<c:out value="${tags.tag.tag_name}"/></span>
									</div>
							</c:forEach>
						</div>
						<span class="date bold">${community.reg_date}</span>
					</div>
					
				</div>
				</c:forEach>
			
				<ul class="pagination clr">
					<c:if test="${pageMaker.prev}">
						<li class="paging-item" onclick="document.location.href='/community/community-list${pageMaker.makeQueryPage(pageMaker.startPage-1)}'">r</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
						<li class="paging-item" onclick="document.location.href='/community/community-list${pageMaker.makeQueryPage(pageNum)}'">${pageNum}
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="paging-item" onclick="document.location.href='/community/community-list?page=${pageMaker.makeQueryPage(pageMaker.endPage+1)}'">r</li>
					</c:if>
				</ul>
	
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
