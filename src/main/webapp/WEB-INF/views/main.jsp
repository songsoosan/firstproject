<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>푸른 식탁</title>
<style>
.divImages {
	margin-top: 100px;
}

.img {
	max-width: 50%; /* Adjust the max-width percentage as desired */
	max-height: 50%; /* Adjust the max-height percentage as desired */
	vertical-align: middle;
	display: inline-block;
}

.logout-button {
	float: right;
}

.custom-col {
	width: 250px;
	height: 400px;
}
h3{
	text-align : center;
}
</style>

</head>
<body>
	<%@ include file="./header.jsp"%>
	<br />
	<br />
	<h3><a href="recipe.go">레시피</a></h3>
	<br />
	<div class="container">
		<div class="row">
			<c:if test="${recipelist eq null}">
				<div class="col-12">
					<p>등록된 글이 없습니다.</p>
				</div>
			</c:if>


			<c:forEach items="${recipelist}" var="recipe" varStatus="loop">
				<div class="col-4 custom-col">
					<div class="card my-4">
						<img width="100" height="200" src="/photo/${photo}"
							class="card-img-top card-img">
						<div class="card-body">
							<h5 class="card-title">${recipe.rec_title}</h5>
							<p class="card-text">
								<td>${recipe.user_id}</td>
							</p>
							<p class="card-text">
								<span class="status inactive">조회수 : ${recipe.rec_view}</span>
							</p>
							<a href="recipe.detail.do?rec_id=${recipe.rec_id}"
								class="btn btn-primary">자세히 보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<br />
	<br />
	<hr>
	<br />
	<br />

	<h3><a href="classList.go">클래스</a></h3>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<c:if test="${classlist eq null}">
				<div class="col-12">
					<p>등록된 글이 없습니다.</p>
				</div>
			</c:if>
			<c:forEach items="${classlist}" var="classes" varStatus="status">
				<div class="col-4 custom-col">
					<div class="card my-4">
						<img width="100" height="200" src="/photo/${classes.photo_name}"
							class="card-img-top card-img">
						<div class="card-body">
							<h5 class="card-title">${classes.cl_subject}</h5>
							<p class="card-text">모집 기간: ${classes.cl_period} ~
								${classes.cl_deadlinePeriod}</p>
							<p class="card-text">

								<c:if test="${classes.cl_status == 1}">
									<span class="status inactive">마감</span>
								</c:if>
								<c:if test="${classes.cl_status == 0}">
									<span class="status active">진행중</span>
								</c:if>

							</p>
							<a href="classDetail.do?cl_id=${classes.cl_id}"
								class="btn btn-primary">자세히 보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
<script>
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</html>