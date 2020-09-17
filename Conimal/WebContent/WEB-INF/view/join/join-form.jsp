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
	<div class="join-container">
		<div class="join-box">
			
			<div class="user-input" >
				<input id="user-nickname" type="text" placeholder="닉네임" />
				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<input id="user-id" type="text" placeholder="아이디" />
				<p class="err-msg">영문 및 숫자조합, 4자리 이상 10자리 이하</p>
			</div>
			<div class="user-input">
				<input id="user-pwd" type="text" placeholder="비밀번호" />
				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<input id="check-pwd"type="text" placeholder="비밀번호 재입력" />
				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<form action="sendCode.do" method="post">
					<input class="user-email" id="user-email" type="text" placeholder="이메일" />
					<button class="btn auth_btn marT_20" id="login" name="submit" type="button">전송</button>
				</form>

				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<form action="emailAuth.do" method="post">
					<input id="auth-email" type="text" placeholder="이메일 인증 코드" />			
					<button class="btn auth_btn marT_20" id="login" name="submit" type="button">인증</button>
				</form>
				<p class="err-msg"></p>
			</div>
	
			<a class="btn marT_20" id ="login" href="${pageContext.request.contextPath}/join/join-form">회원가입</a>

		</div>
	
	</div>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
