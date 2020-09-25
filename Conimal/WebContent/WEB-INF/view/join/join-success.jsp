<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코니멀 회원가입을 환영합니다!</title>
</head>
<body>
	<div style="margin: 100px;">
		<a><!-- 로고 --></a>
		<br><br>
		<h1>안녕하세요, ${param.user_id} 님</h1> <br>
		<h3>코니멀 회원가입을 환영합니다!</h3><br>
		<h3>회원가입이 정상적으로 이루어졌습니다.</h3><br>
		<h3>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</h3><br> 
		<a href="${pageContext.request.contextPath}/join/login">로그인 하러 가기</a>
	</div>
</body>
</html>