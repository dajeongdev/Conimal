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
    	<div class="modal-content"></div>
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
