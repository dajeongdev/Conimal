<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<% String fullName = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + "/careMe/"; %>
<c:set var="full_name" value="<%=fullName%>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$("#comment").on("keypress", function(e){
		if(e.keyCode === 13) {
			writeCom.submit();
		} 
	});
	function updateCom(idx) {
		location.href='updateCom?comment_idx='+idx;
	}
	function deleteCom(idx) {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			var community_idx = $("#community_idx").val();
			location.href='deleteCom?comment_idx='+idx;
		} else {
			return false;
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
					<span id="cm-title"><c:out value="${community.title}"/></span>
					<img src="#" id="">
					<span id="cm-viewCnt">${community.hit}</span>					
				</h6>
				<div class="detail-header justify">
					<span id="cm-writer"><c:out value=""/>${community.user.nickname}</span>
					<input type="hidden" name="user_idx" id="user_idx" value="${community.user_idx}">
					<span id="cm-date"><c:out value="${community.reg_date}"/></span>
				</div>
				<div class ="detail-header justify">
					<ul class="tags">
						<li class="tag-name">
							<span>
								<c:forEach var="tag" items="${tags}">
									<span class="hasgtag">#<c:out value="${tag.tag_name}"/></span>
								</c:forEach>
							</span>
						</li>
					</ul>
					<c:if test="${user.user_idx != community.user_idx}">
					<div class="light-gray">
						<span>북마크</span>
						<span>공유</span>
						<span>신고</span>
					</div>
					</c:if>
				</div>
			</div>
			
			<div class="detail-contents">
				<c:out value="${community.content}"/>
				<div class="img-area">
					<img width="100" height="70" src="${full_name}${file[0].file_path}">
				</div>							
			</div>

			<!-- 덧글  -->
			<form method="POST" action="writeCom" name="writeCom">
				<input type="hidden" name="community_idx" id="community_idx" value="${community.community_idx}">
				<input type="hidden" name="user_idx" id="user_idx" value="${user.user_idx}">
				<input type="text" class="marB_30" id="comment" name="content" placeholder="덧글을 입력하세요"/>
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
							<span class="comment-date"><c:out value="${coms.reg_date}"/></span>
							<c:if test="${user.user_idx != coms.user_idx}">
								<span class="light-gray">
									<span>대댓글달기</span>
									<span>신고</span>
								</span>
							</c:if>
							<c:if test="${user.user_idx == coms.user_idx}">
								<span class="light-gray">
									<span id="updateCom" onclick="updateCom(${coms.comment_idx})">수정</span>
									<span id="deleteCom" onclick="deleteCom(${coms.comment_idx})">삭제</span>
								</span>
							</c:if>
						</div>
					</div>
					<div class="comment-contents" id="comment-contents">
						<c:out value="${coms.content}" />
					</div>
				</c:forEach>	
				</div>	
				
				
			</div>
			
			
			<!-- 하단 버튼 -->
			<div class="justify">
				<div>
					<button class="btn marR_10" onClick="location.href='/community/community-list'">목록</button>
					<button class="btn marR_10">이전 글</button>
					<button class="btn">다음 글</button>
				</div>
				<c:if test="${user.user_idx == community.user_idx}">
					<div>
						<button class="btn" id="update">수정</button>
						<button class="btn marR_10" id="delete">삭제</button>
					</div>
				</c:if>
			</div>
			



			
		</div>	
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
