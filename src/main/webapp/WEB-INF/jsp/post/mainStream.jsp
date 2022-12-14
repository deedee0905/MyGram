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
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

  <meta charset="UTF-8">
  <title>MyGram - mainStream</title>

  

<body>
  <div class="container">
    
    <c:import url="/WEB-INF/jsp/include/header.jsp" />

	<hr>

    <section>
    	
		<div class="d-flex justify-content-center mt-2 mb-5">
		
			
		    <!-- 첫번째 div 상자~ -->
		    <div class="main-box"></div>
		    <!-- ~첫번째 div 상자 -->
		  
		  	<!-- 두번째 div 상자~ -->
		  	
	     	<div class="main-box">
	     	<c:forEach var="postDetail" items="${postList }">
	     		<div class="border rounded p-2 mt-1">
	        	<div class="mt-1">
	        		<div class="d-flex justify-content-between">
	        			<c:choose> 
	        				<%-- 로그인한 사용자가 북마크한 게시물 --%>
	        				<c:when test="${postDetail.bookmark }"> 
	        					<div>
	        						<a href="#" class="bookmark-checked" data-post-id="${postDetail.post.id }"><i class="bi bi-bookmark-star-fill "></i></a>
	        						<label>북마크</label>
	        					</div>
	        				</c:when>
	        			
	        				<c:otherwise>
	        					<div>
			        				<a href="#" class="bookmark-blank" data-post-id="${postDetail.post.id }"><i class="bi bi-bookmark-star"></i></a>
			        				<label>북마크</label>
		        				</div>
	        				</c:otherwise>
	        			
	        			</c:choose>
	        			
		        		
		        		<div>
		        			<c:if test="${userId eq postDetail.user.id }">
		        				<a href="#" data-post-id="${postDetail.post.id }" class="more-btn" data-toggle="modal" data-target="#moreModal"><i class="bi bi-three-dots"></i></a>
		        			</c:if>
		        		</div>
	        		</div>
	        		
	        	</div>
	        	<div>
	          		<img class="w-100" src="${postDetail.post.imagePath }">
	        	</div>
	        	
	        	
	        	<div class="mt-1 like">
	        	
	        		<c:choose>
	        			<%--로그인한 사용자가 좋아요 한 게시물 --%>
	        			<c:when test="${postDetail.like }">
	        				<a href="#" class="unlike-btn" data-post-id="${postDetail.post.id }"><span><i class="bi bi-heart-fill text-danger"></i></span></a>
	        			</c:when>
	        			
	        			<%--로그인한 사용자가 좋아요를 하지 않은 게시물 --%>
	        			<c:otherwise>
	        				<a href="#" class="like-btn" data-post-id="${postDetail.post.id}"><i class="bi bi-suit-heart text-danger" ></i></a>
	        			</c:otherwise>
	        			
	        		</c:choose>
	 				좋아요 ${postDetail.likeCount }개
		        	
	        	</div>
	        	
	            <div class="mt-4">
	            	<div>
	            		<label class="font-weight-bold">${postDetail.user.loginId }</label> 
	          		</div>
	
		          	<div>
		            	<p>${postDetail.post.content}</p>
		            </div>
	        	</div>
				
				<c:forEach var="commentDetail" items="${postDetail.commentList }">
		        <div>
		            <label class="font-weight-bold">${commentDetail.user.loginId }</label>
		            <label class="ml-1">${commentDetail.comment.comment }</label>
		        </div>
				</c:forEach>
				
	            <div>
	              <div class="font-weight-bold">덧글입력</div>
	              <div class="input-group mt-2">
				    <input type="text" class="form-control" placeholder="내용을 입력해주세요." id="commentInput${postDetail.post.id }">
				    <div class="input-group-append">
				      <button class="btn btn-info comment-btn" type="button" data-post-id="${postDetail.post.id }">입력</button>
				    </div>
				  </div>	
	            </div>
	            </div>
	          </c:forEach>
	          </div>
			 
	      
	      <!-- ~두번째 div 상자 -->
	      
	      
	      <!-- 세번째 div 상자~ -->  
	      <div class="main-box" >
	      	<div class="d-flex">
	        	<div>
			      <a type="button" href="/post/create/view" class="mt-3 ml-5 btn btn-primary btn-sm">New post</a>  
			    </div>
			
			    <div class="input-group-prepend search-input mt-3 ml-2">
			      	<span class="input-group-text">🔍</span>
			      	<input type="text" class="form-control col-8">
			    </div>
			</div>
			
			<div>
			

<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
 
      <div class="modal-body text-center">
        <a href="#" id="deleteBtn">삭제하기</a>
      </div>
      
    </div>
  </div>
</div>
			</div>
	      </div>
	      <!-- ~세번째 div 상자 --> 
	      
	      
		</div>




    </section>



    <c:import url="/WEB-INF/jsp/include/footer.jsp" />

  </div>
  
  
  <script>
  	$(document).ready(function() {
  		
  		$("#deleteBtn").on("click", function(e) {
  			e.preventDefault();
  			let postId = $(this).data("post-id");
  			alert(postId);
  			
  			$.ajax({
  				type:"get"
  				, url:"/post/delete"
  				, data: {"postId":postId}
  				, success: function(data){
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("삭제 실패");
  					}
  				}
  				, error: function(){
  					alert("삭제 에러");
  				}
  				
  			});
  			
  		});
  		
  		$(".more-btn").on("click", function(e) {
  			e.preventDefault();
  			// 모달의 삭제하기 a 태그에 data-post-id 속성에
  			// 현재 more-btn이 포함된 postId를 저장한다. 
  			let postId = $(this).data("post-id");
  			
  			
  			$("#deleteBtn").data("post-id", postId);
  			
  		});
  		
  		
  		// 덧글 입력
  		$(".comment-btn").on("click", function(e) {
  			e.preventDefault();
  			
  			let postId = $(this).data("post-id");
  			let comment = $("#commentInput" + postId).val();
  			
  			$.ajax({
  				type:"post"
  				, url:"/post/comment/insert"
  				, data: {"postId":postId , "text":comment}
  				, success: function(data) {
  					
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("댓글입력 실패");
  					}
  					
  				}
  				, error: function() {
  					alert("덧글입력 에러")
  				}
  			});
  			
  		});
  		
  		$(".unlike-btn").on("click", function(e) {
  			e.preventDefault();
  			
  			let postId = $(this).data("post-id");
  			
  			$.ajax({
  				type:"get"
  				, url:"/post/like/delete"
  				, data:{"postId":postId}
  				, success:function(data) {
  					
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("좋아요 취소 실패");
  					}
  					
  				}
  				, error:function() {
  					alert("좋아요 취소 에러");
  				}
  				
  			});
  			
  		});
  		
  		
  		
  		
  		// 빈 하트를 누르면 꽉찬 하트로 바꾸기
  		$(".like-btn").on("click", function(e) {
  			e.preventDefault();
  			
  			let postId = $(this).data("post-id");
  			
  			
  			$.ajax({
  				type:"get"
  				, url: "/post/like/insert"
  				, data: {"postId":postId}
  				, success:function(data){
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("좋아요 실패");
  					}
  				}
  				, error:function(){
  					alert("좋아요 에러");
  				}
  			});
  			
  				
  			

  		});
  		
  		
  		
  	
  	
  		// 빈 북마크 아이콘을 누르면 체크된 북마크 아이콘으로 바꾸기
		$(".bookmark-blank").on("click", function(e) {
			e.preventDefault();
			
			let postId = $(this).data("post-id");
  			
  			
  			
  			$.ajax({
  				type:"get"
  				, url: "/post/bookmark/insert"
  				, data:{"postId":postId}
  				, success:function(data) {
  					
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("북마크 실패");
  					}
  					
  				}
  				, error:function() {
  					alert("북마크 에러");
  				}
  				
  				
  			});

  		});
  		
  		$(".bookmark-checked").on("click", function(e) {
  			e.preventDefault();
  			
  			let postId = $(this).data("post-id");
  			
  			$.ajax({
  				type:"get"
  				, url:"/post/bookmark/delete"
  				, data:{"postId":postId}
  				, success:function(data) {
  					
  					if(data.result == "success"){
  						location.reload();
  					} else {
  						alert("북마크 해제 실패");
  					}
  					
  				}
  				, error:function() {
  					alert("북마크 해제 에러");
  				}
  				
  			});
  			
  		});
  		
  		
  		
  		
  	});
  
  </script>
  

</body>

</html>