<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>petdic</title>
    <%@ include file="../include/head.jsp" %>
  </head>
  <body>
    <%@ include file="../include/header.jsp" %>
    <div class="petdic-container">
      <div class="petdic-intro">
        <h3 class="title">펫과사전</h3>
      </div>
      <ul class="petdic-categories">
        <li class="petdic-category">
          <input
            id="option-total"
            type="radio"
            name="category"
            value="total"
            checked
          /><label for="option-total"><span class="btn">전체</span></label>
        </li>
        <li class="petdic-category">
          <input
            id="option-dog"
            type="radio"
            name="category"
            value="dog"
          /><label for="option-dog"><span class="btn">강아지</span></label>
        </li>
        <li class="petdic-category">
          <input
            id="option-cat"
            type="radio"
            name="category"
            value="cat"
          /><label for="option-cat"><span class="btn">고양이</span></label>
        </li>
      </ul>
    </div>
    
    
    <section class="product-section">
  

  
    <div class="modal">
    	<div class="backdrop"></div>
    	<div class="modal-content modal-poll">
    	<div class="modal-poll-img"><img /></div>
    	<div class="modal-poll-info">
    		<div class="poll-info-header">
    		<div class="product-kinds ">
                  <h3 class="product-kind">고양이</h3>
                  
              </div>
              <h2 class="item-name">모데르나 로데르너 1 이동장</h2>
    		</div>
    		
              <div class="poll-info-content">
    			<h3 class="content-title">투표가능 반려동물</h3>
    			<ul class="votable-animals">
    				<li class="votable-animal">
    					<input id="animal-option-1" type="radio" name="animal-kind" value="lion"/>
    					<label for="animal-option-1" class="animal-option-img"><img src="${pageContext.request.contextPath}/resources/image/product.png"/> </label>
    					<label for="animal-option-1"><span>사자 </span> </label>
    				</li>
    				<li class="votable-animal">
    					<input id="animal-option-2" type="radio" name="animal-kind" value="tiger"/>
    					<label for="animal-option-2" class="animal-option-img"><img src="${pageContext.request.contextPath}/resources/image/product.png"/> </label>
    					<label for="animal-option-2"><span>호랑이 </span></label>
    				</li>
    			</ul>
    		</div>
    		<div class="poll-info-content">
    			<h3 class="content-title">투표 선택지</h3>
    			<ul class="poll-options">
    			<li><input id="poll-option-1" type="radio" name="product-rating"/>
    			<label for="poll-option-1">매우 잘 먹어요 </label></li>
    			<li><input id="poll-option-2" type="radio" name="product-rating"/>
    			<label for="poll-option-2">잘 먹어요 </label></li>
    			<li><input id="poll-option-3" type="radio" name="product-rating"/>
    			<label for="poll-option-3">안 먹어요 </label></li>
    			
    			</ul>
    		</div>
    		<div class="poll-info-content">
    			<h3 class="content-title">메모 남기기</h3>
    			<h3 class="memo-msg">다른 사람들에게 보여지지 않으며 마이페이지에서 확인 하실 수 있습니다.</h3>
    			<textarea class="memo-area"/></textarea>
    		</div>
    		
    		</div>	
    		
    		
    	
    	</div>
    	</div>
    </div>
    
    
    
    <div class="product-cards-container">
      <article class="product-card">
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/image/product.png" alt="item"></div>
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
          <div class="product-card-img"><img src="${pageContext.request.contextPath}/resources/image/product.png" alt="item"></div>
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
  <%@ include file="../include/footer.jsp" %>
    
  </body>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> 
</html>
