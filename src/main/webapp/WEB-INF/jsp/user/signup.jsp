<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyGram - signup page</title>

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>

	#duplicateId {
	display : none;
	}
	
	#availableId {
	display : none;
	}
	
	.box1 {
		width:400px;
		height:470px;
	}

</style>

</head>
<body>

	<div class="container">

	    <div class="mt-5 d-flex justify-content-center">
	
	      <div class="box1 border border-primary rounded p-3">
	
	        <h1 class="text-center">회원가입</h1>
			<div class="d-flex mt-4">
		        <input type="text" placeholder="userID" class="form-control" id="loginIdInput">
		        <button type="button" class="btn btn-secondary ml-2" id="checkBtn">중복확인</button>
			</div>
			<div class="mb-2">
				<label id="duplicateId" class="text-danger">중복된 ID입니다.</label>
			    <label id="availableId" class="text-primary">사용 가능한 ID입니다.</label>
			</div>
			
	        <input type="password" class=" form-control" id="passwordInput"> <br>
	
	        <input type="password" placeholder="비밀번호 확인" class="form-control" id="passwordConfirmInput"> <br>
	
	        <input type="text" placeholder="이름" class="form-control" id="nameInput"> <br>
	
	        <input type="text" placeholder="이메일 주소" class="form-control" id="emailInput"> <br>
	
	        <button type="button" class="btn btn-primary btn-block" id="signupBtn">가입</button>
	
	      </div>
	
	    </div>
    </div>
    
    <div class="text-center mt-3">
    	<label><a href="http://localhost:8080/user/signin/view">로그인 하기</a></label>
    </div>
    
    <script>
    	$(document).ready(function() {
    		
    		var isCheck = false;
    		var isDuplicate = true;
    		
    		$("#loginIdInput").on("input", function() {
    			// 중복검사를 완료한 상태에서 id를 입력하는 input란에 변화가 생기면 중복체크 상태를 초기화 시키는 기능
    			
    			isCheck = false;
    			isDuplicate = true;
    			
    			$("#duplicateId").hide();
    			$("#availableId").hide();
    			
    		});
    		
    		// 중복 확인버튼 이벤트
    		$("#checkBtn").on("click", function() {
    			
    			let loginId = $("#loginIdInput").val();
    			
    			// 유효성 검사 한 번 더
    			if(loginId == ""){
    				alert("아이디를 입력하세요.");
    				return;
    			}
    			
    			$.ajax({
    				type: "get"
    				, url: "/user/signup/duplicate"
    				, data: {"loginId":loginId}
    				, success: function(data) {
    					if(data.is_duplicate){
    						$("#duplicateId").show();
							$("#availableId").hide();
							isCheck = true;
    					} else {
    						$("#availableId").show();
							$("#duplicateId").hide();
							isCheck = true;
							isDuplicate = false;
    					}
    					
    				}
    				, error: function() {
    					alert("중복확인 에러");
    				}
    			});
    			
    		});
    			
    		
    		$("#signupBtn").on("click", function() {
    			let loginId = $("#loginIdInput").val();
    			let password = $("#passwordInput").val();
    			let passwordConfirm = $("#passwordConfirmInput").val();
    			let name = $("#nameInput").val();
    			let email = $("#emailInput").val();
    			
    			if(loginId == ""){
    				alert("아이디를 입력하세요.");
    				return;
    			}
    			
    			if(password == ""){
    				alert("비밀번호를 입력하세요.");
    				return;
    			}
    			
    			if(password != passwordConfirm){
    				alert("비밀번호가 일지하지 않습니다.");
    				return;
    			}
    			
    			if(name == ""){
    				alert("이름을 입력하세요.");
    				return;
    			}
    			
    			if(email == "" ){
    				alert("이메일을 입력하세요.");
    				return;
    			}
    			
    			
    			$.ajax({
    				type: "post"
    				, url: "/user/signup"
    				, data: {"loginId":loginId, "password":password, "name":name, "email":email}
    				, success: function (data){
    					if(data.result == "success" && isCheck == true){
    						location.href="/user/signin/view"
    					} else {
    						alert("회원가입 실패");
    					}
    				
    				}
    				, error: function(){
    					alert("회원가입 에러");
    				}
    			});
    			
    		});
    		
    	});
    
    </script>

</body>
</html>