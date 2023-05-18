<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">

<style>
table {
	margin: 0 auto;
	text-align: center;
	border-collapse: collapse;
	width: 80%;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
}

th {
	background-color: #eee;
	font-weight: bold;
}

td {
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 8px 12px;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<%@ include file="./header.jsp"%>

	<div class="button-group">
		<button onclick="location.href='./admin.userList'">유저 리스트</button>
		<button onclick="location.href='./admin.reportList'">신고 리스트</button>
		<button onclick="location.href='./recieveletter.go'">관리자 쪽지</button>
	</div>
	<br>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>관리자 여부</th>
				<th>탈퇴 여부</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${userList eq null}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td><a href="profile2.do?user_id=${user.user_id}">${user.user_id}</a></td>
					<td>${user.user_name}</td>
					<td>${user.user_phone}</td>
					<td>${user.user_email}</td>
					<c:if test="${user.user_admin_chk}">
						<td>관리자
							<button
								onclick="location.href='adminCommit2.do?user_id=${user.user_id}'">해제</button>
						</td>
					</c:if>
					<c:if test="${not user.user_admin_chk}">
						<td>일반회원
							<button
								onclick="location.href='adminCommit.do?user_id=${user.user_id}'">등록</button>
						</td>
					</c:if>
					<c:if test="${user.user_secc_chk}">
						<td>Y</td>
					</c:if>
					<c:if test="${not user.user_secc_chk}">
						<td>N</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
	
</script>
</html>
