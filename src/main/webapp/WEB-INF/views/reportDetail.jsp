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
input[type="text"] {
	width: 100%;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid black;
	padding: 5px 10px;
}

button {
	margin-top: 10px;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	max-width: 600px;
}
</style>
</head>
<body>
	<h3>신고 상세보기</h3>
	<div class="container">
		<table>
			<input type="hidden" id="report_id" value="${report_id}" />
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
			<tr>
				<th				>처리상태</th>
				<td>
					<input type="radio" name="status" id="완료" value="completed">완료
					<input type="radio" name="status" id="대기" value="pending">대기
					<input type="radio" name="status" id="미완료" value="incomplete">미완료
				</td>
			</tr>

			<tr>
				<th colspan="2">
					<div class="col text-center">
						<button type="button" id="confirm" class="btn btn-primary">확인</button>
					</div>
				</th>
			</tr>
		</table>
	</div>
</body>
<script>
	var $report_id = $('#report_id').val();
	$.ajax({
		type: 'get',
		url: 'reportDetail.ajax',
		data: {
			"report_id": $report_id
		},
		dataType: 'json',
		success: function (data) {
			console.log(data);

			$('#subject').html(data.subject);
			$('#user_id').html(data.user_id);
			$('#reporter').html(data.reporter);
			$('#date').html(data.date);
			$('#reason').html(data.reason);
			$('#content').html(data.content);

		},
		error: function (e) {
			console.log(e);
		}
	});

	$('#confirm').on('click', function () {
		var $status = $('input[name="status"]:checked').val();
		var $adminId = $('#admin').text();
		$.ajax({
			type: 'post',
			url: 'reportStatus.ajax',
			data: {
				report_id: $report_id,
				status: $status,
				adminId: $adminId
			},
			dataType: 'json',
			success: function (data) {
				if(data.success == "1"){
	                alert('완료 되었습니다.');
	                location.href = 'admin.reportList';
	             }else{
	                alert('실패 했습니다.\r\n 다시 시도해 주세요!');
	             } 
				
			},
			error: function (error) {
				console.log(error);
			}
		});
	});
</script>
</html>
				
