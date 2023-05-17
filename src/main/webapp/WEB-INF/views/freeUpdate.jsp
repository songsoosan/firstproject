<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class="contentBox">
		<div class="text-center">
			<h2>자유게시판 수정</h2>
		</div>
		<hr/>
		<form action="freeUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="board_id" value="${dto.board_id}"/>
			<input type="hidden" name="cat_id" value="${dto.cat_id}"/>
			<input type="hidden" name="photo_id" value="${dto.photo_id}"/>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="board_title" value="${dto.board_title}"/>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="user_id" value="${dto.user_id}" readonly>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
				<div class="col-sm-9">
					<textarea class="form-control" name="board_content">${dto.board_content}</textarea>
				</div>
			</div>
			<div class="row">
				<div class="input-group">
					<label for="board_photo" class="col-sm-2 offset-sm-1 col-form-label">사진</label>
					<input type="file" class="form-control w-auto" id="board_photo" name="board_photo">
				</div>
			</div>
			<div class="offset-sm-3">
				<c:if test="${dto.photo_name ne null}">
					<img max-width="300" max-height="300" src="/photo/${dto.photo_name}"/>
				</c:if>
			</div>
			<div class="text-center mt-3">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='./freeList.do'">리스트</button>
				<button class="btn btn-outline-primary">저장</button>
			</div>
		</form>
	</div>
</div>
</body>
<script></script>
</html>