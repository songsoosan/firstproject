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
	table{
	margin: 0 auto;
	}
</style>
</head>
<body>
	<form action="login.do" method = "post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th colspan = "2">
					<input type="submit" value = "LOGIN"/>
					<input type="button" value="회원가입" onclick="location.href='join.go'"/>
				</th>
			</tr>
			<tr>
				<th colspan = "2">
					<input type="button" value = "아이디 찾기" onclick="location.href='findID.go'"/>
					<input type="button" value="비밀번호 찾기" onclick="location.href='findPW.go'"/>
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