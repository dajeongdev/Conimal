<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="include/head.jsp" %>
</head>

<body>
	<%@ include file="include/header.jsp" %>
	
	
        <section class="main-pt1-header">
          <div class="main-header-content">
            <h1>반려동물과의 건강한 삶을<br>
            이야기하는 커뮤니티,코니멀
          </h1>
            <h2>
              다시 생각해봐 이게 우리 최선은 아닐 거잖아<br>
왜 애써 네 맘을 숨겨 자 나를 봐 이렇게 금방 낚이는 시선<br>
좀 더 가까이 그렇게 말고 이렇게 포근하게<br>
작은 내 심장 소리에 감동하게 함께 좀 더 있자
            </h2>
            
          </div>
        </section>
  
  <div class="info-card-container main-info">
    <div class="info-card">
      <span>Icon</span>
      <h1>반려동물의 정보를<br>기록하세요</h1>
      <h2>생일, 입양일자, 좋아하는 것은 무엇이고<br> 싫어하는 것은 무엇인지</h2>
      <h3>반려동물 등록하기</h3>
    </div>
    
    <div class="info-card">
      <span>Icon</span>
      <h1>사용해본 제품의 정보를<br> 공유하세요</h1>
      <h2>반려동물이 맛있게 먹었던 사료, 정말 좋아하던 용품들<br> 혹은 너무 싫어하던 제품들까지</h2>
      <h3>펫과사전 확인하기</h3>
    </div>
    
    <div class="info-card">
      <span>Icon</span>
      <h1>반려인의 경험을<br>나누세요</h1>
      <h2>처음 키우는 반려동물을 맞을 준비는 어떻게 하는지<br> 어떤 책을 봤던 게 도움이 되었는지</h2>
      <h3>커뮤니티 확인하기</h3>
    </div>
  </div>

  <section class="main-pt2-header">
    <div class="main-pt2-img"></div>
    <div class="main-pt2-content">
      <h1>혹시 여기에<br> 구매해 본 제품이 있나요?</h1>
      <h2>쇼핑몰에서는 별점 만점인 제품도 우리 애들은 관심이 없을 때,<br> 보호자는 마음도 지갑도 너덜너덜해집니다.
      <br>
        <span>코니멀은 쇼핑몰의 후기와 다른, 새로운 지표가 고민했습니다.</span></h2>
      
      <ul class="index-lists">
        <li>내 반려동물의 호불호 투표하기</li>
        <li>한 제품 당 백마리 반려동물의 응답이 모이면 결과 오픈</li>
        <li>응답이 누적될 수록 정확도 UP, UP!</li>
      </ul>
      <button class="btn look-around marT_30" id="look-around">펫과사전 확인하기</button>
      
    </div>
  </section>

  <section class="product-section">
    
    <div class="product-cards-container">
      <article class="product-card">
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
          <div class="product-card-content">
              <div class="product-kinds">
                  <h3 class="product-kind">고양이</h3>
                <div class="vl"></div>
              </div>
            <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
            <div class="poll-bar"></div>
            <h2 class="poll-status">투표 진행중</h2>
            <h3 class="stacked-number">누적 참여 91마리</h3>
              
          </div>
      </article>
     <article class="product-card">
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
          <div class="product-card-content">
              <div class="product-kinds">
                  <h3 class="product-kind">고양이</h3>
                <div class="vl"></div>
              </div>
            <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
            <div class="poll-bar"></div>
            <h2 class="poll-status">투표 진행중</h2>
            <h3 class="stacked-number">누적 참여 91마리</h3>
              
          </div>
      </article>
     <article class="product-card">
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
          <div class="product-card-content">
              <div class="product-kinds">
                  <h3 class="product-kind">고양이</h3>
                <div class="vl"></div>
              </div>
            <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
            <div class="poll-bar"></div>
            <h2 class="poll-status">투표 진행중</h2>
            <h3 class="stacked-number">누적 참여 91마리</h3>
              
          </div>
      </article>
     <article class="product-card">
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
          <div class="product-card-content">
              <div class="product-kinds">
                  <h3 class="product-kind">고양이</h3>
                <div class="vl"></div>
              </div>
            <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
            <div class="poll-bar"></div>
            <h2 class="poll-status">투표 진행중</h2>
            <h3 class="stacked-number">누적 참여 91마리</h3>
              
          </div>
      </article>

</div>
<div class="product-cards-container">
  <article class="product-card">
      <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
      <div class="product-card-content">
          <div class="product-kinds">
              <h3 class="product-kind">고양이</h3>
            <div class="vl"></div>
          </div>
        <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
        <div class="poll-bar"></div>
        <h2 class="poll-status">투표 진행중</h2>
        <h3 class="stacked-number">누적 참여 91마리</h3>
          
      </div>
  </article>
 <article class="product-card">
      <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
      <div class="product-card-content">
          <div class="product-kinds">
              <h3 class="product-kind">고양이</h3>
            <div class="vl"></div>
          </div>
        <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
        <div class="poll-bar"></div>
        <h2 class="poll-status">투표 진행중</h2>
        <h3 class="stacked-number">누적 참여 91마리</h3>
          
      </div>
  </article>
 <article class="product-card">
      <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
      <div class="product-card-content">
          <div class="product-kinds">
              <h3 class="product-kind">고양이</h3>
            <div class="vl"></div>
          </div>
        <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
        <div class="poll-bar"></div>
        <h2 class="poll-status">투표 진행중</h2>
        <h3 class="stacked-number">누적 참여 91마리</h3>
          
      </div>
  </article>
 <article class="product-card">
      <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/imgs/temp.jpg" alt="item"></div>
      <div class="product-card-content">
          <div class="product-kinds">
              <h3 class="product-kind">고양이</h3>
            <div class="vl"></div>
          </div>
        <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
        <div class="poll-bar"></div>
        <h2 class="poll-status">투표 진행중</h2>
        <h3 class="stacked-number">누적 참여 91마리</h3>
          
      </div>
  </article>

</div>

  </section>

  <section class="community-section marT_50">
    <div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
				<p class="sub">지금 코니멀 커뮤니티에서 사용되고 있는 해시태그를 확인하고 대화에 참여해보세요</p>
				<div class="tags">
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
					<div class="tag-name">
						<span>#</span>
						<span>asdf</span>
					</div>
				</div>
			</div>

			<div class="board-list" id="noticeTable">
				<div class="board-item">
					<div class="board-first-raw">
						<div>
							<span class="title bold">게시판 리스트: 콘텐츠 제목1</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">1</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">사용자</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
						</div>
						<span class="date bold">2020.06.25</span>
					</div>
				</div>
				<div class="board-item">
					<div class="board-first-raw">
						<div>
							<span class="title bold">게시판 리스트: 콘텐츠 제목1</span>
							<span class="chat-icon"></span>
							<span class="view-cnt">1</span>
							<span class="new">new</span>
						</div>
						<span class="user bold">사용자</span>
					</div>
					<div class="board-second-raw">				
						<div class="tags">
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
							<div class="tag-name">
								<span>#</span>
								<span>asdf</span>
							</div>
						</div>
						<span class="date bold">2020.06.25</span>
					</div>
				</div>
				
							
			</div>
  </section>
  
	<%@ include file="include/footer.jsp" %>
</body>
</html>
