<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<c:url var="findBoardList" value="${pageContext.request.contextPath}/community/community-list">
</c:url>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${findBoardList}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;

		location.href = url;
	}

  	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${findBoardList}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${findBoardList}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		
		location.href = url;
	}

	// 검색
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		
		var url = "${findBoardList}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		
		location.href = encodeURI(url);
		console.log(url);
	});
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
					<div class="form-group row justify-content-center">
						<div class="w100" style="padding-right:10px">
							<select class="form-control form-control-sm" name="searchType" id="searchType">
								<option value="title">제목</option>
								<option value="Content">본문</option>
								<option value="reg_id">작성자</option>
							</select>
						</div>
						<div class="w300" style="padding-right:10px">
							<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" value="${paging.keyword}" placeholder="검색어를 입력하세요.">
						</div>
						<div>
							<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
						</div>
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
							<span class="chat-icon"><img width="15" height="15" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzE0LjY2NywzOTEuNDY3YzYuNC0yMS4zMzMsMTkuMi00MC41MzMsMzYuMjY3LTU1LjQ2N2MzMi0yNi42NjcsNTIuMjY3LTY3LjIsNTIuMjY3LTExMg0KCWMwLTgzLjItNjkuMzMzLTE1MS40NjctMTU0LjY2Ny0xNDcuMkMxNzIuOCw4MCwxMTAuOTMzLDE0NCwxMDguOCwyMTkuNzMzQzEwNy43MzMsMjY2LjY2NywxMjgsMzA4LjI2NywxNjEuMDY3LDMzNg0KCUMxNzkuMiwzNTAuOTMzLDE5MiwzNzAuMTMzLDE5OC40LDM5MS40NjdMMzE0LjY2NywzOTEuNDY3TDMxNC42NjcsMzkxLjQ2N3oiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBkPSJNMjQyLjEzMywzOTMuNmg5LjZsLTQyLjY2Ny0xNTguOTMzYzEuMDY3LDAsMi4xMzMsMCwzLjIsMGM1LjMzMywwLDEwLjY2Ny0yLjEzMywxNC45MzMtNi40DQoJYzIuMTMzLTIuMTMzLDQuMjY3LTMuMiw3LjQ2Ny0zLjJjMy4yLDAsNS4zMzMsMS4wNjcsNy40NjcsMy4yYzcuNDY3LDguNTMzLDIwLjI2Nyw4LjUzMywyNy43MzMsMGMyLjEzMy0yLjEzMyw0LjI2Ny0zLjIsNy40NjctMy4yDQoJYzIuMTMzLDAsNS4zMzMsMS4wNjcsNy40NjcsMy4yYzQuMjY3LDQuMjY3LDguNTMzLDYuNCwxNC45MzMsNi40YzEuMDY3LDAsMi4xMzMsMCwzLjIsMGwtNDEuNiwxNTguOTMzaDkuNmw0My43MzMtMTY2LjQNCgljMC0yLjEzMywwLTQuMjY3LTIuMTMzLTUuMzMzYy0yLjEzMy0xLjA2Ny00LjI2NywwLTUuMzMzLDEuMDY3Yy0yLjEzMywyLjEzMy00LjI2NywzLjItNi40LDMuMmMtMy4yLDAtNS4zMzMtMS4wNjctOC41MzMtMy4yDQoJYy00LjI2Ny00LjI2Ny04LjUzMy02LjQtMTMuODY3LTYuNHMtOS42LDIuMTMzLTEzLjg2Nyw2LjRzLTEwLjY2Nyw0LjI2Ny0xNC45MzMsMGMtMy4yLTQuMjY3LTguNTMzLTYuNC0xMy44NjctNi40bDAsMA0KCWMtNS4zMzMsMC0xMC42NjcsMi4xMzMtMTMuODY3LDYuNGMtMi4xMzMsMi4xMzMtNS4zMzMsMy4yLTguNTMzLDMuMmMtMi4xMzMsMC01LjMzMy0xLjA2Ny02LjQtMy4yDQoJYy0xLjA2Ny0xLjA2Ny0zLjItMi4xMzMtNS4zMzMtMS4wNjdjLTIuMTMzLDEuMDY3LTMuMiwzLjItMi4xMzMsNS4zMzNMMjQyLjEzMywzOTMuNnoiLz4NCjxnPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiMzNDRBNUU7IiBkPSJNMjIyLjkzMyw0ODkuNkMyMjguMjY3LDUwMi40LDI0MS4wNjcsNTEyLDI1Niw1MTJjMTQuOTMzLDAsMjcuNzMzLTkuNiwzMy4wNjctMjIuNEgyMjIuOTMzeiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiMzNDRBNUU7IiBkPSJNMjk1LjQ2Nyw0OTAuNjY3SDIxNy42Yy0xMC42NjcsMC0xOS4yLTguNTMzLTE5LjItMTkuMlYzOTAuNGgxMTYuMjY3djgxLjA2Nw0KCQlDMzE0LjY2Nyw0ODIuMTMzLDMwNi4xMzMsNDkwLjY2NywyOTUuNDY3LDQ5MC42Njd6Ii8+DQo8L2c+DQo8Zz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojNDE1QTZCOyIgZD0iTTMxMy42LDQzMC45MzNIMTk4LjRjLTYuNCwwLTExLjczMy01LjMzMy0xMS43MzMtMTEuNzMzbDAsMGMwLTYuNCw1LjMzMy0xMS43MzMsMTEuNzMzLTExLjczMw0KCQloMTE1LjJjNi40LDAsMTEuNzMzLDUuMzMzLDExLjczMywxMS43MzNsMCwwQzMyNS4zMzMsNDI1LjYsMzIwLDQzMC45MzMsMzEzLjYsNDMwLjkzM3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojNDE1QTZCOyIgZD0iTTMxMy42LDQ2OC4yNjdIMTk4LjRjLTYuNCwwLTExLjczMy01LjMzMy0xMS43MzMtMTEuNzMzbDAsMGMwLTYuNCw1LjMzMy0xMS43MzMsMTEuNzMzLTExLjczMw0KCQloMTE1LjJjNi40LDAsMTEuNzMzLDUuMzMzLDExLjczMywxMS43MzNsMCwwQzMyNS4zMzMsNDYyLjkzMywzMjAsNDY4LjI2NywzMTMuNiw0NjguMjY3eiIvPg0KPC9nPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0ZGRDE1QzsiIGQ9Ik0yNTYsMGMtNS4zMzMsMC0xMC42NjcsNC4yNjctMTAuNjY3LDEwLjY2N3YzNi4yNjdjMCw1LjMzMyw0LjI2NywxMC42NjcsMTAuNjY3LDEwLjY2Nw0KCQljNi40LDAsMTAuNjY3LTQuMjY3LDEwLjY2Ny0xMC42NjdWMTAuNjY3QzI2Ni42NjcsNC4yNjcsMjYxLjMzMywwLDI1NiwweiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMTEzLjA2Nyw2NS4wNjdjLTQuMjY3LTQuMjY3LTEwLjY2Ny00LjI2Ny0xNC45MzMsMHMtNC4yNjcsMTAuNjY3LDAsMTQuOTMzbDI1LjYsMjUuNg0KCQljNC4yNjcsNC4yNjcsMTAuNjY3LDQuMjY3LDE0LjkzMywwczQuMjY3LTEwLjY2NywwLTE0LjkzM0wxMTMuMDY3LDY1LjA2N3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRkZEMTVDOyIgZD0iTTgwLDIxMi4yNjdINDMuNzMzYy01LjMzMywwLTEwLjY2Nyw0LjI2Ny0xMC42NjcsMTAuNjY3bDAsMGMwLDUuMzMzLDQuMjY3LDEwLjY2NywxMC42NjcsMTAuNjY3SDgwDQoJCWM1LjMzMywwLDEwLjY2Ny00LjI2NywxMC42NjctMTAuNjY3bDAsMEM5MC42NjcsMjE3LjYsODUuMzMzLDIxMi4yNjcsODAsMjEyLjI2N3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRkZEMTVDOyIgZD0iTTEyMy43MzMsMzQwLjI2N2wtMjUuNiwyNS42Yy00LjI2Nyw0LjI2Ny00LjI2NywxMC42NjcsMCwxNC45MzNzMTAuNjY3LDQuMjY3LDE0LjkzMywwbDI1LjYtMjUuNg0KCQljNC4yNjctNC4yNjcsNC4yNjctMTAuNjY3LDAtMTQuOTMzUzEyOCwzMzYsMTIzLjczMywzNDAuMjY3eiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzg4LjI2NywzNDAuMjY3QzM4NCwzMzYsMzc3LjYsMzM2LDM3My4zMzMsMzQwLjI2N2MtNC4yNjcsNC4yNjctNC4yNjcsMTAuNjY3LDAsMTQuOTMzbDI1LjYsMjUuNg0KCQljNC4yNjcsNC4yNjcsMTAuNjY3LDQuMjY3LDE0LjkzMywwczQuMjY3LTEwLjY2NywwLTE0LjkzM0wzODguMjY3LDM0MC4yNjd6Ii8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0ZGRDE1QzsiIGQ9Ik00NjguMjY3LDIxMi4yNjdINDMyYy01LjMzMywwLTEwLjY2Nyw0LjI2Ny0xMC42NjcsMTAuNjY3bDAsMGMwLDUuMzMzLDQuMjY3LDEwLjY2NywxMC42NjcsMTAuNjY3DQoJCWgzNi4yNjdjNS4zMzMsMCwxMC42NjctNC4yNjcsMTAuNjY3LTEwLjY2N2wwLDBDNDc4LjkzMywyMTcuNiw0NzQuNjY3LDIxMi4yNjcsNDY4LjI2NywyMTIuMjY3eiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzk4LjkzMyw2NS4wNjdsLTI1LjYsMjUuNmMtNC4yNjcsNC4yNjctNC4yNjcsMTAuNjY3LDAsMTQuOTMzYzQuMjY3LDQuMjY3LDEwLjY2Nyw0LjI2NywxNC45MzMsMA0KCQlsMjUuNi0yNS42YzQuMjY3LTQuMjY3LDQuMjY3LTEwLjY2NywwLTE0LjkzM1M0MDMuMiw2MC44LDM5OC45MzMsNjUuMDY3eiIvPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" /></span>
							<span class="view-cnt">${board.hit}</span>
						</div>
						<span>${board.user.nickname}</span>
					</div>
					<div class="board-second-raw">				
						<span class="date bold">${board.create_date}</span>
					</div>
					
				</div>
				</c:forEach>
				
				<!-- 페이징 -->
				<div id="paginationBox">
					<ul class="pagination">	
						<c:if test="${paging.prev}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')">이전</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
							<li class="page-item" value="${paging.page == idx ? 'active' : ''}"><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')"> ${idx} </a></li>
						</c:forEach>
						<c:if test="${paging.next}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${paging.page}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')" >다음</a></li>
						</c:if>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
