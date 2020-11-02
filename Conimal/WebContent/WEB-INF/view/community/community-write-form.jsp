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
	//태그를 저장할 배열
	var tags = [];
	var tagNames = [];
	//태그를 보여줄 element
	$(function() {
		$("#tag").on("keypress", function (e) {
			if (e.key === "Enter" || e.keyCode == 32) {
				var inputText = $("#tag").val(); // input 태그에 입력한 값
				
				//inputText를 tagNames[]를 for문 돌려서 비교해서 같으면 중복!
				for(var i=0; i < tagNames.length; i++){
					if(tagNames[i] == inputText){
						console.log(tagNames[i] + "==" + inputText);
						$("#tag").val("");
						alert("중복!");
						return;
					}				
				}
				
				// 태그 중복확인
				tagCheck(inputText);
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
			var html = "<span class='hashTag' data-idx=" + idx + ">" + "#" + name + "<a id='deleteHash' href='javascript:;'> X</a>" + "</span>";
			
			//서버에 보낼 배열에 넣기
			tags.push(idx);
			// input enter 눌렸을때 input에 있는 value text 와 배열에 있는 text를 비교해서 있으면 중복 알림! 없으면 ajax!
			tagNames.push(name);
			// hidden input 에 넣어주기
			$("#rdTag").val(tags);

			// 태그 붙이기
			$("#tag-list").append(html);
			// input 비우기
			$("#tag").val("");
			
		}).fail(function() {
			alert("태그 확인에 실패하였습니다.");
		});
		$("#tag-list").on("click", ".hashTag", function () {
	 	 	var idx = $(this).attr("idx");
	 	 	tags[idx] = "";
			$(this).remove();
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
			var str = $("#files").val();
			console.log(str);
			formData.append("rdTag", tags);
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
		<form method="post" enctype="multipart/form-data" name="writeCommunity">
		<div class="community-container">
		
			<div class="community-intro">
				<h3 class="title">커뮤니티</h3>
			</div>
			
				<input type="hidden" name="user_idx" value="${user.user_idx}" readonly />
				<input type="text" class="marB_20" id="cm-title" name="title" placeholder="제목을 입력하세요"/>
				
				<textarea class="community-contents marB_20" id="cm-contents" name="content" placeholder="내용을 입력하세요"></textarea>
				
				<input type="hidden" value="" name="tag_name" id="rdTag">
				<input class="community-tags marB_20" type="text" id="tag" name="tag" placeholder="태그를 입력하세요"/>
				<div id="tag-list">
				
				</div>
				
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