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
			<c:if test="${adminChk ne null}">
				<input type="button" onclick="location.href='./class.update.go?cl_id=${dto.cl_id}'" value="수정"/>
			</c:if>
	<table>
			<tr>
				<th>아이디</th>
				<td>${dto.user_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.cl_subject}</td>
			</tr>
			<tr>
				<th>모집기간</th>
				<td>${dto.cl_period}</td>
			</tr>
			<tr>
				<th>마감 인원</th>
				<td>${dto.cl_deadline}<input type="button" onclick="location.href='class.appList.do?cl_id=${dto.cl_id}'" value="신청 리스트"/></td>
			</tr>
			<tr>
				<th>강사 소개</th>
				<td>${dto.cl_teacher}</td>
			</tr>
			<tr>
				<th>수업 날짜</th>
				<td>${dto.cl_date}</td>
			</tr>
			<tr>
				<th>재료 제공 여부</th>
				<td>${dto.cl_ing_chk}</td>
			</tr>
			<tr>
				<th>클래스 상태</th>
				<td>${dto.cl_status}</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>${dto.postcode}
					${dto.address}
					${dto.detailAddress}
					${dto.extraAddress}</td>
			</tr>
			<tr>
				<th>수업소개</th>
				<td>${dto.cl_content}</td>
			</tr>
			<tr>
				<th>클래스 신청하기</th>
				<td><input type="button" onclick="location.href='./class.appWrite.go?cl_id=${dto.cl_id}'" value="신청"/></td>
			</tr>
			</table>
			
			

</body>
<script>

</script>
</html>