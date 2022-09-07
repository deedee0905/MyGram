<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>메모 - 타임라인</title>

 

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

 

</head>

<body>

	

	<div class="container">

		<c:import url="/WEB-INF/jsp/include/header.jsp" />

		

		<c:if test="${not empty userId }">

		<section class="d-flex justify-content-center">

		

			
			
			<div class="new-post-area mt-2 mb-3">

				
				<!-- 카드~ -->
				<div class="form-group border rounded p-2">

					<textarea class="form-control" rows="6"></textarea>
					<div class="d-flex justify-content-between mt-1">
						<a href="#" id="imageIcon"><i class="bi bi-image"></i></a>
						<input type="file" class="mt-3 d-none" id="fileInput">
						<button type="button" class="btn btn-info btn-sm mt-1 p-1">업로드</button>
							
					</div>

				</div>
				<!-- ~카드 -->
				

				
				<!-- 카드~ -->
				<div class="border rounded p-2">
				<div class="d-flex justify-content-between mt-1 bar">
					<div class="">
	
						<label class="ml-1 ">${userName }</label>
	
					</div>
					<i class="bi bi-three-dots mr-1"></i>
				</div>
				
				<!-- 피드~ -->
				<div class="mt-1">

					<img class="img-fluid mt-1" src="https://cdn.pixabay.com/photo/2016/12/30/17/27/cat-1941089_960_720.jpg">

					<a href="#"><img class="full-heart" width=18 src="https://www.iconninja.com/files/527/809/128/heart-icon.png"></a>

					<a href="#"><img class="empty-heart" width=18 src="https://www.iconninja.com/files/214/518/441/heart-icon.png"></a>

					<label class="text-sm mt-1" >좋아요 11개</label>

				</div>
				<!-- ~피드 -->
				

				<div>

					<label class="font-weight-bold">hagulu</label> <label>고양이 귀엽죠?</label>

				</div>
				
				
				
				<div class="bar">
				

					<label class="ml-1 text-small comment-bar">댓글</label>		

				</div>

				
				<!-- 댓글~ -->
				<div>

					<div class="comment">

						<label class="font-weight-bold">냥이집사</label> <label class="ml-1">귀엽네요</label> <br>

						<label class="font-weight-bold">강쥐집사</label> <label class="ml-1">오 ^^~</label>

					</div>

				</div>
				<!-- ~댓글 -->
				

				<div class="d-flex mb-3">

					<input type="text" class="form-control" placeholder="내용을 입력해주세요">

					<button class="ml-2 btn btn-primary btn-sm">게시</button>

				</div>
				</div>
				<!-- ~카드 -->
				

			</div>

			</c:if>

	

		

		</section>

		

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	</div>

	<script>
		$(document).ready(function() {
			
			$("#imageIcon").on("click",function() {
				// 파일 인풋을 클릭한 효과
				$("#fileInput").click();

			});
			
			
			
		});
	
	
	</script>
	

	

</body>

</html>