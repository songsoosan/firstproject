<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style></style>
</head>
<body>
레시피 리스트 페이지
<input type="button" onclick="location.href='./recipe.write.go'" value="레시피 작성"/>
	<table>
		<thead>
			<tr>
				<th>대표사진</th>
				<th>글아이디(숨김필요)</th>
				<th>아이디</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="11">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="recipe" varStatus="loop">
			<c:set var="b" value="photo_name${loop.index}" />
				<tr>
					<td><img width="500" src="/photo/${photo[b]}"/></td>
					<td>${recipe.rec_id}</td>
					<td>${recipe.user_id}</td>
					<td><a href="recipe.detail.do?rec_id=${recipe.rec_id}">${recipe.rec_title} </a></td>
					<td>${recipe.rec_view}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>