<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
		<table>
			<c:forEach items="dto">
			<tr>
				<th>제목</th>
				<td>${dto.event_title}</td>
			</tr>
			<tr>
  				<th>시작일</th>
  				<td><input type="date" value="${dto.event_start_date}" disabled></td>
			</tr>
			<tr>
  				<th>종료일</th>
  				<td><input type="date" value="${dto.event_end_date}" disabled></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= userId %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.event_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.event_content}</td>
			</tr>
			<c:if test="${dto.photo_name ne null}">
			<tr>
				<th>대표사진</th>
				<td><img width="500" src="/photo/${dto.photo_name}"/></td>
			</tr>
			</c:if>
			<tr>
				<th>링크</th>
				<td><a href="https://www.naver.com" target="_blank">링크 3</a></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./event.do'" value="리스트"/>
					<input type="button" onclick="location.href='./eventUpdate.go?event_id=${dto.event_id}'" value="수정"/>
					<input type="button" onclick="location.href='./eventDelete.do?event_id=${dto.event_id}'" value="삭제"/>
				</th>
			</tr>
			</c:forEach>
		</table>
</body>
<script>

</script>
</html>