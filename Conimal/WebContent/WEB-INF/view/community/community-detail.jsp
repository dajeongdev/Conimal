<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyBoard</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	/* 댓글 유효성 검증 */
	function isValidate(obj) {
            if (obj.contents.value === "") {
                alert("내용을 입력해주세요.");
                return false;
            }
            return true;
        }

	/* 글 삭제 */
	function deleteBoard(id) {
		if(confirm("정말 삭제하시겠습니까?") === true) {
			location.href="/community/board-delete?board_id="+id;
		}
	}

	/* 댓글 수정 버튼 클릭 */
	function update(comment_id, user_id, contents) {
		var html = "";
		html += "<div id='comment_id' value='" + comment_id + "'>";
		html += "<textarea class='marB_30' id='updateContents' name='updateContents'>" + contents + "</textarea>";
		html += "<span class='light-gray'>";
		html += "<span id='updateCom'><a href='javascript:void(0)' onClick='updateCom('" + comment_id + "', '" + user_id +"')'>저장</a></span>";
		html += "<span id='deleteCom'><a href='javascript:void(0)' onClick='rollback()'>취소</a></span></span></div>";

		$('#comment_id' + comment_id).replaceWith(html);
		$('#comment_id' + comment_id + '#updateContents').focus();
	}
	
	/* 댓글 수정 후 저장 버튼 클릭 */
	function updateCom(comment_id, user_id) {
		var contents = $("#updateContents").val();
		var param = JSON.stringfy({"contents" : contents, "comment_id" : comment_id});
		var headers = {"contentType" : "application/json", "X-HTTP-Method-Override" : "POST"};
		
		$.ajax({
			url : "/community/updateCom",
			headers : headers,
			data : param,
			dataType : "text",
			success : function() {
				console.log("success update comment");
			}, error : function() {
				console.log("error");
			}
		})
	}
	
	/* 댓글 수정 후 취소 버튼 클릭 */
	function rollback() {
		return false;
	}
	
	/* 댓글 삭제 */
	function deleteCom(id) {
		if(confirm("정말 삭제하시겠습니까?") === true) {
			location.href="/community/deleteCom?comment_id="+id;
		} 
	}
	
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
			
			<div> 
				<h6 class="detail-header">
					<span id="cm-title"><c:out value="${board.title}"/></span>
					<img width="15" height="15" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzE0LjY2NywzOTEuNDY3YzYuNC0yMS4zMzMsMTkuMi00MC41MzMsMzYuMjY3LTU1LjQ2N2MzMi0yNi42NjcsNTIuMjY3LTY3LjIsNTIuMjY3LTExMg0KCWMwLTgzLjItNjkuMzMzLTE1MS40NjctMTU0LjY2Ny0xNDcuMkMxNzIuOCw4MCwxMTAuOTMzLDE0NCwxMDguOCwyMTkuNzMzQzEwNy43MzMsMjY2LjY2NywxMjgsMzA4LjI2NywxNjEuMDY3LDMzNg0KCUMxNzkuMiwzNTAuOTMzLDE5MiwzNzAuMTMzLDE5OC40LDM5MS40NjdMMzE0LjY2NywzOTEuNDY3TDMxNC42NjcsMzkxLjQ2N3oiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBkPSJNMjQyLjEzMywzOTMuNmg5LjZsLTQyLjY2Ny0xNTguOTMzYzEuMDY3LDAsMi4xMzMsMCwzLjIsMGM1LjMzMywwLDEwLjY2Ny0yLjEzMywxNC45MzMtNi40DQoJYzIuMTMzLTIuMTMzLDQuMjY3LTMuMiw3LjQ2Ny0zLjJjMy4yLDAsNS4zMzMsMS4wNjcsNy40NjcsMy4yYzcuNDY3LDguNTMzLDIwLjI2Nyw4LjUzMywyNy43MzMsMGMyLjEzMy0yLjEzMyw0LjI2Ny0zLjIsNy40NjctMy4yDQoJYzIuMTMzLDAsNS4zMzMsMS4wNjcsNy40NjcsMy4yYzQuMjY3LDQuMjY3LDguNTMzLDYuNCwxNC45MzMsNi40YzEuMDY3LDAsMi4xMzMsMCwzLjIsMGwtNDEuNiwxNTguOTMzaDkuNmw0My43MzMtMTY2LjQNCgljMC0yLjEzMywwLTQuMjY3LTIuMTMzLTUuMzMzYy0yLjEzMy0xLjA2Ny00LjI2NywwLTUuMzMzLDEuMDY3Yy0yLjEzMywyLjEzMy00LjI2NywzLjItNi40LDMuMmMtMy4yLDAtNS4zMzMtMS4wNjctOC41MzMtMy4yDQoJYy00LjI2Ny00LjI2Ny04LjUzMy02LjQtMTMuODY3LTYuNHMtOS42LDIuMTMzLTEzLjg2Nyw2LjRzLTEwLjY2Nyw0LjI2Ny0xNC45MzMsMGMtMy4yLTQuMjY3LTguNTMzLTYuNC0xMy44NjctNi40bDAsMA0KCWMtNS4zMzMsMC0xMC42NjcsMi4xMzMtMTMuODY3LDYuNGMtMi4xMzMsMi4xMzMtNS4zMzMsMy4yLTguNTMzLDMuMmMtMi4xMzMsMC01LjMzMy0xLjA2Ny02LjQtMy4yDQoJYy0xLjA2Ny0xLjA2Ny0zLjItMi4xMzMtNS4zMzMtMS4wNjdjLTIuMTMzLDEuMDY3LTMuMiwzLjItMi4xMzMsNS4zMzNMMjQyLjEzMywzOTMuNnoiLz4NCjxnPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiMzNDRBNUU7IiBkPSJNMjIyLjkzMyw0ODkuNkMyMjguMjY3LDUwMi40LDI0MS4wNjcsNTEyLDI1Niw1MTJjMTQuOTMzLDAsMjcuNzMzLTkuNiwzMy4wNjctMjIuNEgyMjIuOTMzeiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiMzNDRBNUU7IiBkPSJNMjk1LjQ2Nyw0OTAuNjY3SDIxNy42Yy0xMC42NjcsMC0xOS4yLTguNTMzLTE5LjItMTkuMlYzOTAuNGgxMTYuMjY3djgxLjA2Nw0KCQlDMzE0LjY2Nyw0ODIuMTMzLDMwNi4xMzMsNDkwLjY2NywyOTUuNDY3LDQ5MC42Njd6Ii8+DQo8L2c+DQo8Zz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojNDE1QTZCOyIgZD0iTTMxMy42LDQzMC45MzNIMTk4LjRjLTYuNCwwLTExLjczMy01LjMzMy0xMS43MzMtMTEuNzMzbDAsMGMwLTYuNCw1LjMzMy0xMS43MzMsMTEuNzMzLTExLjczMw0KCQloMTE1LjJjNi40LDAsMTEuNzMzLDUuMzMzLDExLjczMywxMS43MzNsMCwwQzMyNS4zMzMsNDI1LjYsMzIwLDQzMC45MzMsMzEzLjYsNDMwLjkzM3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojNDE1QTZCOyIgZD0iTTMxMy42LDQ2OC4yNjdIMTk4LjRjLTYuNCwwLTExLjczMy01LjMzMy0xMS43MzMtMTEuNzMzbDAsMGMwLTYuNCw1LjMzMy0xMS43MzMsMTEuNzMzLTExLjczMw0KCQloMTE1LjJjNi40LDAsMTEuNzMzLDUuMzMzLDExLjczMywxMS43MzNsMCwwQzMyNS4zMzMsNDYyLjkzMywzMjAsNDY4LjI2NywzMTMuNiw0NjguMjY3eiIvPg0KPC9nPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0ZGRDE1QzsiIGQ9Ik0yNTYsMGMtNS4zMzMsMC0xMC42NjcsNC4yNjctMTAuNjY3LDEwLjY2N3YzNi4yNjdjMCw1LjMzMyw0LjI2NywxMC42NjcsMTAuNjY3LDEwLjY2Nw0KCQljNi40LDAsMTAuNjY3LTQuMjY3LDEwLjY2Ny0xMC42NjdWMTAuNjY3QzI2Ni42NjcsNC4yNjcsMjYxLjMzMywwLDI1NiwweiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMTEzLjA2Nyw2NS4wNjdjLTQuMjY3LTQuMjY3LTEwLjY2Ny00LjI2Ny0xNC45MzMsMHMtNC4yNjcsMTAuNjY3LDAsMTQuOTMzbDI1LjYsMjUuNg0KCQljNC4yNjcsNC4yNjcsMTAuNjY3LDQuMjY3LDE0LjkzMywwczQuMjY3LTEwLjY2NywwLTE0LjkzM0wxMTMuMDY3LDY1LjA2N3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRkZEMTVDOyIgZD0iTTgwLDIxMi4yNjdINDMuNzMzYy01LjMzMywwLTEwLjY2Nyw0LjI2Ny0xMC42NjcsMTAuNjY3bDAsMGMwLDUuMzMzLDQuMjY3LDEwLjY2NywxMC42NjcsMTAuNjY3SDgwDQoJCWM1LjMzMywwLDEwLjY2Ny00LjI2NywxMC42NjctMTAuNjY3bDAsMEM5MC42NjcsMjE3LjYsODUuMzMzLDIxMi4yNjcsODAsMjEyLjI2N3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRkZEMTVDOyIgZD0iTTEyMy43MzMsMzQwLjI2N2wtMjUuNiwyNS42Yy00LjI2Nyw0LjI2Ny00LjI2NywxMC42NjcsMCwxNC45MzNzMTAuNjY3LDQuMjY3LDE0LjkzMywwbDI1LjYtMjUuNg0KCQljNC4yNjctNC4yNjcsNC4yNjctMTAuNjY3LDAtMTQuOTMzUzEyOCwzMzYsMTIzLjczMywzNDAuMjY3eiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzg4LjI2NywzNDAuMjY3QzM4NCwzMzYsMzc3LjYsMzM2LDM3My4zMzMsMzQwLjI2N2MtNC4yNjcsNC4yNjctNC4yNjcsMTAuNjY3LDAsMTQuOTMzbDI1LjYsMjUuNg0KCQljNC4yNjcsNC4yNjcsMTAuNjY3LDQuMjY3LDE0LjkzMywwczQuMjY3LTEwLjY2NywwLTE0LjkzM0wzODguMjY3LDM0MC4yNjd6Ii8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0ZGRDE1QzsiIGQ9Ik00NjguMjY3LDIxMi4yNjdINDMyYy01LjMzMywwLTEwLjY2Nyw0LjI2Ny0xMC42NjcsMTAuNjY3bDAsMGMwLDUuMzMzLDQuMjY3LDEwLjY2NywxMC42NjcsMTAuNjY3DQoJCWgzNi4yNjdjNS4zMzMsMCwxMC42NjctNC4yNjcsMTAuNjY3LTEwLjY2N2wwLDBDNDc4LjkzMywyMTcuNiw0NzQuNjY3LDIxMi4yNjcsNDY4LjI2NywyMTIuMjY3eiIvPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNGRkQxNUM7IiBkPSJNMzk4LjkzMyw2NS4wNjdsLTI1LjYsMjUuNmMtNC4yNjcsNC4yNjctNC4yNjcsMTAuNjY3LDAsMTQuOTMzYzQuMjY3LDQuMjY3LDEwLjY2Nyw0LjI2NywxNC45MzMsMA0KCQlsMjUuNi0yNS42YzQuMjY3LTQuMjY3LDQuMjY3LTEwLjY2NywwLTE0LjkzM1M0MDMuMiw2MC44LDM5OC45MzMsNjUuMDY3eiIvPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" />
					<span id="cm-viewCnt">${board.hit}</span>					
				</h6>
				<div class="detail-header justify">
					<span id="cm-writer"><c:out value=""/>${board.user.nickname}</span>
					<input type="hidden" name="user_id" id="user_id" value="${board.user_id}">
					<span id="cm-date"><c:out value="${board.create_date}"/></span>
				</div>
			</div>
			
			<div class="detail-contents">
				<c:out value="${board.contents}"/>
				<c:forEach var="file" items="${file}">
					<div class="img-area">
						<img src="/resources/upload/img/board/${file.file_name}" width="300" height="150"/>
					</div>
				</c:forEach>							
			</div>

			<!-- 댓글 목록 -->
			<div class="comment-box marB_30">
				<div class="comment-items">
				<c:forEach var="comments" items="${comments}">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							<c:out value="${comments.user.nickname}" />
						</div>
						<div>
							<span class="comment-date"><c:out value="${comments.create_date}"/></span>
							<c:if test="${user.user_id == comments.user_id}">
								<span class="light-gray">
									<span id="updateCom"><a href="javascript:void(0)" onClick="update('${comments.comment_id}', '${user.user_id}', '${comments.contents}')">수정</a></span>
									<span id="deleteCom"><a href="javascript:void(0)" onClick="deleteCom('${comments.comment_id}')">삭제</a></span>
								</span>
							</c:if>
						</div>
					</div>
					<div class="comment-contents" id="comment-contents">
						<input type="hidden" id="comment_id" value="${comments.comment_id}">
						<c:out value="${comments.contents}" />
					</div>
				</c:forEach>	
				</div>	
			</div>
			
			<!-- 댓글 작성 -->
			<form method="POST" action="writeCom" name="writeCom" onsubmit="return isValidate(this)">
				<input type="hidden" name=board_id id="board_id" value="${board.board_id}">
				<input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
				<textarea class="comment-c marB_30" id="comment" name="contents" placeholder="댓글을 입력하세요."></textarea>
				<button type="submit" class="btn" id="upload-btn">입력</button>
			</form>
			
			<!-- 하단 버튼 -->
			<div class="justify">
				<div>
					<button class="btn marR_10" onClick="location.href='/community/community-list'">목록</button>
				</div>
				<c:if test="${user.user_id == board.user_id}">
					<div>
						<button class="btn" id="update" onClick="location.href='/community/community-update?board_id=${board.board_id}'">수정</button>
						<button class="btn marR_10" id="delete" onClick="deleteBoard(${board.board_id})">삭제</button>
					</div>
				</c:if>
			</div>
			
		</div>	
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
