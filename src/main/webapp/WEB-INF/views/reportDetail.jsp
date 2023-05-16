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
			    <td>
			        <div class="button-container">
			            <span id="user_id"></span>
			            <button type="button" id="userActive" class="btn btn-primary">상태 변경</button>
			        </div>
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
	var $status = '${status}'; // 서버에서 상태 값을 가져와서 저장하도록 변경해야 합니다.
	if ($status) {
	  $('input[name="status"][value="' + $status + '"]').prop('checked', true);
	}

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

			var $status = data.status; // 서버에서 가져온 신고 상태 값을 저장합니다.
		      if ($status) {
		        $('input[name="status"][value="' + $status + '"]').prop('checked', true);
		      }
			
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
	

	var userActiveButton = document.getElementById("userActive");
	var userIdData = document.getElementById("user_id");

	var buttonContainer = document.createElement("div");
	buttonContainer.classList.add("button-container");

	// userIdData 노드를 buttonContainer 안으로 이동
	buttonContainer.appendChild(userIdData.cloneNode(true));

	// userIdData 노드를 대체하기 위해 buttonContainer를 userIdData의 부모 노드에 삽입
	userIdData.parentNode.replaceChild(buttonContainer, userIdData);

	// 버튼을 buttonContainer의 자식 요소로 추가
	buttonContainer.appendChild(userActiveButton);

	// userActive 버튼 클릭 이벤트 처리
		$('#userActive').on('click', function() {
		  var userId = $('#user_id').text();
		
		  // userActive.go로 페이지를 변경
		  window.location.href = 'userActive.go?user_id=' + userId;
		});


</script>
</html>
				
