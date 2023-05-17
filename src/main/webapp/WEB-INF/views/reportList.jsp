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
<button onclick="location.href='main.go'">메인</button>
	<div class="button-group">
		<button onclick="location.href='./admin.userList'">유저 리스트</button>
		<button onclick="location.href='./admin.reportList'">신고 리스트</button>
		<button onclick="location.href='./admin.blindList'">블라인드 리스트</button>
		<button onclick="location.href='./admin.category'">카테고리</button>
		<button onclick="location.href='./recieveletter.go'">관리자
			쪽지</button>
	</div>
	<br>
	<table>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>신고대상 아이디</th>
				<th>작성자 아이디</th>
				<th>신고 날짜</th>
				<th>신고 사유</th>
				<th>처리 상태</th>
				<th>처리 관리자</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${reportList eq null}">
				<tr>
					<th colspan="11">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${reportList}" var="report">
				<tr>
					<td><a href="reportDetail.go?report_id=${report.report_id}">${report.report_id}</a></td> 
					<td>${report.user_id}</td>
					<td>${report.reporter}</td>
					<td>${report.date}</td>
					<td>${report.reason}</td>
					<td>${report.status}</td>
					<td>${report.admin}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
	
</script>
</html>