<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style>	div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 100%;
		border: 1px solid black;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.li {
		float: left;
		width: 16%;
	}
	.li > a {
		text-decoration-line: none;
		font-size: 25px;
	}
	.menu{
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
	}
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
	}
	
	

</style>

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
	<c:if test="${sessionScope.loginId eq null}">
		<button class="logout-button" onclick="location.href='/login.go'">로그인</button>	
	</c:if>
	<c:if test="${sessionScope.loginId ne null}">
		<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>
	</c:if>	
	<div class ="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="classList.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
			<li class="li"><a href="admin.go">관리자(test)</a></li>
		</ul>
	</div>
	
${msg}
			<c:if test="${adminChk ne null}">
				<input type="button" onclick="location.href='./class.update.go?cl_id=${dto.cl_id}'" value="수정"/>
			</c:if>
	<table>
			<tr>
				<th>아이디</th>
				<td>${dto.user_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.cl_subject}</td>
			</tr>
			<c:if test="${dto.photo_name ne null}">
				<tr>
					<th>사진</th>
					<td><img width = "300" src="/photo/${dto.photo_name}"/></td>
				</tr>
			</c:if>
			<tr>
				<th>모집기간</th>
				<td>${dto.cl_period}~${dto.cl_deadlinePeriod}</td>
			</tr>
			<tr>
				<th>마감 인원</th>
				<td>${dto.cl_deadline}<c:if test="${adminChk ne null}"><input type="button" onclick="location.href='class.appList.do?cl_id=${dto.cl_id}'" value="신청 리스트"/></c:if></td>	
			</tr>
			<tr>
				<th>강사 소개</th>
				<td>${dto.cl_teacher}</td>
			</tr>
			<tr>
				<th>수업 날짜</th>
				<td>${dto.cl_date}</td>
			</tr>
			<tr>
				<th>재료 제공 여부</th>
				<td>${dto.cl_ing_chk}</td>
			</tr>
			<tr>
				<th>클래스 상태</th>
				<td>${dto.cl_status}</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>${dto.postcode}
					${dto.address}
					${dto.detailAddress}
					${dto.extraAddress}</td>
			</tr>
			<tr>
				<th>수업소개</th>
				<td>${dto.cl_content}</td>
			</tr>
			<tr>
				<c:if test="${dto.cl_deadline <= dto.join_count}">
					<th>클래스 신청하기</th>
					<td>마감</td>
				</c:if>
				<c:if test="${dto.cl_deadline > dto.join_count}">
				<th>클래스 신청하기</th>
				<td><input type="button" onclick="location.href='./class.appWrite.go?cl_id=${dto.cl_id}'" value="신청"/></td>
				</c:if>
			</tr>
			</table>
			
			

</body>
<script>

</script>
</html>