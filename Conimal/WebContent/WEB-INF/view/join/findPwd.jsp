<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

</script>
<body>
<%@ include file="../include/header.jsp" %>
<div class="page-container">
	<div class="">
		<h3>비밀번호 찾기</h3>
		<p>인증된 이메일만 사용 가능합니다.</p>
	</div>
	
	<div id="search">
		<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요.">
		<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
		<div id="btn">
			<button class="btn mar0_auto" id="find-btn" onClick="find()">확인</button>
		</div>
	</div>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>