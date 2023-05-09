<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	table{
	margin: 0 auto;
	}
</style>
</head>
<body>
	<h3>${dto.user_name }님 해당 클래스의 접수가 완료되었습니다.</h3>
	<h2>회원님의 해당 클래스 참여번호는 ${dto.cl_part_id }입니다!</h2>
	<button onclick="location.href='classList.go'">확인</button>
	
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>