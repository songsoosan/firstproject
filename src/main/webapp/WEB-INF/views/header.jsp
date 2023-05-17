<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<style>
html, body {
	height: 100%;
	/* background: linear-gradient(to right, #f0fff0, #abfddf); */
}

.header {
	/* background: linear-gradient(to right, #f0fff0, #abfddf); */
	
}

.body a {
	color: inherit;
}

.menu {
	background-color: #49c5a2;
	margin: 0 0 0 0;
	display: flex;
    justify-content: center;
}

.menu ul {
	margin: 0 0 0 0;
	padding: 5px 50px;
}

.menu>ul>li {
	width: 16%;
	float: left;
	text-align: center;
	list-style: none;
}

.menu>ul>li>a {
	color: white;
	text-decoration-line: none;
	font-size: 25px;
}

.nav-item {
	text-align: center;
	list-style: none;
}

.contentWrap>.contentBox {
	border: 1px solid #49c5a2;
	background: #fff;
	margin: 0 250px;
	padding: 10px 15px;
	min-height: 650px;
}

.fr {
	float: right;
}
</style>
</head>
<body class="body">
	<header
		class="header container-fluid border-bottom py-3 justify-content-center d-flex">
		<div class="col-sm-1 offset-sm-3 text-center">
			<a href="main.go"> <img src="resources/img/logo.png" alt="푸른식탁"
				width="90px" height="90px" />
			</a>
		</div>
		<div class="col-sm-3">
			<div class="input-group mt-4">
				<input type="text" id="searchText" class="form-control"
					placeholder="검색어 입력"> <a href="javascript:void(0);"
					id="search" class="input-group-text"><i class="bi bi-search"></i></a>
			</div>
		</div>
		<div class="col-sm-2 text-center">
			<div class="mt-2 fs-1">
				<div class="row justify-content-between">
					<div class="col-auto">
						<a href="profile.do"><i class="bi bi-person-circle mx-2"></i></a>
					</div>
					<div class="col-auto">
						<a href="write.go"><i class="bi bi-pencil-square mx-2"></i></a>
					</div>
					<div class="col-auto">
						<a href="recieveletter.go"><i
							class="bi bi-chat-left-dots mx-2"></i></a>
					</div>
					<%-- <c:if test="${adminChk ne null}">
						<div class="col-auto">
							<a href="admin.go" class="d-flex align-items-center"><i
								class="bi bi-person-fill-gear"></i></a>
						</div>
					</c:if> --%>
					<c:if test="${sessionScope.loginId eq 'admin'}">
						<div class="col-auto">
							<a href="admin.go" class="d-flex align-items-center"><i
								class="bi bi-person-fill-gear"></i></a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col-sm-2 offset-sm-1 mt-5 text-left">
			<c:if test="${sessionScope.loginId eq null}">
				<button class="btn btn-outline-success"
					onclick="location.href='login.go'">로그인</button>
				<!-- <button onclick="location.href='login.go'" class="bi bi-box-arrow-in-right btn btn-link">&nbsp;Login</button> -->
			</c:if>
			<c:if test="${sessionScope.loginId ne null}">
				<button class="btn btn-outline-success"
					onclick="location.href='logout.do'">로그아웃</button>
				<!-- <button onclick="location.href='logout.do'" class="bi bi-box-arrow-in-left btn btn-link">Logout</button> -->
			</c:if>
		</div>
	</header>
	<div class="row menu">
		<ul>
			<li><a href="recipe.go">레시피</a></li>
			<li><a href="classList.go">클래스</a></li>
			<li><a href="magazine.go">매거진</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">
					게시판 </a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a href="board.go">공지사항</a></li>
					<li><a href="freeList.go">자유게시판</a></li>
				</ul></li>
			<li><a href="event.go">이벤트</a></li>
		</ul>
	</div>

</body>
</html>