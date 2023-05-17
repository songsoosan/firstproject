<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style>	
div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 100%;
		border: 1px solid black;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.li {
		float: left;
		width: 16%;
	}
	.li > a {
		text-decoration-line: none;
		font-size: 25px;
	}
	.menu{
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
	}
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
	}
	
	

</style>

</head>
<body>
<%@ include file="./header.jsp" %>
	
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>모집기간</th>
				<th>마감인원</th>
				<th>강사소개</th>
				<th>수업날짜</th>
				<th>참여번호</th>
			</tr>
		</thead>		
		<tbody>
		<span>${classes.cl_id}</span>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="11">구매한 클래스가 존재하지 않습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="classes">
				<tr>
					<td><a href="classDetail.do?cl_id=${classes.cl_id}">${classes.cl_subject}</a></td>
					<td>${classes.cl_period}~
							${classes.cl_deadlinePeriod}</td>
					<td>${classes.cl_deadline}</td>
					<td>${classes.cl_teacher}</td>
					<td>${classes.cl_date}</td>
					<td>${classes.cl_part_id}</td>
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