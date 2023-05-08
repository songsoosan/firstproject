<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 100%
	}
	table, th, td{
		border: 2px solid green;
		border-collapse: collapse;
		padding: 5px 10pxl
	}
</style>
</head>
<body>
	<table>
	<c:forEach items="dto">
		<tr>
			<th>제목</th>
			<td>${dto.board_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.user_id}</td>
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
			<input type="button" onclick="location.href='./boardList.do'" value="리스트"/>
			<input type="button" onclick="location.href='./noticeUpdate.go?board_id={dto.board_id}'" value="수정"/>
			</th>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>