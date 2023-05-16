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
		table-layout: fixed;
	}

    td {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
	th, td {
		border: 1px solid black;
		padding: 5px 10px;
	}

    .button-container {
        display: flex;
        align-items: center;
    }

    .button-container button {
        margin-left: 10px;
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
	<h3>tksadsadad</h3>
	<div class="container">
		<table>
			<input type="hidden" id="report_id" value="${report_id}" />
			<tr>
				<th>신고대상글</th>
				<td id="subject"></td>
			</tr>
			<tr>
			    <th>글작성자</th>
			    <td>
			            <span id="user_id"></span>
			    </td>
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
				<th>처리상태</th>
				<td>
					<input type="radio" name="status" id="status-completed" value="completed">완료
					<input type="radio" name="status" id="status-pending" value="pending">대기
					<input type="radio" name="status" id="status-incomplete" value="incomplete">미완료
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


</script>
</html>
				
