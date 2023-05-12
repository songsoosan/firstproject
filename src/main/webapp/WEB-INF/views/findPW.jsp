<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
body {
  background-color: #f3f3f4;
}
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
.item {
	padding: 50px;
	font-weight: 900;
	width: 450px;
	background-color: white;
	text-align:center;
}
</style>
</head>
<body>
<div class="wrapper">
	<div class="item" style="text-align:center;">
		<p>가입시 등록한 메일 주소로 알려드립니다.<p>
		<form name="sendForm">
			<div>
				<b style="width:80px; display:inline-block;">아이디</b><input type="text" style="margin-left:5px;" name="user_id" placeholder="id"/>
			</div>	
			<div>
				<b style="width:80px; display:inline-block;">이 름</b><input type="text" style="margin-left:5px;" name="user_name" placeholder="name"/>
			</div>
			<div>
				<b style="width:80px; display:inline-block;">이메일</b><input type="email" style="margin-left:5px;" name="user_email" placeholder="e-mail"/>
			</div>
			<div style="text-align:center;">
				<input type="button" onclick="sendMail()" style="margin-top:10px;" value="비밀번호 찾기">
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
function sendMail() {
	$.ajax({
		type: 'post',
		url: 'sendPWMail.ajax',
		data: $("form[name=sendForm]").serialize(),
		dataType: 'json',
		success: function(res){
			if(res.code === "TRANSFER_COMPLETE") {
				alert("메일 전송함");
				location.href='login.go';
			} else if (res.code === "NO_MATCHING_DATA") {
				alert("일치하는 정보 없음");
			} else {
				alert("메일 전송 실패");
			}
		},
		error: function(e){
			console.log(e);
		}
	});
}
</script>
</html>