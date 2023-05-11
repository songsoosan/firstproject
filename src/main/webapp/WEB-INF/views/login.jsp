<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<style>
		.container {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}
		.form-container {
			background-color: #F5F5F5;
			padding: 20px;
			border-radius: 5px;
		}
		.login-heading {
			text-align: center;
			margin-bottom: 20px;
		}
</style>
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h2 class="login-heading">로그인</h2>
			<form action="login.do" method="post">
				<table class="table">
					<tr>
						<th>ID</th>
						<td><input type="text" class="form-control" name="id" /></td>
					</tr>
					<tr>
						<th>PW</th>
						<td><input type="password" class="form-control" name="pw" /></td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">
							<input type="submit" class="btn btn-primary" value="LOGIN" />
							<input type="button" class="btn btn-secondary" value="회원가입" onclick="location.href='join.go'" />
						</th>
					</tr>
					<tr>
						<th class="text-center" colspan="2">
							<input type="button" class="btn btn-link" value="아이디 찾기" onclick="location.href='findID.go'" />
							<input type="button" class="btn btn-link" value="비밀번호 찾기" onclick="location.href='findPW.go'" />
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>