<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%@ include file="../include/head.jsp"%>
</head>

<body>
	<%@ include file="../include/header.jsp"%>


	<div class="page-container my-page clr">



		<%@ include file="../include/side-menu.jsp"%>

		<div class="sub-container conimal">
			<div class="my-conimals">
				<h3 class="marB_30">반려동물</h3>
				<div class="conimal">
					<div class="profile">
						<img
							src="${pageContext.request.contextPath}/resources/image/conimal-profile.png">
					</div>
					<p class="name">사자</p>
				</div>
				<div class="conimal">
					<div class="profile">
						<img
							src="${pageContext.request.contextPath}/resources/image/conimal-profile.png">
					</div>
					<p class="name">하태</p>
				</div>
				<div class="conimal">
					<div class="profile"></div>
					<p class="name">추가등록</p>
				</div>

			</div>

			<div class="conimal-detail">
				<div class="conimal-header">
					<div class="title">
						<h3>사자</h3>
						<span>고양이</span>
					</div>
					<span class="edit-conimal">반려동물 정보 수정하기 -></span>
				</div>


				<div class="conimal-info">
					<div class="info-item">
						<h6>생년월일</h6>
						<span>2020년 8월 18일</span>
					</div>
					<div class="info-item">
						<h6>입양날짜</h6>
						<span>2020년 8월 18일</span>
					</div>
					<div class="info-item">
						<h6>성별</h6>
						<span>2020년 8월 18일</span>
					</div>
				</div>


				<div class="conimal-intended">
					<h6 class="marB_30 bt">참여한 펫과사전</h6>
					<div class="used-product-list">
						<div class="used-product">
							<img
								src="${pageContext.request.contextPath}/resources/image/product-img.png">
							<div class="detail">
								<p class="kind">고양이</p>
								<h6 class="product-name">로얄캐닌 캣 인도어</h6>
								<p class="navy">
									<img
										src="${pageContext.request.contextPath}/resources/image/check.png"">
									<span>매우 잘 먹어요</span>
								</p>
								<p class="">사자의 빼이보릿 푸드!</p>
								<p class="date">2020년 8월 18일 투표</p>
								<div class="poll-bar"></div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>


	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
