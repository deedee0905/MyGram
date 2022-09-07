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
	     	<c:forEach var="post" items="${postList }">
	     		<div class="border rounded p-2 mt-1">
	        	<div class="mt-1">
	        		<a href="#"><i id="bookmark-checked" class="d-none bi bi-bookmark-star-fill"></i></a>
	        		<a href="#"><i id="bookmark-blank" class="bi bi-bookmark-star"></i></a>
	        		<label>북마크</label> <br>
	        	</div>
	        	<div>
	          		<img class="w-100" src="${post.imagePath }">
	        	</div>
		        <div class="mt-1 like">
		        	<a href="#"><i id="fill-heart" class="d-none bi bi-suit-heart-fill text-danger"></i></a>
		        	<a href="#"><i id="blank-heart" class="bi bi-suit-heart text-danger"></i></a>
		        	<label>좋아요</label> <br>
		        </div>
	
	            <div class="mt-4">
	            	<div>
	            	<label class="font-weight-bold">${userName }</label> 
	          		</div>
	
		          	<div>
		            <p>${post.content }</p>
		            </div>
	        	</div>
	
		        <div>
		            <label class="font-weight-bold">친구친구</label>
		            <label class="ml-1">부럽당</label>
		        </div>
	
	            <div>
	              <div class="font-weight-bold">덧글입력</div>
	              <div class="input-group mt-2">
				    <input type="text" class="form-control" placeholder="내용을 입력해주세요.">
				    <div class="input-group-append">
				      <button class="btn btn-info" type="button">입력</button>
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
	      </div>
	      <!-- ~세번째 div 상자 --> 
	      
		</div>




    </section>



    <c:import url="/WEB-INF/jsp/include/footer.jsp" />

  </div>
  
  
  <script>
  	$(document).ready(function() {
  		
  		// 빈 하트를 누르면 꽉찬 하트로 바꾸기
  		$("#blank-heart").on("click", function() {
  			
  			$("#blank-heart").addClass("d-none");
  			$("#fill-heart").removeClass("d-none");

  		});
  		
  		// 꽉찬 하트를 누르면 빈 하트로 바꾸기
		$("#fill-heart").on("click", function() {
  			
  			$("#fill-heart").addClass("d-none");
  			$("#blank-heart").removeClass("d-none");

  		});
  	
  		// 빈 북마크 아이콘을 누르면 체크된 북마크 아이콘으로 바꾸기
		$("#bookmark-blank").on("click", function() {
  			
  			$("#bookmark-blank").addClass("d-none");
  			$("#bookmark-checked").removeClass("d-none");

  		});
  		
  		// 체크된 북마크 아이콘을 누르면 빈 북마크 아이콘으로 바꾸기
		$("#bookmark-checked").on("click", function() {
  			
  			$("#bookmark-checked").addClass("d-none");
  			$("#bookmark-blank").removeClass("d-none");

  		});
  		
  		
  	});
  
  </script>
  

</body>

</html>