<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
table,th,td{
	border : 1px solid black;
	border-collapse : collapse;
	padding : 5px 10px;

}
#login{
	margin-bottom:20px;
}
</style>
</head>
<body>
	<!-- <table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME<th>
				<th>EMAIL</th>
				<th>phone</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${user.user_id }</td>
					<td>${user.user_name }</td>
					<td>${user.user_email }</td>
					<td>${user.user_phone }</td>
					<td>상세보기</td>
				</tr>
		</tbody>
	</table>
	 -->
	<table>
		<tr>
			<td rowspan="4">사진</td>
			<td>${user.user_id }</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>${user.user_name }</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>${user.user_email }</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>${user.user_phone }</td>
		</tr>
		<tr>
			<td colspan="2"><a>내가 작성한 레시피</a></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><a>즐려찾기한 레시피</a></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><a>구매한 클래스</a></td>
		</tr>
		<tr>
			<th colspan = "2">
				<input type="button" value="상세보기" onclick="location.href='detail.do'"/>
			</th>
		</tr>
		
	</table>
		

</body>
<script></script>
</html>