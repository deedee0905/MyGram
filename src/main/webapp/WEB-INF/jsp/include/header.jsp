<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<header class="d-flex justify-content-between">
	     
		      <div class="d-flex header-box">
		        <div>
		          <img class="mt-4 rounded" width=50 height=50
		            src="https://cdn.pixabay.com/photo/2019/10/12/04/59/koi-4543131_960_720.jpg">
		        </div>
		        <c:if test="${not empty userId }">
		        	<div class="mt-5 ml-1">${userName }님 <a class="text-dark" href="/user/signout">로그아웃</a> </div>
		        </c:if>
		      </div>
		
		      <div class="header-box">
		        <a href="/post/mainStream/view"><h1 class="text-primary mt-3 mr-5">MyGram</h1></a>
		      </div>
		
		
		      <div class="header-box">
		        <button type="button" class="mt-4 ml-4 mr-2 btn btn-info">DM</button>
		      </div>
	    
	
	 </header>