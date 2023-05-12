<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
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
	.b {
		width:80px;
		display:inline-block;
		margin-right:5px;
	}
	.sendDiv {
		text-align:center;
		margin-top:10px;
	}
</style>
</head>
<body>
<div class="wrapper">
	<div class="item" style="text-align:center;">
		<p>가입시 등록한 메일 주소로 알려드립니다.</p>
		<form id="sendForm">
			<div>
				<b class="b">이 름</b><input type="text" name="user_name" placeholder="이름"/>
			</div>
			<div>
				<b class="b">이메일</b><input type="email" name="user_email" placeholder="e-mail"/>
			</div>
			<div class="sendDiv">
				<input id="sendBtn" type="button" onclick="sendMail()" value="아이디 찾기">
			</div>
		</form>
	</div>
</div>
</body>
<script>
function sendMail() {
	$("#sendBtn").attr("disabled", true);
	$.ajax({
		type: 'post',
		url: 'sendMail.ajax',
		data: $("#sendForm").serialize(),
		dataType: 'json',
		beforeSend: function(xhr) {
			$("#sendForm").validate({
				rules: {
					user_name: {required: true},
					user_email: {required: true},
				},
				messages: {
					user_name: {required: "이름을 입력해 주세요."},
					user_email: {required: "이메일을 입력해 주세요."},
				},
			});
			if(!$('#sendForm').valid()) {
				$("#sendBtn").attr("disabled", false);
				xhr.abort();
			}
		},
		success: function(res){
			if(res.code === "COMPLETE") {
				alert("메일 전송함");
				location.href='login.go';
			} else if (res.code === "NO_DATA") {
				alert("일치하는 정보 없음");
			} else {
				alert("메일 전송 실패");
			}
			$("#sendBtn").attr("disabled", false);
		},
		error: function(e){
			console.log(e);
			$("#sendBtn").attr("disabled", false);
		}
	});
}
$.validator.setDefaults({
	onkeyup:false,
	onclick:false,
	onfocusout:false,
	showErrors:function(errorMap, errorList) {
		if(this.numberOfInvalids()){ // show error
			alert(errorList[0].message);
			$(errorList[0].element).focus();
		}
	}
});
</script>
</html>