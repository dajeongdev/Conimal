<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>코니멀 회원가입을 환영합니다!</title>
	<%@ include file="../include/head.jsp" %>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div style="margin: 100px;">
		<a><!-- 로고 --></a>
		<br><br>
		<h1>안녕하세요, ${param.nickname} 님</h1> <br>
		<h3>코니멀 회원가입을 환영합니다!</h3><br>
		<h3>회원가입이 정상적으로 이루어졌습니다.</h3><br>
		<h3>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</h3><br> 
		<button class="btn login-btn mar0_auto" onclick="location.href='/join/login'">로그인</button>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>