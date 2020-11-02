<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	/*var naver-api = new naver-api("DphfmDygX4WFkf8nghMJ", "http://localhost:8090/hansub_project/login_result");    // Client ID, CallBack URL 삽입
	// 단 'localhost'가 포함된 CallBack URL
	var state = naver-api.getUniqState();
	
	naver-api.setButton("white", 4, 40);
	naver-api.setDomain("http://localhost:8080/join/login"); // URL
	naver-api.setState(state);
	naver-api.setPopup();
	naver-api.init_naver_id_login();*/
</script>
<body>
<%@ include file="../include/header.jsp" %>
<div class = "page-container">
	<div class="join-container">
		
		<h2 class="navy noto-sans marB_60">회원가입</h2>
			
		<div class="join-api-box">
			<button class="login-api" onclick="location.href='/join/join-form'">이메일로 회원가입</button>
			<button class="login-api" id ="google-api">구글 아이디로 회원가입</button>
			<button class="login-api" id ="kakao-api">카카오 아이디로 회원가입</button>
			<button class="login-api" id ="naver-api">네이버 아이디로 회원가입</button>
		</div>
	
	</div>

</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
