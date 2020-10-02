<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>

<body>
<%@ include file="../include/header.jsp" %>
<div class = "page-container">
	<div class="join-container">
		
		<h2 class="navy noto-sans marB_60">회원가입</h2>
			
		<div class="join-api-box">
			<button class="login-api" onclick="location.href='/join/join-form'">이메일로 회원가입</button>
			<button class="login-api" id ="google-api">구글 아이디로 회원가입</button>
			<button class="login-api" id ="kakao-api">카카오 아이디로 회원가입</button>
		</div>
	
	</div>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
