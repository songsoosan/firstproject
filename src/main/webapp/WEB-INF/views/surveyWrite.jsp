<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<h3>설문지 항목 등록</h3>
	<form action="surveyWrite.do" method="post">
		<table>
			<tr>
				<th><input type="text" name="addnum" placeholder="숫자만 입력해주세요"></th>
				<th><input type="text" name="additem" placeholder="질문 내용을 입력해주세요"></th>
			</tr>
			<tr>
				<th colspan="3">
					<input type="button" onclick="location.href='./survey.do'" value="뒤로가기"/>
					<button>저장</button>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
	var msg = ${msg};
	
	if(msg != ""){
		alert(msg);
	}
</script>
</html>
