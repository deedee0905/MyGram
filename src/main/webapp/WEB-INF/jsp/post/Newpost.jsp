<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<meta charset="UTF-8">
<title>MyGram - 새 글 입력</title>

</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<div class="d-flex justify-content-center">
		
			<div class="newpost">
				<textarea id="contentInput" class="form-control mt-3" rows="10"></textarea>
				
				<input type="file" class="mt-3" id="fileInput">
				
				<div class="d-flex justify-content-between mt-3 mb-3">
					<a href="/post/mainStream/view" type="button" class="btn btn-info">목록</a>
					<a href="#" type="button" id="saveBtn" class="btn btn-info">저장</a>
				</div>
			
			</div>
		
		
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	
	<script>
		$(document).ready(function() {
			
			$("#saveBtn").on("click", function() {
				
				let content = $("#contentInput").val();
				let file = $("#fileInput").val();
				
				// 유효성 검사
				if(content == ""){
					alert("본문 내용을 입력하세요.");
					return;
				}
				
				if(file == ""){
					alert("사진을 등록하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type:"post"
					,url:"/post/create/posting"
					,data:formData
					,enctype:"multipart/form-data"
					,processData:false
					,contentType:false
					,success:function(data) {
						
						if(data.result == "success"){
							location.href="/post/mainStream/view"
						} else {
							alert("업로드 실패");
						}
						
					}
					,error:function() {
						alert("업로드 에러");
					}
				});
				
			});
			
		});
	
	
	</script>

</body>
</html>