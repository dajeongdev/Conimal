<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div id="modal" style="display:none;">
		<div id="modal_contents">
			<h4><b>아이디는</b><span id="close">&times;</span></h4>
			<h2 id="id_value"></h2><h4>입니다.</h4><br>
			<button type="button" class="btn mar0_auto" id="findPwd-btn" onclick="location.href='/join/findPwd'">비밀번호 찾기</button>
		</div>
	</div>
