<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .button-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

<%@ include file="./header.jsp" %>
	<form action="changePW.do" method = "post">
		<table>
			<tr>
				<th colspan="2">새로운 비밀번호를 입력해주세요.</th>
			</tr>
			<tr>
				<th>새비밀번호</th>
				<td><input type="password" id="userPW" name="newPW"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id ="confirm" name="confirm"/></br>
					<span id="pwmsg"></span>
				</td>
			</tr>
			<tr>
				<th colspan = "2">
					<input type="submit" value = "입력"/>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>
