<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style>
table{
	width: 100%;
}

table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	padding : 5px 10px;	
}

button{
	margin: 5px;
}

input[type="text"]{
	width: 100%;
}

textarea{
	width: 100%;
	height: 150px;
	resize: none;
}
</style>
</head>
<body>
	<% String userId = (String) session.getAttribute("loginId"); %>
	<form action="magazineUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_id" value="${dto.board_id}"/>
		<input type="hidden" name = "cat_id" value = "m"/> 
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" value="${dto.board_title}"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_id" value="<%= userId %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="board_content">${dto.board_content}</textarea></td>
			</tr>
			<tr>
				<th>대표사진</th>
				<td>
					<c:if test="${dto.photo_name eq null}">
						<input type="file" name="photo"/>
					</c:if>
					<c:if test="${dto.photo_name ne null }">
						<img src="/photo/${dto.photo_name}"/>
					</c:if>					
				</td>
			<tr>
				<th>링크</th>
				<td><a href="https://www.naver.com" target="_blank">링크 3</a></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./magazine'" value="리스트"/>
					<button>저장</button>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script></script>
</html>