<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style></style>
</head>
<body>
	<h3>답변의 대한 점수는 다음과 같습니다.</h3>
	<h4>매우 그렇지 않다. 1점<br></h4>
	<h4>그렇지 않다. 2점<br></h4>
	<h4>보통이다. 3점<br></h4>
	<h4>그렇다. 4점<br></h4>
	<h4>매우 그렇다. 5점<br></h4>
	<br><br>
	<h3>${dto.user_id} 님의 대한 점수는 ${dto.total_score} 과 같습니다.</h3>
</body>
<script></script>
</html>
