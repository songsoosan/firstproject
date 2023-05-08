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
${msg}
	<form action="class.update.do" method="post">
	<input type="hidden" name="cl_id" value="${dto.cl_id}"/>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" value="${dto.user_id}"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="cl_subject" value="${dto.cl_subject}"/></td>
			</tr>
			<tr>
				<th>모집기간</th>
				<td><input type="date" name="cl_period" value="${dto.cl_period}"/></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="cl_deadline" value="${dto.cl_deadline}"/></td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td><input type="text" name="cl_teacher" value="${dto.cl_teacher}"/></td>
			</tr>
			<tr>
				<th>강좌날짜</th>
				<td><input type="date" name="cl_date" value="${dto.cl_date}"/></td>
			</tr>
			<tr>
				<th>재료여부</th>
				<td>
					<c:set var="clContent" value="${dto.cl_ing_chk}" />
					<c:choose>
					<c:when test="${clContent eq '0'}">
					<input type="radio" name="cl_ing_chk" value="1" > 있음
					<input type="radio" name="cl_ing_chk" value="0" checked> 없음
					</c:when>
					<c:otherwise>
					<input type="radio" name="cl_ing_chk" value="1" checked> 있음
					<input type="radio" name="cl_ing_chk" value="0" > 없음
					</c:otherwise>
					</c:choose>
			</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="cl_adress" value="${dto.cl_adress}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cl_content" >${dto.cl_content}</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./class.go'" value="리스트"/>
					<button>저장</button>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>

</script>
</html>