<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
			
		// 모달창 불러오기 
		$("#find-btn").click(function() {
			if($("#email").val() == "") {
				$("#email_check").text("이메일을 입력해주세요.");
				$("#email_check").css("color", "red");
				$("#modal").hide();
			} else {
				console.log("modal show");
				$("#email_check").text("");
				$("#modal").show();
			}
		});
		// 모달창 닫기
		$("#close").click(function(){
			console.log("modal hide1");
			$("#modal").hide();
		});
		
	
		// id값을 저장하기 위한 변수
		var id = "";
		// 아이디 값을 받아 출력하는 ajax
		$("#find-btn").click(function(){
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/join/findId?email=" + $("#email").val(),
				success : function (data) {
					console.log(data);
					if(data == 0) {
						$("#id_value").text("이메일을 확인해주세요.");
					} else {
						$("#id_value").text(data);
						id = data;
					}
				}
			});
		});
	});
</script>

<body>
	<%@ include file="idConfirmModal.jsp" %>
	<%@ include file="../include/header.jsp" %>
	<div class="page-container">
		<div class="find">
			<h3>아이디 찾기</h3>
			<p>인증된 이메일만 사용 가능합니다.</p>
	
		<div id="search">
			<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요.">
			<div id="email_check"></div>
			<div id="btn">
				<button class="btn mar0_auto" id="find-btn">확인</button>
			</div>
		</div>
		</div>
		
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>