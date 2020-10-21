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
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var tags = [];
	var tagNames = [];
	$(function() {
		$("#tag").on("keypress", function(e) {
			if(e.key === "Enter" || e.keyCode === 44) {
				var input_text = $("#tag").val(); // 입력한 태그 값

				// input_text를 tagNames[]로 for문 돌려서 비교하여 같으면 중복
				for(var i = 0; i < tagNames.length; i++) {
					if(tagNames[i] == input_text) {
						console.log(tagNames[i] + "==" + input_text);
						$("#tag").val("");
						alert("이미 입력한 태그입니다.");
						return;
					}
				}
				// 태그 중복 확인
				tagCheck(input_text);
				e.preventDefault();
			}
			console.log("입력 시작");
		})
	})
	var tagCheck = function(tag) {
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/community-write-form/checkTag?tag_name=' + tag,
			dataType : 'json'
		}).done(function(tag) {
			
			var idx = tag.tag_idx;
			console.log("입력한 태그 번호 : " + idx);	
			var name = tag.tag_name;
			console.log("입력한 태그 이름 : " + name);
			
			//서버에 보낼 배열에 넣기
			tags.push(idx);
			// input enter 눌렸을때 input에 있는 value text 와 배열에 있는 text를 비교해서 있으면 중복 알림! 없으면 ajax!
			tagNames.push(name);
			// hidden input 에 넣어주기
			$("#rdTag").val(tags);


		}).fail(function() {
			alert("태그 확인에 실패하였습니다.");
		});
	}

	var stored_files = [];
	var selected = "";
	
	$(function() {
		selected = $("#selectFiles");

		$("#files").on("change", preview);

		$("#img").on("click", removeFile);

		form = $("form[name=writeCommunity]")[0];
		form.onsubmit = function(e) {
			e.preventDefault();
			var formData = new FormData(form);
			for (var i = 0; i < stored_files.length; i++) {
				formData.append("files", stored_files[i]);
			}
			formData.append("rdTag", tags);
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
	})

	function preview(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {

			if(!f.type.match("image.*")) {
				return;
			}
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
		<form method="post" enctype="multipart/form-data" name="writeCommunity">
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
			
				<input type="hidden" name="user_idx" value="1" readonly />
				<input type="text" class="marB_20" id="cm-title" name="title" placeholder="제목을 입력하세요"/>
				
				<textarea class="community-contents marB_20" id="cm-contents" name="content" placeholder="내용을 입력하세요"></textarea>
				
				<input type="hidden" value="" name="tag_name" id="rdTag">
				<input class="community-tags marB_20" type="text" id="tag" name="tag" placeholder="태그를 입력하세요"/>
				
				<div class="marB_60">
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
