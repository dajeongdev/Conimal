<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String hostname = request.getScheme() + "://" + request.getServerName() +":" + request.getServerPort() + "/conimal/"; %>
<c:set var="hostname" value="<%=hostname%>"/>
<head>
<%@ include file="head.jsp" %>
</head> 

<header>
	
	<!-- 비로그인 상태 -->
	<c:if test="${empty user}">
	<div class="logo"><span onClick="document.location.href='/'">코니멀</span></div>
	<ul class="category">
		<li><div onClick="document.location.href='#'">코니멀소개</div></li>
		<li><div onClick="document.location.href='/pet_dictionary/pet_dictionary'">펫과사전</div></li>
		<li><div onClick="document.location.href='/community/community-list'">커뮤니티</div></li>
	</ul>
	 
	 <div class="header-right">
		<a href='/join/login'>로그인 및 회원가입</a>
	</div>
	 
	
		
	
	
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${not empty user}">
	<div class="logo"><span onClick="document.location.href='/'">코니멀</span></div>
	<ul class="category">
		<li><div onClick="document.location.href='#'">코니멀소개</div></li>
		<li><div onClick="document.location.href='/pet_dictionary/pet_dictionary'">펫과사전</div></li>
		<li><div onClick="document.location.href='/community/community-list'">커뮤니티</div></li>
	</ul>

	<div class="header-right">
		<div class="btn mypage-btn"><button onclick="location.href='/my-page/my-page'">마이페이지</button></div>
		<div class="btn logout-btn"><button onclick="location.href='/logout'">Logout</button></div>
	</div>
	</c:if>
	

</header>