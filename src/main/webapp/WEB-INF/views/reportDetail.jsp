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
	<h3>신고 상세보기</h3>
	<table>
		<input type="hidden" id="report_id" value="${report_id}"/>
		<tr>
			<th>신고대상글</th>
			<td id="subject"></td>
		</tr>
		<tr>
			<th>글작성자</th>
			<td id="user_id"></td>
		</tr>
		<tr>
			<th>신고자</th>
			<td id="reporter"></td>
		</tr>
		<tr>
			<th>신고 날짜</th>
			<td id="date"></td>
		</tr>
		<tr>
			<th>신고사유</th>
			<td id="reason"></td>
		</tr>
		<tr>
			<th>신고내용</th>
			<td id="content"></td>
		</tr>
		<tr>
			<th>처리관리자</th>
			<td id="admin">${sessionScope.loginId}</td>
		</tr>
	<!-- 	<tr>
			<th>처리상태</th>
			<td id="admin">라디오버튼</td>
		</tr> -->
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

var $report_id = $('#report_id').val();
	$.ajax({
		type:'get',
		url:'reportDetail.ajax',
		data:{"report_id":$report_id},
		dataType:'json',
		success:function(data){
			console.log(data);
			
			$('#subject').html(data.subject);
			$('#user_id').html(data.user_id);
			$('#reporter').html(data.reporter);
			$('#date').html(data.date);
			$('#reason').html(data.reason);
			$('#content').html(data.content);
			
		},
		error:function(e){
			console.log(e);
		}
	});
</script>
</html>