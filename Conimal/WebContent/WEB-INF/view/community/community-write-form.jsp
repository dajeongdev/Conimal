<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyBoard</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

	var stored_files = [];
	var selected = "";
	
	$(function() {
		selected = $("#selectFiles");
		$("#files").on("change", preview);
		$("#img").on("click", removeFile);
		
		form.onsubmit = function(e) {
			e.preventDefault();
			var formData = new FormData(form);
			var str = $("#files").val();
			console.log(str);
			if(str === true) {
				$.ajax({
					url : "community-write-form",
					type : "post",
					data : formData,
					success : function() {
						console.log(formData);
						location.href = "/community/community-list";
					}
				})
			} else {
				for (var i = 0; i < stored_files.length; i++) {
					formData.append("files", stored_files[i]);
				}
				$.ajax({
					url : "community-write-form",
					type : "post",
					enctype : "multipart/form-data",
					contentType : false,
					processData : false,
					data : formData,
					success : function() {
						location.href = "/community/community-list";
					}
				})
			}
			
		}
	})
	function preview(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				return;
			}
			var str = $("#files").val();
			console.log(str === true);
			console.log(f);
			stored_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "<span class='preview'>";
				html += "<img src=\'" + e.target.result + "\' width='100' height='70' id='img'>";
				html += "</span>";
				selected.append(html);
				
			}
			console.log("preview success!");
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
		<form method="post" enctype="multipart/form-data">
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
			
				<input type="hidden" name="user_id" value="${user.user_id}" readonly />
				<input type="text" class="marB_20" id="cm-title" name="title" placeholder="제목을 입력하세요"/>
				
				<textarea class="community-contents marB_20" id="cm-contents" name="contents" placeholder="내용을 입력하세요"></textarea>
				
				<div class="marB_30">
					<input type="file" class="form-control community-files marR_10" id="files" name="file" multiple/>
					<span class="row" id="selectFiles"></span>
				</div>
				
				<div class="txt-center">
					<button type="submit" class="btn" id="upload-btn">업로드</button>
				</div>
			
		</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>