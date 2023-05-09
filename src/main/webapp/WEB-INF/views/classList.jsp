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
<%-- ${msg} --%>
	<c:if test="${adminChk ne null}">
		<input type="button" onclick="location.href='./classwrite.do'" value="클래스 등록"/>
	</c:if>
	<table>
		<thead>
			<tr>
				<th>클래스번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>모집기간</th>
				<th>마감인원</th>
				<th>강사소개</th>
				<th>수업날짜</th>
				<th>재료 제공 여부</th>
				<th>클래스 상태</th>
				<th>주소</th>
				<th>수업소개</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="11">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="classes">
				<tr>
					<td><a href="class.detail.do?cl_id=${classes.cl_id}">${classes.cl_id}</a></td>
					<td>${classes.user_id}</td>
					<td>${classes.cl_subject}</td>
					<td>${classes.cl_period}</td>
					<td>${classes.cl_deadline}</td>
					<td>${classes.cl_teacher}</td>
					<td>${classes.cl_date}</td>
					<td>${classes.cl_ing_chk}</td>
					<td>${classes.cl_status}</td>
					<td>${classes.cl_adress}</td>
					<td>${classes.cl_content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>