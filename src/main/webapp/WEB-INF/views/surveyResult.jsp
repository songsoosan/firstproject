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
	<h5>매우 그렇지 않다. 1점</h5>
	<h5>그렇지 않다. 2점</h5>
	<h5>보통이다. 3점</h5>
	<h5>그렇다. 4점</h5>
	<h5>매우 그렇다. 5점</h5>
    <h5>사용자 ${result.user_id_value} 님의 점수는 ${result.total_score_value}점 입니다.</h5>
    <button onclick="location.href='login.do'">메인</button>
</body>
<script></script>
</html>
