<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style>
	table {
		width: 60%;
		border: 1px solid black;
		margin: 0 auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
</head>
<body>
<form action="class.appWrite.do" method="post">
	<table>
	<tr>
		<th colspan="2">클래스 신청서</th>
	</tr>
		<tr>
		<td colspan="2"><input type="hidden" name="cl_id" value="${cl_id}" readonly/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="hidden" name="user_id" value="${user.user_id}" readonly/></td>
	</tr>
	<tr>
		<th>클래스명</th>
		<td>${cl_subject}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${user.user_id}님</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="user_name" value="${user.user_name}" /></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="user_email" value="${user.user_email}" /></td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td><input type="text" name="user_phone" value="${user.user_phone}" /></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="user_adress" /></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" onclick="location.href='redirect:/class.go'" value="리스트"/>
			<button>저장</button>
		</th>
	</tr>
	</table>
	</form>
</body>
<script>

</script>
</html>