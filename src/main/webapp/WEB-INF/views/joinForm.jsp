<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<form action="join.do" method = "post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="user_id"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="user_pw"/></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="user_name"/></td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="user_phone"/></td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="email" name="user_email"/></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>
					<input type="radio" name="user_sex" value="male"/>남자 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="user_sex" value="female"/>여자
				</td>
			</tr>			
			<tr>
				<th colspan = "2">
					<input type="submit" value = "회원가입"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>