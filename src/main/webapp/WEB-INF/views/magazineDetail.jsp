<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
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
		<table>
			<tr>
				<th>제목</th>
				<td>${dto.board_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.userID}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.board_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.board_content}</td>
			</tr>
			<c:if test="${dto.photo_name ne null}">
			<tr>
				<th>사진</th>
				<td><img width="500" src="/photo/${dto.photo_name}"/></td>
			</tr>
			</c:if>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./magazine'" value="리스트"/>
					<input type="button" onclick="location.href='./update.go?idx=${dto.idx}'" value="수정"/>
				</th>
			</tr>
		</table>	
</body>
<script></script>
</html>