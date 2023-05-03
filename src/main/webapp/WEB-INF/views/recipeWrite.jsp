<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="${path}/resources/js/recipeWrite.js" type="text/javascript"></script>
<script>
	$(document).ready(function () {
		recipeWrite.init();
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="main">
	<!-- method: get(불러올때), put(저장할때), delete(삭제할때), patch(수정할때), post(수정할때 > patch랑 차이점이 있음, post통신을 알아야함) -->
		<!-- <form action="write.do" method = "post" enctype="multipart/form-data">
			<div>
				<input type = "text" name = "rec_title">
			</div>
			<div class="contents" id="recipeContents">
				<div class="group">
					<input type = "text" name="contents[0].rec_content">
					<img name="contents[0].photo_name">
					<button id="addImgButton">사진추가</button>
				</div>
				
			</div>
			
			<div class="contents">
				<button type = "button" id="addButton">추가</button>
				<button type="submit" id="saveButton">저장</button>
			</div>
		</form> -->
	<h3>레시피 등록</h3>
	<table>


	<thead>
	</thead>
	<tbody>
		<form class="form" id="addForm" enctype="multipart/form-data">
			<div>
			제목<input type = "text" name = "rec_title" id="rec_title">
			</div>
			<div class="contents" id="recipeContents">
				<div class="group">
					내용<input type = "text" class="rec_content">
						<input type = "file" name="thumbnailFile">
						<button id="addImgButton">사진추가</button>
				</div>
			</div>
			
			<div class="contents">
				<button type = "button" id="addButton">추가</button>
				<div class="tags">
					<input type="checkbox" value="1"/>
					<input type="checkbox" value="2"/>
					<input type="checkbox" value="3"/>
					<input type="checkbox" value="4"/>
					<input type="checkbox" value="5"/>
				</div>
				<button type="button" id="saveButton">저장</button>
			</div>
		</form>
	</tbody>
	</table>
</div>
</body>
</html>