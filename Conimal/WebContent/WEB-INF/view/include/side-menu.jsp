<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside>

	<h3 class="nickname">${user.nickname}</h3>
	<h5 class="userId">@${user.user_id}</h5>
	<ul class="my-page-list">
		<li><a href="/my-page/my-badge">내 뱃지</a></li>
		<li><a href="#">반려동물</a></li>
		<li><a href="/my-page/my-posts">작성한 글</a></li>
		<li><a href="/my-page/my-comment">덧글</a></li>
		<li><a href="/my-page/my-bookmark">북마크</a></li>
		<li><a href="/my-page/my-account">계정정보</a></li>
	</ul>

</aside>
