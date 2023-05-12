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
		<div class="d-flex align-items-center justify-content-center">
	<a href="main.go" class="me-3">
		<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
	</a>
	<input type="text" class="form-control me-3" style="width: 300px;" placeholder="검색"/>
	&nbsp;&nbsp;&nbsp;
	<a href="profile.do" class="me-3">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
		</svg>
	</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="recipeWrite.go" class="me-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="recieveletter.go">
			<svg xmlns="http://www.w3.org/2000/svg"width="30" height="30" fill="currentColor" class="bi bi-chat-left-dots-fill" viewBox="0 0 16 16">
				<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			</svg>
		</a>
	</div>
		<c:if test="${sessionScope.loginId eq null}">
		<button class="logout-button" onclick="location.href='/login.go'">로그인</button>	
	</c:if>
	<c:if test="${sessionScope.loginId ne null}">
		<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>
	</c:if>	
<div class="menu text-center">
    <ul class="nav nav-pills d-flex justify-content-center">
        <li class="nav-item">
            <a class="nav-link" href="recipe.go">레시피</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ranking.go">랭킹</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="classList.go">클래스</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="magazine.go">매거진</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="board.go">게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="event.go">이벤트</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="admin.go">관리자(test)</a>
        </li>
    </ul>
</div>

	
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