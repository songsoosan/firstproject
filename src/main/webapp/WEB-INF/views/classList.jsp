<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	<style>	
div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 100%;
		border: 1px solid black;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.li {
		float: left;
		width: 16%;
	}
	.li > a {
		text-decoration-line: none;
		font-size: 25px;
	}
	.menu{
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
	}
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
	}
	.status.active {
    color: blue;
	}
	
	.status.inactive {
	    color: gray;
	}
	
</style>

</head>
<body>
<%@ include file="./header.jsp" %>
		
	<c:if test="${adminChk ne null}">
		<button type="button" class="btn btn-info" onclick="location.href='classWrite.go'">클래스 등록</button>
	</c:if>

	<div class="container">
	    <div class="row">
	        <c:if test="${list eq null}">
	            <div class="col-12">
	                <p>등록된 글이 없습니다.</p>
	            </div>
	        </c:if>
	        <c:forEach items="${list}" var="classes" varStatus="status">
	            <div class="col-4">
	                <div class="card my-4">
	                    <img width="100" height="200" src="/photo/${classes.photo_name}" class="card-img-top card-img">
							<div class="card-body">
							    <h5 class="card-title">${classes.cl_subject}</h5>
							    <p class="card-text">모집 기간: ${classes.cl_period} ~ ${classes.cl_deadlinePeriod}</p>
							    <p class="card-text">

							    	<c:if test="${classes.cl_status == 1}">
							    		<span class="status inactive">마감</span>
							    	</c:if>
							    	<c:if test="${classes.cl_status == 0}">
							    		<span class="status active">진행중</span>
							    	</c:if>
	
							    </p>
							    <a href="classDetail.do?cl_id=${classes.cl_id}" class="btn btn-primary">자세히 보기</a>
							</div>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

	
</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

</script>
</html>