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
	<div>
		<a href="main.go">
			<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
		</a>
		<input type ="text" placeholder="검색"/>
		<a href="profile.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp; 
		<a href="recipeWrite.go">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  			<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  			<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp;
		<a href="recieveletter.go">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-left-dots-fill" viewBox="0 0 16 16">
  			<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			</svg>
		</a>
	</div>
		<div class ="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="class.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
			<li class="li"><a href="admin.go">관리자(test)</a></li>
		</ul>
	</div>
${msg}
<input type="button" onclick="location.href='./class.write'" value="클래스 등록"/>
	<table>
		<thead>
			<tr>
				<th>클래스번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>모집기간</th>
				<th>마감인원</th>
				<th>강사소개</th>
				<th>수업날짜</th>
				<th>재료 제공 여부</th>
				<th>클래스 상태</th>
				<th>수업소개</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="11">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="classes">
				<tr>
					<td><a href="class.detail.do?cl_id=${classes.cl_id}">${classes.cl_id}</a></td>
					<td>${classes.user_id}</td>
					<td>${classes.cl_subject}</td>
					<td>${classes.cl_period}~
							${classes.cl_deadlinePeriod}</td>
					<td>${classes.cl_deadline}</td>
					<td>${classes.cl_teacher}</td>
					<td>${classes.cl_date}</td>
					<td>${classes.cl_ing_chk}</td>
					<td>${classes.cl_status}</td>
					<td>${classes.cl_content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>

</script>
</html>