<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	var nickR = /^[a-z0-9]{2,10}$/;
	var pwdR = /^[A-Za-z0-9]{8,16}$/; 
	var emailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	function update(e) {
		if(e == 'Nickname') {
			if(nickR.test($("#user-nickname").val())) {
				$("#check_nick").css("display", "none");
				updating(e);
			} else {
				console.log("사용 불가한 닉네임");
				$("#check_nick").html("영문 2~10자리만 가능합니다.");
			}
		} else if(e == 'Password') {
			if(pwdR.test($("#user-password").val())) {
				$("#check_pwd").css("display", "none");
				updating(e);
			} else {
				console.log("사용 불가한 비밀번호");
				$("#check_pwd").html("영문 8~16자리만 가능합니다.");
			}
		} else if (e == 'Email') {
			if(emailR.test($("#user-email").val())) {
				$("#check_email").css("display", "none");
				updating(e);
			} else {
				console.log("사용 불가한 이메일");
				$("#check_email").html("이메일 주소를 확인해주세요.");
			}
		}
	}

	function updating(e) {
		$.ajax({
			url : '${pageContext.request.contextPath}/my-account/update' + e + '',
			type : 'post',
			data : $("#update").serialize(),
			success : function(data) {
				alert("수정이 완료되었습니다.");
			}
		});
	}
})
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	<%@ include file="../include/side-menu.jsp" %>
	

	<div class="sub-container">
		<form id="update">
		<h3 class="marB_30">계정정보</h3>
		
		<div class="user-input" >
			<input class="navy" name="user_id" id="user-id" readonly type="text" value="${user.user_id}" />
		</div>
		<div class="user-input">
			<input id="user-nick" name="nickname" type="text" onclick="update('Nickname')" placeholder="닉네임" value="${user.nickname}" />
			<p id="check_nick"></p>
		</div>
		<div class="user-input">
			<input id="user-pwd" name="password" type="text" onclick="update('Password')" placeholder="비밀번호" />
			<p id="check_pwd"></p>
		</div>
		<div class="user-input">
			<input id="check-pwd"type="text" placeholder="비밀번호 재입력" />
			<p id="cf_pwd"></p>
		</div>
		<div class="user-input">
			<input class="user-email" name="email" id="user-email" onclick="update('Email')" type="text" value="${user.email}" placeholder="이메일" />
			<p id="check_email"></p>
			<button class="btn auth_btn marT_20" id="auth-btn">인증</button>
		</div>

		<div class="text-center">
			<button class="btn marT_20 marB_30" type="submit" id="save-btn">이 정보로 저장</button>
			<p><a href="/my-page/secession" class="text-button" id="secession-btn">회원탈퇴</a></p>
			
		</div>
		</form>

	</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
