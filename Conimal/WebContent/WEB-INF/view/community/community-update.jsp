<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conimal</title>
	<%@ include file="../include/head.jsp" %>
</head>
<style>
#tag-list { 
	margin-top:2px;
	width: 500px;
	height: 50px;
}
.hashTag { 
	background: #7986cb;
	padding: 5px 5px;
	margin: 5px 5px;
	border-radius: 10%;
	display: inline-block;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

	var board_id = ${board.board_id};
	var stored_files = [];
	var selected = "";
	
	$(function() {
		selected = $("#selectFiles");
		$("#files").on("change", preview);
		$("#img").on("click", removeFile);

		form = $("form[name='updateForm']")[0];
		form.onsubmit = function(e) {
			e.preventDefault();
			var formData = new FormData(form);
			var str = $("#files").val();
			
			for (var i = 0; i < stored_files.length; i++) {
				formData.append("files", stored_files[i]);
			}
			$.ajax({
				url : "/community/update",
				type : "POST",
				enctype : "multipart/form-data",
				contentType : false,
				processData : false,
				data : formData,
				success : function() {
					location.href = "/community/community-detail?board_id="+board_id;
				}
			})
		}
	})
	
	function preview(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			
			if(!f.type.match("image.*")) {
				return;
			}
			stored_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "<span class='preview'>";
				html += "<img src=\'" + e.target.result + "\' width='100' height='70' id='img'>";
				html += "</span>";
				selected.append(html);
				
			}
			reader.readAsDataURL(f);
		});
	}
	function removeFile(e) {
		console.log("e : " + e);
		var file = $(this).data("file");
		for(var i = 0; i < stored_files.length; i++) {
			if(stored_files[i].name === file) {
				stored_files.splice(i, 1);
				break;
			}
		}
		$(this).parent().remove();
	}
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
		<form method="POST" enctype="multipart/form-data" name="updateForm">
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
				<input type="hidden" name="board_id" value="${board.board_id}"> 
				<input type="hidden" name="user_id" value="${user.user_id}"/>
				<input type="text" class="marB_20" id="cm-title" name="title" value="${board.title}"/>
				
				<textarea class="community-contents marB_20" id="cm-contents" name="contents">${board.contents}</textarea>
				
				<div class="marB_60">
					<input type="file" class="form-control community-files marR_10" id="files" name="file" multiple/>
					<div class="row" id="selectFiles">
						<c:if test="${file.size() > 0}">
							<c:forEach var="img" items="${file}">
								<div class="preview">
									<img src="/resources/upload/img/board/${img.file_name}" width="100" height="70">
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				
				<div class="txt-center">
					<button type="submit" class="btn" id="upload-btn">수정</button>
				</div>
		</div>
		</form>
		
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>