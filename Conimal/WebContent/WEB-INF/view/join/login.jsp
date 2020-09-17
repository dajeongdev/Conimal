<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>

<body>
<%@ include file="../include/header.jsp" %>
<div class = "page-container">


	<div class="login-wrapper">

		<h4 class="marB_20">코니멀에 오신 것을 환영합니다</h4>
		<p class="marB_45 bold">로그인을 하시면 펫과사전과 커뮤니티에 참여하실 수 있습니다</p>
		<div class="login-container">
			<div class="login-box">		
				<div><input class="user-input" type="text" id="user-id" placeholder="아이디"/></div>
				<div><input class="user-input" type="password" id="user-pwd"placeholder="비밀번호"/></div>
				<button class="btn mar0_auto" id ="login-btn">로그인</button>
			</div>
			
			<div class="login-api-box">
				<button class="login-api" id="google-api">구글 아이디로 로그인</button>
				<button class="login-api" id="kakao-api">카카오 아이디로 로그인</button>
			</div>
		</div>
		<div class="user-find-box">
			<a href ="#" class="text-button">아이디 / 비밀번호 찾기</a>
			<a href ="/join/join-select" class="text-button">회원가입</a>
		</div>
	
	</div>
	
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
