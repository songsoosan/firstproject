<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class=logincontentBox>
		<div class="text-center">
			<h2>로그인</h2>
		</div>
		<hr/>
		<form action="login.do" method="post">
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">ID</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="id"/>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">PW</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" name="pw"/>
				</div>
			</div>
			<div class="text-center mt-3">
				<button class="btn btn-outline-primary">LOGIN</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='join.go'">회원가입</button>
			</div>
			<div class="text-center mt-3">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='findID.go'">아이디 찾기</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='findPW.go'">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</div>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);
</script>
</html>