<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function updateCom(id) {
		$.ajax({
			url : "community-update",
			type : "put",
			data : formData,
			success : function() {
				console.log(formData);
			}
		})
	}
	function deleteCom(id) {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			$.ajax({
				url : "community-delete",
				type : "delete",
				data : formData,
				success : function() {
					console.log(formData);
				}
			})
		} else {
			return false;
		}
	}

	function deleteBoard(id) {
		if(confirm("정말 삭제하시겠습니까?") === true) {
			$.ajax({
				url : "/community/community-delete",
				type : "delete",
				data : id,
				success : function() {
					console.log(formData);
					location.href="community/community-detail?board_id="+id;
				}
			})
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
					<img src="#" id="">
					<span id="cm-viewCnt">${board.hit}</span>					
				</h6>
				<div class="detail-header justify">
					<span id="cm-writer"><c:out value=""/>${board.user.nickname}</span>
					<input type="hidden" name="user_id" id="user_id" value="${board.user_id}">
					<span id="cm-date"><c:out value="${board.create_date}"/></span>
				</div>
				<div class ="detail-header justify">
					<c:if test="${user.user_id != board.user_id}">
					<div class="light-gray">
						<span>북마크</span>
						<span>공유</span>
						<span>신고</span>
					</div>
					</c:if>
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

			<!-- 댓글  -->
			<form method="POST" action="writeCom" name="writeCom">
				<input type="hidden" name=board_id id="board_id" value="${board.board_id}">
				<input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
				<input type="text" class="marB_30" id="comment" name="contents" placeholder="댓글을 입력하세요."/>
				<button type="submit" class="btn" id="upload-btn">입력</button>
			</form>
			<div class="comment-box marB_30">
				
				<div class="comment-items">
				<c:forEach var="coms" items="${comments}">
					<div class="comment-info">
						<div class="comment-user">
							<span class="user-img"></span>
							<c:out value="${coms.user.nickname}" />
						</div>
						<div>
							<span class="comment-date"><c:out value="${coms.create_date}"/></span>
							<c:if test="${user.user_id != coms.user_id}">
								<span class="light-gray">
									<span>대댓글달기</span>
									<span>신고</span>
								</span>
							</c:if>
							<c:if test="${user.user_id == coms.user_id}">
								<span class="light-gray">
									<span id="updateCom" onClick="updateCom(${coms.comment_id})">수정</span>
									<span id="deleteCom" onClick="deleteCom(${coms.comment_id})">삭제</span>
								</span>
							</c:if>
						</div>
					</div>
					<div class="comment-contents" id="comment-contents">
						<c:out value="${coms.contents}" />
					</div>
				</c:forEach>	
				</div>	
				
			</div>
			
			
			<!-- 하단 버튼 -->
			<div class="justify">
				<div>
					<button class="btn marR_10" onClick="location.href='/community/community-list'">목록</button>
				</div>
				<c:if test="${user.user_id == board.user_id}">
					<div>
						<button class="btn" id="update" onClick="location.href='/community/community-update?board_id=${board.board_id}'">수정</button>
						<button class="btn marR_10" id="delete" onClick="deleteBoard(${board.board_id})"> 삭제</button>
					</div>
				</c:if>
			</div>
			
		</div>	
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
