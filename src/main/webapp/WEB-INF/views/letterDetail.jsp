<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

button{
	margin:5px;
	float: right;
}

input[type="text"]{
	width: 100%;
}


</style>
</head>
<body>
	<h3>쪽지 상세보기</h3>
	<table>

		<tr>
			<th>제목</th>
			<td id="subject"></td>
		</tr>
		<tr>
			<th>보내는 사람</th>
			<td id="send_user"></td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td id="receive_user"></td>
		</tr>
		<tr>
			<th>보낸 시간</th>
			<td id="date"></td>
		</tr>
		<tr>
			<td id="content" colspan = 2></td>
		</tr>
		<tr>
			<th colspan="2">
			<div class="col text-center">
				<button type="button" class="btn btn-primary", onclick="location.href='recieveletter.go'">돌아가기</button>
			</div>
			</th>
		</tr>
	</table>
</body>
<script>
	$.ajax({
		type:'get',
		url:'detail.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data);
			
			$('#letter_id').html(data.letter_id);
			$('#subject').html(data.letter_tItle);
			$('#send_user').html(data.send_user_id);
			$('#receive_user').html(data.recive_user_id);
			$('#date').html(data.letter_date);
			$('#content').html(data.letter_content);
			
		},
		error:function(e){
			console.log(e);
		}
	});
</script>
</html>