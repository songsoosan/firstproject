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
	<form action="passwardChk.do" method = "post">
		<table>
			<tr>
				<th colspan="2">비밀번호를 입력해주세요.</th>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pwChk"/></td>
			</tr>
			<tr>
				<th colspan = "2">
					<input type="submit" value = "check"/>
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