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
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

  	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/board/getBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	<input type="hidden" name="user_id" id="user_id" value="${user.user_id}" readonly />
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
				<!-- <p class="sub">지금 코니멀 커뮤니티에서 사용되고 있는 해시태그를 확인하고 대화에 참여해보세요</p> -->
				<div class="community-nav">
					<div class="search-box">
						<button class="btn small-btn">검색</button>
						<input class="search-input" type ="text" placeholder ="검색어를 입력하세요"/>
						<!-- <button class="btn small-btn" id="cntPerPage">10개</button>	 -->
					</div>
					<button class="btn small-btn" onclick="document.location.href='/community/community-write-form'">글쓰기</button>
				</div>
			</div>

			<div class="board-list" id="noticeTable">
				
				<c:forEach var="board" items="${list}">
				<div class="board-item">
					
					<div class="board-first-raw">
						<div>
							<span class="title bold" onClick="document.location.href='/community/community-detail?board_id=${board.board_id}'">${board.title}</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">${board.hit}</span>
							<span class="new">new</span>
						</div>
						
					</div>
					<div class="board-second-raw">				
						<span class="date bold">${board.create_date}</span>
					</div>
					
				</div>
				</c:forEach>
			
				<ul class="pagination">
					<c:if test="${paging.prev}">
						<li class="paging-item"><a class="page-link" href="#" onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}')">이전</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
						<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${paging.range}', '${paging.rangeSize}')">${idx}</a></li>
					</c:forEach>
					<c:if test="${paging.next}">
						<li class="paging-item"><a class="page-link" href="#" onClick="fn_next('${paging.page}', '${paging.range}', '${paging.rangeSize}')">다음</a></li>
					</c:if>
				</ul>

			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
