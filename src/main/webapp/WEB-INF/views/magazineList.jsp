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
	<button onclick="location.href='magazineWrite.go'">글쓰기</button>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>카테고리id</th>
				<th>삭제</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.board_id}</td>
					<td><a href="magazineDetail.do?idx=${board.board_id}">${board.board_title}</a></td>
					<td>${board.userID}</td>
					<td>${board.board_views}</td>
					<td>${board.board_date}</td>
					<td>${board.categoryID}</td>
					<td><a href="magazineDelete.do?idx=${board.board_id}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>

</script>
</html>