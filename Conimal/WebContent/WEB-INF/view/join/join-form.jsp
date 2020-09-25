<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	// 아이디 유효성 검사 (4자리 이상 10자리 이하, 소문자와 숫자 조합)
	$('#user_id').blur(function() {
		var user_id = $('#user_id').val();
		var idR = /^[a-z0-9]{4,10}$/;

		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkId?user_id='+user_id,
			type : 'get',
			data : { id : user_id },
			success : function(data) {
				console.log("1 = 중복, 0 = 사용 가능 : " + data);

				if(data == 1) { // 아이디 중복
					$('#check_id').text('이미 사용 중인 아이디입니다.');
					$('#check_id').css('color', 'red');
					$('#join_submit').attr("disabled", true);
				} else { // 중복 아님 
					if(idR.test(user_id)) { // 사용 가능 
						$('#check_id').text("");
						$('#join_submit').attr("disabled", false);
					} else if(user_id == "") { 
						$('#check_id').text('아이디를 입력해주세요.');
						$('#check_id').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else {
						$('#check_id').text('아이디는 소문자와 숫자 4~10자리만 가능합니다.');
						$('#check_id').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					}
				}
			}, error : function() {
				console.log("아이디 중복 체크 실패");
			}
		});
	});
	// 닉네임 유효성 검사 (2자리 이상 10자 이내, 특수문자 제외)
	$('#nickname').blur(function() {
		var nick = $('#nickname').val();
		var nickR = /^[a-z0-9]{2,10}$/;

		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkNick?nickname='+nick,
			type : 'get',
			data : { id : nick },
			success : function(data) {
				console.log("1 = 중복, 0 = 사용 가능 : " + data);

				if(data == 1) { // 닉네임 중복!
					$('#check_nick').text('이미 사용 중인 닉네임입니다.');
					$('#check_nick').css('color', 'red');
					$('#join_submit').attr("disabled", true);
				} else { // 중복 아님 
					if(nickR.test(nick)) { // 사용 가능 
						$('#check_nick').text("");
						$('#join_submit').attr("disabled", false);
					} else if(nick == "") { 
						$('#check_nick').text('닉네임을 입력해주세요.');
						$('#check_nick').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else {
						$('#check_nick').text('닉네임은 특수문자 제외 10자리까지만 가능합니다.');
						$('#check_nick').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					}
				}
			}, error : function() {
				console.log("닉네임 중복 체크 실패");
			}
		});
	});
	// 이메일 중복 검사
	$('#email').blur(function() {
		var email = $('#email').val();
		var mailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkEmail?email='+email,
			type : 'get',
			data : { id : email },
			dataType : 'json',
			success : function(data) {
				console.log("1 = 중복, 0 = 사용 가능 : " + data);

				if(data == 1) { // 이메일 중복!
					$('#check_email').text('이미 사용 중인 이메일입니다.');
					$('#check_email').css('color', 'red');
					$('#join_submit').attr("disabled", true);
				} else { // 중복 아님 
					if(mailR.test(email)) { // 사용 가능 
						console.log(mailR.test(email));
						$('#check_email').text("");
						$('#join_submit').attr("disabled", false);
					} else if(email == "") { 
						$('#check_email').text('이메일을 입력해주세요.');
						$('#check_email').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else { 
						$('#check_email').text('이메일을 확인해주세요.');
						$('#check_email').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} 
				}
			}, error : function() {
				console.log("이메일 중복 체크 실패");
			}
		});
	});
	// 비밀번호 유효성 검사
	$("#password").blur(function() {
		var pwd = $("#password").val()
		var pwdR = /^[A-Za-z0-9]{8,16}$/; 
		
		if(pwdR.test($("#password").val())) {
			console.log("가능한 비밀번호");
			$("#check_pwd").text("");
		} else if (pwd == "") {
			$('#check_pwd').text('비밀번호를 입력해주세요.');
			$('#check_pwd').css('color', 'red');
			$('#join_submit').attr("disabled", true);
		} else {
			console.log("불가능한 비밀번호");
			$("#check_pwd").text("영문자와 숫자 조합 8~16자리를 입력해주세요.");
			$("#check_pwd").css("color", "red");
		}
	});
	// 비밀번호 일치 검사
	$("#check-pwd").blur(function() {
		if(($("#user-pwd").val()) != $("#check-pwd").val()) {
			console.log("비밀번호 불일치");
			$("#cf_pwd").text("비밀번호가 일치하지 않습니다.");
			$("#cf_pwd").css("color", "red");
		} else {
			$("#cf_pwd").text("");
		}
	});
});

</script>

<body>
<%@ include file="../include/header.jsp" %>
<div class = "page-container">
	<div class="join-container">
		<div class="join-box">
			<form method="post">
			<div class="user-input" >
				<input id="user-nickname" type="text" name="nickname" placeholder="닉네임" />
				<div id="check_nick"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input id="user-id" type="text" name="user_id" placeholder="아이디"/>
				<div id="check_id"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input id="user-pwd" type="text" name="password" placeholder="비밀번호" />
				<div id="check_pwd"></div>
				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<input id="check-pwd"type="text" placeholder="비밀번호 재입력" />
				<div id="cf_pwd"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input class="user-email" id="user-email" name="email" type="text" placeholder="이메일" />
				<div id="check_email"></div>
				<p class="err-msg"></p>
			</div>
	
			<button class="btn marT_20" id="join_submit">회원가입</button>
			</form>
		</div>
	
	</div>
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
