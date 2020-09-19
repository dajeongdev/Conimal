<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="kr.com.conimal.model.command.LoginCommand" %>
<% String hostname = request.getScheme() + "://" + request.getServerName() +":" + request.getServerPort() + "/conimal/"; %>
<c:set var="hostname" value="<%=hostname%>"/>

<head>
<%@ include file="head.jsp" %>
</head> 

<header>
	<div class="logo"><span>코니멀</span></div>
	<!-- 비로그인 상태 -->
	<c:if test="${empty sessionScope.UI}">
	<ul class="category">
		<li><a href="">코니멀소개</a></li>
		<li><a href="/pet_dictionary/pet_dictionary">펫과사전</a></li>
		<li><a href="/community/community-list">커뮤니티</a></li>
	</ul>

	<div class="header-right">
		<div class="btn login-btn"><a href="/join/login">Login</a></div>
	</div>
	</c:if>
	<!-- 로그인 상태 -->
	<c:if test="${not empty sessionScope.UI}">
	<ul class="category">
		<li><a href="">코니멀소개</a></li>
		<li><a href="/pet_dictionary/pet_dictionary">펫과사전</a></li>
		<li><a href="/community/community-list">커뮤니티</a></li>
	</ul>

	<div class="header-right">
		<div class="btn login-btn"><a href=/conimal/view/mypage/my-page">마이 페이지</a></div>
		<!-- 로그아웃 -->
	</div>
	</c:if>
	
</header>