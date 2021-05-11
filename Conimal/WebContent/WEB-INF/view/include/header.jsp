<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<%@ include file="head.jsp" %>
<style>
.logout {
	margin-left: 30px;
}
</style>
</head> 
<header>
	
	<!-- 비로그인 상태 -->
	<c:if test="${empty user}">
	<div class="logo"><span onClick="document.location.href='/'">MyBaord</span></div>
	<ul class="category">
		<li><div onClick="document.location.href='/community/community-list'">게시판</div></li>
	</ul>
	 
	<a class="header-right" href='/join/login'>로그인 및 회원가입</a>
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${not empty user}">
	<div class="logo"><span onClick="document.location.href='/'">MyBaord</span></div>
	<ul class="category">
		<li><div onClick="document.location.href='/community/community-list'">게시판</div></li>
	</ul>

	<div class="header-right">
		<a class="mypage" href='/my-page/my-account'>정보수정</a>
		<a class="logout" href='/logout'>logout</a>
	</div>
	</c:if>
	

</header>