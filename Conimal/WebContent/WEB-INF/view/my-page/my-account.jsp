<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var nickR = /^[가-힣a-zA-Z0-9]{2,10}$/
	var pwdR = /^[A-Za-z0-9]{8,16}$/; 
	var emailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	// 닉네임 유효성 검사
	$("#user-nick").blur(function(){
		var nick = $("#user-nick").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkNick?nickname=' + nick,
			type : 'get',
			data : { id : nick },
			success : function(data) {
				if(data == 1) { // 닉네임 중복
					console.log("중복인 닉네임");
					$("#check_nick").html("이미 사용 중인 닉네임입니다.");
					$("#check_nick").css("display", "red");
				} else {
					if((nickR.test(nick))) {
						console.log("사용 가능한 닉네임");
						$("#check_nick").html("");
						$("#save-btn").attr("disabled", false);
					} else if(nick == "") {
						console.log("닉네임 미입력");
						$("#check_nick").html("닉네임을 입력해주세요.");
						$("#check_nick").css("color", "red");
						$("#save-btn").attr("disabled", true);
					} else {
						console.log("불가능한 닉네임");
						$("#check_nick").html("닉네임은 특수문자 제외 2~10자리까지만 가능합니다.");
						$("#check_nick").css("color", "red");
						$("#save-btn").attr("disabled", true);
					}
				}
			}, error : function() {
				console.log("닉네임 중복 체크 실패");
				$("#save-btn").attr("disabled", true);
			}
		});
	});

	// 이메일 유효성 검사
	$('#user-email').blur(function() {
		var email = $('#user-email').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkEmail?email='+email,
			dataType : 'json',
			type : 'get',
			success : function(data) {
				console.log("1 = 중복, 0 = 사용 가능 : " + data);

				if(data == 1) { 
					$('#check_email').text("");
				} else { // 중복 아님 
					if(emailR.test(email)) { // 사용 가능 
						console.log(emailR.test(email));
						$('#check_email').text("");
						$('#save-btn').attr("disabled", false);
					} else if(email == "") { 
						console.log("이메일 미입력");
						$('#check_email').text('이메일을 입력해주세요.');
						$('#check_email').css('color', 'red');
						$('#save-btn').attr("disabled", true);
					} else { 
						console.log("불가능한 이메일");
						$('#check_email').text('이메일을 확인해주세요.');
						$('#check_email').css('color', 'red');
						$('#save-btn').attr("disabled", true);
					} 
				}
			}, error : function() {
				console.log("이메일 중복 체크 실패");
				$('#save-btn').attr("disabled", true);
			}
		});
	});

	// 비밀번호 유효성 검사
	$("#user-pwd").blur(function() {
		var pwd = $("#user-pwd").val()
		if(pwdR.test($("#user-pwd").val())) {
			console.log("가능한 비밀번호");
			$("#check_pwd").text("");
			$('#save-btn').attr("disabled", false);
		} else if (pwd == "") {
			console.log("비밀번호 미입력");
			$('#check_pwd').text('비밀번호를 입력해주세요.');
			$('#check_pwd').css('color', 'red');
			$('#save-btn').attr("disabled", true);
		} else {
			console.log("불가능한 비밀번호");
			$("#check_pwd").text("영문자와 숫자 조합 8~16자리를 입력해주세요.");
			$("#check_pwd").css("color", "red");
			$('#save-btn').attr("disabled", true);
		}
	});
	// 비밀번호 일치 검사
	$("#check-pwd").blur(function() {
		if(($("#user-pwd").val()) != $("#check-pwd").val()) {
			console.log("비밀번호 불일치");
			$("#cf_pwd").text("비밀번호가 일치하지 않습니다.");
			$("#cf_pwd").css("color", "red");
			$('#save-btn').attr("disabled", true);
		} else if($("#check-pwd").val() == "") {
			console.log("비밀번호 미입력");
			$("#cf_pwd").text("비밀번호를 한 번 더 입력해주세요.");
			$("#cf_pwd").css("color", "red");
			$('#save-btn').attr("disabled", true);
		} else {
			console.log("비밀번호 일치!");
			$("#cf_pwd").text("");
			$('#save-btn').attr("disabled", false);
		}
	});	
	
	// 수정 버튼 클릭
	$("#save-btn").click(function(){
		if($("#user-nickname").val() != "") {
			if($("#user-pwd").val() != "") {
				if($("#check-pwd").val() != "") {
					if($("#user-email").val() != "") {
						alert("수정이 완료되었습니다.");
					}
				} 
			} 
		} 
	});
})
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	<%@ include file="../include/side-menu.jsp" %>
	

	<div class="sub-container">
		<form method="post">
		<h3 class="marB_30">계정정보</h3>
		<input type="hidden" name="user_idx" id="user-idx" value="${user.user_idx}">
		<div class="user-input" >
			<input class="navy" name="user_id" id="user-id" readonly type="text" value="${user.user_id}" />
		</div>
		<div class="user-input">
			<input id="user-nick" name="nickname" type="text" placeholder="닉네임" value="${user.nickname}" />
			<p id="check_nick"></p>
		</div>
		<div class="user-input">
			<input id="user-pwd" name="password" type="password" placeholder="비밀번호" />
			<p id="check_pwd"></p>
		</div>
		<div class="user-input">
			<input id="check-pwd" type="password" placeholder="비밀번호 재입력" />
			<p id="cf_pwd"></p>
		</div>
		<div class="user-input">
			<input class="user-email" name="email" id="user-email" type="text" value="${user.email}" placeholder="이메일" />
			<p id="check_email"></p>
		</div>

		<div class="text-center">
			<button class="btn marT_20 marB_30" type="submit" id="save-btn" disabled>이 정보로 저장</button>
			<p><a href="/my-page/secession" class="text-button" id="secession-btn">회원탈퇴</a></p>
			
		</div>
		</form>

	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
