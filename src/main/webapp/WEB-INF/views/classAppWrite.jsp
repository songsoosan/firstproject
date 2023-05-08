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
<form action="class.appWrite.do" method="post">
	<table>
	<tr>
		<th colspan="2">클래스 신청서</th>
	</tr>
		<tr>
		<td colspan="2"><input type="hidden" name="cl_id" value="${cl_id}" readonly/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="hidden" name="user_id" value="${dto.user_id}" readonly/></td>
	</tr>
	<tr>
		<th>클래스명</th>
		<td><input type="text" name="cl_subject" value="${cl_subject}" readonly/></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="user_name" value="${dto.user_name}" readonly/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="user_email" value="${dto.user_email}" readonly/></td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td><input type="text" name="user_phone" value="${dto.user_phone}" readonly/></td>
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