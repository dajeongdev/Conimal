<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyBoard</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var idR = /^[a-z0-9]{4,10}$/;
	var nickR = /^[가-힣a-zA-Z0-9]{2,10}$/;
	var mailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var pwdR = /^[A-Za-z0-9]{6,16}$/; 
	
	// 아이디 유효성 검사 (4자리 이상 10자리 이하, 소문자와 숫자 조합)
	$('#user-id').blur(function() {
		var user_id = $('#user-id').val();
		
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
						console.log("아이디 사용 가능!");
						$('#check_id').text("");
						$('#join_submit').attr("disabled", false);
					} else if(user_id == "") { 
						console.log("아이디 미입력");
						$('#check_id').text('아이디를 입력해주세요.');
						$('#check_id').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else {
						console.log("불가능한 아이디");
						$('#check_id').text('아이디는 소문자와 숫자 4~10자리만 가능합니다.');
						$('#check_id').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					}
				}
			}, error : function() {
				console.log("아이디 중복 체크 실패");
				$('#join_submit').attr("disabled", true);
			}
		});
	});
	// 닉네임 유효성 검사 (2자리 이상 10자 이내, 특수문자 제외)
	$('#user-nickname').blur(function() {
		var nick = $('#user-nickname').val();

		$.ajax({
			url : '${pageContext.request.contextPath}/join-form/checkNick?nickname='+nick,
			type : 'get',
			data : { id : nick },
			success : function(data) {
				console.log("1 = 중복, 0 = 사용 가능 : " + data);

				if(data == 1) { // 닉네임 중복!
					console.log("닉네임 사용 불가");
					$('#check_nick').text('이미 사용 중인 닉네임입니다.');
					$('#check_nick').css('color', 'red');
					$('#join_submit').attr("disabled", true);
				} else { // 중복 아님 
					if(nickR.test(nick)) { // 사용 가능 
						console.log("닉네임 사용 가능!");
						$('#check_nick').text("");
						$('#join_submit').attr("disabled", false);
					} else if(nick == "") { 
						console.log("닉네임 미입력");
						$('#check_nick').text('닉네임을 입력해주세요.');
						$('#check_nick').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else {
						console.log("불가능한 닉네임");
						$('#check_nick').text('닉네임은 특수문자 제외 10자리까지만 가능합니다.');
						$('#check_nick').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					}
				}
			}, error : function() {
				console.log("닉네임 중복 체크 실패");
				$('#join_submit').attr("disabled", true);
			}
		});
	});
	// 이메일 중복 검사
	$('#user-email').blur(function() {
		var email = $('#user-email').val();

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
						console.log("이메일 미입력");
						$('#check_email').text('이메일을 입력해주세요.');
						$('#check_email').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} else { 
						console.log("불가능한 이메일");
						$('#check_email').text('이메일을 확인해주세요.');
						$('#check_email').css('color', 'red');
						$('#join_submit').attr("disabled", true);
					} 
				}
			}, error : function() {
				console.log("이메일 중복 체크 실패");
				$('#join_submit').attr("disabled", true);
			}
		});
	});
	// 비밀번호 유효성 검사
	$("#user-pwd").blur(function() {
		var pwd = $("#user-pwd").val()
		
		if(pwdR.test($("#user-pwd").val())) {
			console.log("가능한 비밀번호");
			$("#check_pwd").text("");
		} else if (pwd == "") {
			console.log("비밀번호 미입력");
			$('#check_pwd').text('비밀번호를 입력해주세요.');
			$('#check_pwd').css('color', 'red');
			$('#join_submit').attr("disabled", true);
		} else {
			console.log("불가능한 비밀번호");
			$("#check_pwd").text("영문자와 숫자 조합 6~16자리를 입력해주세요.");
			$("#check_pwd").css("color", "red");
		}
	});
	// 비밀번호 일치 검사
	$("#check-pwd").blur(function() {
		if(($("#user-pwd").val()) != $("#check-pwd").val()) {
			console.log("비밀번호 불일치");
			$("#cf_pwd").text("비밀번호가 일치하지 않습니다.");
			$("#cf_pwd").css("color", "red");
			$('#join_submit').attr("disabled", true);
		} else if($("#check-pwd").val() == "") {
			console.log("비밀번호 미입력");
			$("#cf_pwd").text("비밀번호를 한 번 더 입력해주세요.");
			$("#cf_pwd").css("color", "red");
			$('#join_submit').attr("disabled", true);
		} else {
			console.log("비밀번호 일치!");
			$("#cf_pwd").text("");
			$('#join_submit').attr("disabled", false);
		}
	});
	// 회원가입 버튼 클릭 시 값이 모두 들어가있으면 등록하면서 알림
	$("#join_submit").click(function(){
		if($("#user-nickname").val() != "") {
			if($("#user-id").val() != "") {
				if($("#user-pwd").val() != "") {
					if($("#user-email").val() != "") {
						alert("인증 이메일을 발송하였습니다. 인증 후 코니멀 서비스를 이용해주세요!");
					}
				}
			}
		}
		
	});
});

</script>

<body>
<%@ include file="../include/header.jsp" %>
<div class = "page-container">
	<div class="join-container">
		<h2 class="navy noto-sans marB_60">회원가입</h2>
		<div class="join-box">
			<form method="post">
			<div class="user-input" >
				<input id="user-nickname" type="text" name="nickname" placeholder="닉네임" />
				<div id="check_nick"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input id="user-id" type="text" name="id" placeholder="아이디"/>
				<div id="check_id"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input id="user-pwd" type="password" name="password" placeholder="비밀번호" />
				<div id="check_pwd"></div>
				<p class="err-msg"></p>
			</div>
			<div class="user-input">
				<input id="check-pwd"type="password" placeholder="비밀번호 재입력" />
				<div id="cf_pwd"></div>
				<p class="err-msg" ></p>
			</div>
			<div class="user-input">
				<input id="user-email" type="text" name="email" placeholder="이메일" />
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
