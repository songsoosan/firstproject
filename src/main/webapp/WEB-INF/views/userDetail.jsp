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
</style>
</head>
<body>
	<form action="update.do" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="${detail.user_id}" readonly/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw"  value="${detail.user_pw}"/></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" value="${detail.user_name}"/></td>
			</tr>
			<!-- <tr>
				<th>GENDER</th>
				<td>
					<input type="radio" name="gender" value="남" 
					<c:if test="${member.gender eq '남'}">checked</c:if>
					/>남자 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여"
					<c:if test="${member.gender eq '여'}">checked</c:if>
					/>여자
				</td> 
			</tr>-->
			<tr>
				<th>E-MAIL</th>
				<td><input type="text" name="email" value="${detail.user_email}"/></td>
			</tr>
			<tr>
				<th>phone</th>
				<td><input type="text" name="phone" value="${detail.user_phone}"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
	var msg="${msg}";
	if (msg!="") {
		alert(msg);
		
	}

</script>
</html>