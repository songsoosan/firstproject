<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 제재 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	padding: 20px; /* 수정: 내부 여백 추가 */
}

.table {
	width: 100%;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle;
}

.btn-container {
	display: flex;
	justify-content: center;
	margin-top: 20px; /* 수정: 버튼과의 간격을 위해 margin-top 추가 */
}

.history-table {
	margin-top: 20px;
	width: 100%;
}

.history-table th, .history-table td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

.history-table th {
	background-color: #f1f1f1;
}

.history-table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<%@ include file="./header.jsp"%>

	<h3 class="text-center mb-4">회원 제재 페이지</h3>

	<div class="container">
		<table class="table">
			<input type="hidden" id="report_id" value="${report_id}" />
			<tr>
				<th>대상 아이디</th>
				<td id="user_id">${user_id}</td>
			</tr>
			<tr>
				<th>처리 관리자</th>
				<td id="admin">${sessionScope.loginId}</td>
			</tr>
			<tr>
				<th>처리 근거</th>
				<td><input type="text" id="reason" value="" /></td>
			</tr>
			<tr>
				<th>처리 내용</th>
				<td><input type="radio" name="status" id="경고" value="경고">
					<label for="경고">경고</label> <input type="radio" name="status"
					id="경고취소" value="경고취소"> <label for="경고취소">경고취소</label> <input
					type="radio" name="status" id="탈퇴" value="탈퇴"> <label
					for="탈퇴">탈퇴</label></td>
			</tr>
			<tr>
				<th colspan="2">
					<div class="btn-container">
						<button type="button" id="confirm" class="btn btn-primary">확인</button>
					</div>
				</th>
			</tr>
		</table>

		<h3 class="text-center mt-5">History</h3>
		<table class="table history-table">
			<thead class="thead-dark">
				<tr>
					<th>처리 관리자</th>
					<th>처리 내용</th>
					<th>처리 근거</th>
					<th>처리 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${history}" var="history">
					<tr>
						<td>${history.report_admin}</td>
						<td>${history.report_result}</td>
						<td>${history.report_reason}</td>
						<td>${history.result_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

<script>
	$(document).ready(function() {
		$('#confirm').on('click', function() {
			var param = {};
			param.report_id = $('#report_id').val();
			param.disposal = $('input[name="status"]:checked').val();
			param.admin_id = $('#admin').text();
			param.reason = $('#reason').val();
			param.user_id = $('#user_id').text();
			$.ajax({
				type : 'post',
				url : 'userDisposal.ajax',
				data : param,
				dataType : 'json',
				success : function(data) {
					if (data.success == "1") {
						alert('완료 되었습니다.');
						location.href = 'admin.reportList';

					} else {
						alert('실패 했습니다.\r\n 다시 시도해 주세요!');
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	});
</script>
</html>
