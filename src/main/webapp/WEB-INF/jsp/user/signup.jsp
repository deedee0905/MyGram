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
		        <input type="text" placeholder="userID" class="form-control" id="userIdInput">
		        <button type="button" class="btn btn-secondary ml-2">중복확인</button>
			</div>
			<br>
	        <input type="password" class=" form-control" id="passwordInput"> <br>
	
	        <input type="password" placeholder="비밀번호 확인" class="form-control" id="passwordConfirmInput"> <br>
	
	        <input type="text" placeholder="이름" class="form-control" id="nameInput"> <br>
	
	        <input type="text" placeholder="이메일 주소" class="form-control" id="emailInput"> <br>
	
	        <button type="button" class="btn btn-primary btn-block">가입</button>
	
	      </div>
	
	    </div>
    </div>
    
    <div class="text-center mt-3">
    	<label><a href="http://localhost:8080/user/signin/view">로그인 하기</a></label>
    </div>

</body>
</html>