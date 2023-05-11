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
	<form action="class.write.do" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="cl_subject"/></td>
			</tr>
			<tr>
				<th>모집기간</th>
				<td><input type="date" name="cl_period"/></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="cl_deadline"/></td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td><input type="text" name="cl_teacher"/></td>
			</tr>
			<tr>
				<th>강좌날짜</th>
				<td><input type="date" name="cl_date"/></td>
			</tr>
			<tr>
				<th>재료여부</th>
				<td>
					<input type="radio" name="cl_ing_chk" value="1" checked> 있음
					<input type="radio" name="cl_ing_chk" value="0"> 없음
			</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="cl_adress"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cl_content"></textarea></td>
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