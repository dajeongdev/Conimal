<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%@ include file="../include/head.jsp"%>
</head>

<body>
	<%@ include file="../include/header.jsp"%>


	<div class="page-container my-page clr">



		<%@ include file="../include/side-menu.jsp"%>

		<div class=" sub-container">
			<h3 class="marB_30">반려동물</h3>
			<div class="badge-box marB_50">
				<div class="my-badge">
					<div class="badge"></div>
					<p class="badge-title">사자</p>
				</div>
				<div class="my-badge">
					<div class="badge"></div>
					<p class="badge-title">하태</p>
				</div>
				<div class="my-badge">
					<div class="badge"></div>
					<p class="badge-title">추가등록</p>
				</div>
			
			</div>
			
			<div class="conimal-detail">
				<div class="conimal-top">
					<h3>사자</h3>
					<span>고양이</span>
					<span>반려동물 정보 수정하기 -></span>
				</div>
				
				
				<div class="conimal-info">
					<div>
						<span>생년월일</span>
						<span>2020년 8월 18일</span>
					</div>
					<div>
						<span>생년월일</span>
						<span>2020년 8월 18일</span>
					</div>
					<div>
						<span>생년월일</span>
						<span>2020년 8월 18일</span>
					</div>
				</div>
				
				<div class="conimal-intended">
				
				
				</div>
			
			</div>

		</div>


	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
