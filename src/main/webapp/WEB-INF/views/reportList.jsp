<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.header-space {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<%@ include file="./header.jsp"%>
	<div class="container">
		<table class="table">
			<thead class="thead-dark">

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
						<td colspan="7">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${reportList}" var="report">
					<tr>
						<td><a href="reportDetail.go?report_id=${report.report_id}">${report.report_id}</a></td>
						<td>${report.user_id}</td>
						<td>${report.reporter}</td>
						<td>${report.date}</td>
						<td>${report.reason}</td>
						<td
							<c:if test="${report.status == '완료'}">style="color: blue;"</c:if>
							<c:if test="${report.status == '미확인'}">style="color: red;"</c:if>>${report.status}</td>
						<td>${report.admin}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>
