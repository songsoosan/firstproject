<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
</head>
<body>
레시피 페이지 입니다.
	<table>
			<tr>
				<td colspan="2"><img width="500" src="resources/photo/${main_photo}"/></td>
			</tr> 
			<tr>
				<th>제목</th>
				<td>${dto.rec_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.user_id}</td>
			</tr>
			<tr>
				<th>비디오</th>
				<td>${dto.rec_video}</td>
			</tr>
			<tr>
			<th>작성일</th>
				<td>${dto.rec_creatdate}</td>
			</tr>
			<c:forEach items="${foods}" var="food" varStatus="loop">
				<tr>
					<th>재료 ${loop.index+1} ${food.food_name} </th>
					<td>양  ${food.food_quantity}</td>
				</tr>
			</c:forEach >
			
			<c:forEach items="${contents}" var="content" varStatus="loop">
			 <c:set var="b" value="photo_name${loop.index}" />
				<tr>
					<th>내용 ${loop.index+1} ${content.rec_content} </th>
					<td><img width="500" src="admin/resources/photo/${photo[b]}"/></td>
				</tr>
				
				
			</c:forEach >
				
			
			 <%-- <c:if test="${dto.newFileName ne null}">
			<tr>
				<th>사진</th>
				<td><img width="500" src="/photo/${dto.newFileName}"/></td>
			</tr>
			</c:if> --%>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./recipe.go'" value="리스트"/>
					 <%--<input type="button" onclick="location.href='./update.go?idx=${dto.idx}'" value="수정"/> --%>
				</th>
			</tr>
		</table>	
</body>
</html>