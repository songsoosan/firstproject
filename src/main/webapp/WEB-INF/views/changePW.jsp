<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 60%;
		border: 1px solid black;
		margin: 0 auto;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.li {
		float: left;
		width: 16%;
	}
	.li > a {
		text-decoration-line: none;
		font-size: 25px;
	}
	.menu{
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
	}
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
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
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	
	
	$('#confirm').on('keyup',function(e){	
		if($('#userPW').val() == $(this).val()){
			$('#pwmsg').css({'font-size': '10px','color': 'darkgreen'});
			$('#pwmsg').html('비밀번호가 일치 합니다.');
			pweq = true;
		}else{
			$('#pwmsg').css({'font-size':'10px','color': 'red'});
			$('#pwmsg').html('비밀번호가 일치 하지 않습니다');
		}	
		
	});
</script>
</html>