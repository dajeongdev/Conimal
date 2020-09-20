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
	
	<!-- 비로그인 상태 -->
	<c:if test="${empty sessionScope.UI}">
	<div class="logo"><span><a href="main">코니멀</a></span></div>
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
	<div class="logo"><span><a href="main">코니멀</a></span></div>
	<ul class="category">
		<li><a href="">코니멀소개</a></li>
		<li><a href="/pet_dictionary/pet_dictionary">펫과사전</a></li>
		<li><a href="/community/community-list">커뮤니티</a></li>
	</ul>

	<div class="header-right">
		<div class="btn login-btn"><a href=/mypage/my-page">마이 페이지</a></div>
		<!-- 로그아웃 -->
	</div>
	</c:if>
	
</header>