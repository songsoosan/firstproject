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
	<form action="magazineWrite.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="userID"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="board_content"></textarea></td>
			</tr>
			<tr>
				<th>카테고리 아이디</th>
				<td><input type="text" name="categoryID"/></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./magazineList.do'" value="리스트"/>
					<button>저장</button>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script></script>
</html>