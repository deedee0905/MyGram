<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title>MyGram - mainStream</title>

<style>
	header {
		height: 70px;
	}
	
    section {
    	width: 500px;
      	height: 600px;
      	margin:auto;
    }

	.like{
		float:right;
	}
	
	footer{
	height: 60px;
	}

  </style>

</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between ">
		    <div>
		      <div>
		      	<img class="m-2 rounded" width=50 height=50 src="https://cdn.pixabay.com/photo/2019/10/12/04/59/koi-4543131_960_720.jpg">
		      </div>
		    </div>
				
		    <div>
		      <h2 class="text-success mt-1">MyGram</h2>
		    </div>
		
		    <div>
		      <button type="button" class="mt-3 btn btn-primary">DM</button>
		    </div>
			
	  </header>
	
	
	  <section class="d-flex justify-content-center mt-2">
	
	    <div>
	      <input type="checkbox"> <label>북마크</label> <br>
	      <div>
			<img width=300 height=200 src="https://cdn.pixabay.com/photo/2016/07/04/07/58/fireworks-1496130_960_720.jpg">
	      </div>
		  <div class="mt-1 like">
		    <input type="checkbox"><labe class="ml-1">좋아요</label> <br>
		  </div>

	    </div>
	    
	   	
	  </section>
	
	 
	
	  <footer class="bg-info text-center">
	    <div>
	    	<label class="mt-3">Copyright © MyGram by deedee 2022</label>
	    </div>
	  </footer>
	
	</div>
	
</body>
</html>