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
	<table>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>신고대상 아이디</th>
				<th>작성자 아이디</th>
				<th>신고 날짜</th>
				<th>처리 상태</th>
				<th>처리 날짜</th>
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
					<td>${report.report_admin}<a href="class.detail.do?cl_id=${report.report_id}">${report.report_id}</a></td>
					<td>${report.user_id}</td>
					<td>${report.user_id2}</td>
					<td>${report.report_date}</td>
					<td>${report.report_result}</td>
					<td>${report.result_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>

</script>
</html>