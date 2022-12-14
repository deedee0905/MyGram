<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyGram - signin page</title>

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


  <style>

    .box1 {
      width: 200px;
      height: 350px;
    }
    .box2 {
      width: 350px;
      height: 350px;
    }

  </style>

</head>
<body>

	<div class="container">

 

	    <div class="mt-5 d-flex justify-content-center">
			<%-- 
	      <div class="box1 mr-3 ">
	      	<img width=200 height=350 src="https://cdn.pixabay.com/photo/2016/02/07/14/45/smartphone-1184883_960_720.png">
	      </div>
		--%>
	      <div class="d-flex">
	
	        <div class="box2 border border-primary rounded p-2">
	          <h1 class="mt-3 text-info text-center">MyGram</h1>
	          <form id="loginForm">
		          <input type="text" placeholder="Username" class="mt-3 form-control" id="userIdInput"> <br>
		          <input type="password" class="mt-1 form-control" id="passwordInput">
		          <button type="submit" class="mt-2 btn btn-primary btn-block" id="loginBtn">로그인</button>
	          </form>
	
	          <div class="mt-4 text-center">
	            <label>계정이 없으신가요? <a href="http://localhost:8080/user/signup/view">회원가입</a></label>
	          </div>
	        </div>
	
	      </div>

    	</div>
  	</div>

 

 <script>
 	$(document).ready(function() {
 		
 		$("#loginForm").on("submit", function(e) {
 			
 			e.preventDefault();
 			
 			let loginId = $("#userIdInput").val();
 			let password = $("#passwordInput").val();
 			
 			if(loginId == ""){
 				alert("아이디를 입력하세요");
 				return;
 			}
 			
 			if(password == ""){
 				alert("비밀번호를 입력하세요");
 				return;
 			}
 			
 			$.ajax({
 				type: "post"
 				, url: "/user/signin"
 				, data: {"loginId":loginId, "password":password}
 				, success: function(data) {
 					
 					if(data.result == "success"){
 						location.href="/post/mainStream/view"
 					} else {
 						alert("아이디/비밀번호를 확인하세요");
 					}
 					
 				}
 				, error: function() {
 					alert("로그인 에러");
 				}
 				
 			});
 			
 		});
 		
 		
 	});
 
 </script>
	

	

</body>
</html>