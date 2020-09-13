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
	
	
	
	<%@ include file="../include/side-menu.jsp" %>
	

	<div class="sub-container">
	
		<h3 class="marB_30">계정정보</h3>
		
		<div class="user-input" >
			<input class="navy" id="user-nickname" readonly type="text" value="아이디(변경불가)" />
			<p class="err-msg"></p>
		</div>
		<div class="user-input">
			<input id="user-id" type="text" placeholder="닉네임" />
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
			<input class="user-email" id="user-email" type="text" placeholder="이메일" />
			<button class="btn auth_btn marT_20" id ="login">인증</button>
			<p class="err-msg"></p>
		</div>
		<div class="user-input">
			<input id="auth-email" type="text" placeholder="비밀번호 재입력" />
			<p class="err-msg"></p>
		</div>

		<div class="text-center">
			<button class="btn marT_20 marB_30" id ="save">이 정보로 저장</button>
			<p><a href="#" class="text-button">회원탈퇴</a></p>
			
		</div>
		

	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
