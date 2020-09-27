<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="../include/head.jsp" %>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var stored_fies = [];
	var select_divs = "";
	$(function() {
		select_divs = $("#selectFiles");

		$("#files").on("change", preview);

		$("body").on("click", preview, removeFile);

		form = $("form[name=writeCom]")[0];
		form.onsubmit = function(e) {
			e.preventDefault();
			var formData = new FormData(form);
			for (var i = 0; i < stored_files.length; i++) {
				formData.append("files", stored_files[i]);
			}
			formData.append("readTag", tags);
			$.ajax({
				url : "community-write-form",
				type : "post",
				enctype : "multipart/form-data",
				contentType : false,
				processData : false,
				data : formData,
				success : function() {
					location.href = "${pageContext.request.contextPath}/community/community-list";
				}
			});
		}
	});

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
				var html = "<span class='preview'";
				html += "<img src=\"" + e.target.result + "\" class='w-100 h-70'";
				html += "</span>";
				select_divs.append(html);
			}
			reader.readAsDataURL(f);
		});
	}
	function removeFile(e) {
		var file = $(this).data("file");
		for(var i = 0; i < stored_files.length; i++) {
			if(stored_files[i].name === file) {
				stored_files.splice(i,1);
				break;
			}
		}
		$(this).parent().remove();
	}
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class = "page-container">
	
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
			<form method="post" enctype="multipart/form-data">
				<input type ="text" class="marB_20" id="cm-title" placeholder="제목을 입력하세요"/>
				<textarea class="community-contents marB_20" id="cm-contents" placeholder="내용을 입력하세요"></textarea>
				<input class="community-tags marB_20" type ="text" id="cm-tags" placeholder="태그를 입력하세요"/>
				<div class="marB_60">
					<input type ="text" class="community-files marR_10" id="cm-files" placeholder="파일을 첨부하세요"/>
					<button class="btn" id="search-btn">찾기</button>
					<span id="selectFiles"></span>
				</div>
				
				<div class="txt-center">
					<button class="btn" id="upload-btn">업로드</button>
				</div>
			</form>
		</div>
	
		
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
