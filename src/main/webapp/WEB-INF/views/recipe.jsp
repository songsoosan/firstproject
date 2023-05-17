<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	.img-thumbnail {
		max-width: 150px;
		max-height: 250px;
		height: auto;
	}
		.center-align {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-wrap: wrap;
	}
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="container">
	<div class="row center-align">
		<div class="col-md-12 d-flex justify-content-center align-items-center">
			<img class="img-thumbnail" src="/photo/${main_photo}" alt="Main Photo">
		</div>
	</div>
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h5>제목</h5>
				<p>${dto.rec_title}</p>
				<h5>작성자</h5>
				<p>${dto.user_id}</p>
				<h5>작성일</h5>
				<p>${dto.rec_creatdate}</p>
			</div>
		</div>
	<div class="row justify-content-center">
		<c:forEach items="${foods}" var="food" varStatus="loop">
		    <div class="col-md-6">
		        <div class="card">
		            <div>
		                <div>
		                    <h5 class="card-title">재료 ${loop.index+1}</h5>
		                    
		                </div>
		                <div class="card-body d-flex justify-content-between">
		              	  <p class="card-text">${food.food_name}</p>
		                    <p class="card-text">양 ${food.food_quantity}</p>
		                </div>
		            </div>
		        </div>
		    </div>
		    <c:if test="${loop.index % 2 != 0}">
		        </div>
		        <div class="row justify-content-center">
		    </c:if>
		</c:forEach>
	</div>
	<c:forEach items="${contents}" var="content" varStatus="loop">
		<c:set var="b" value="photo_name${loop.index}" />
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">순서 ${loop.index+1}</h5>
						<p class="card-text">${content.rec_content}</p>
					</div>
				</div>
			</div>		
			<div class="col-md-6">
				<div class="card">
					<img class="img-thumbnail" src="/photo/${photo[b]}" alt="Content Photo">
				</div>
			</div>
		</div>
	</c:forEach>
				<div>
			<c:forEach items="${tags}" var="tag" varStatus="loop">
				<tr>
					<th>${tag.tag}</th>
				</tr>
			</c:forEach >
			</div>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<input type="button" onclick="location.href='./recipe.go'" value="리스트" class="btn btn-primary">
		</div>
	</div>
</div>				
			
</body>

</html>
