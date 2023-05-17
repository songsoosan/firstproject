<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
    .container {
      border: 2px solid #7CFC00;
      padding: 20px;
      margin: 20px auto;
      max-width: 800px;
    }
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
	<h3 class="text-center mb-4">신고 상세보기</h3>
	<div class="container border rounded py-4">
	<div class="container text-center">
		<input type="hidden" id="report_id" value="${report_id}" />
		<div class="form-group row">
			<label for="subject" class="col-sm-3 col-form-label font-weight-bold">신고대상글</label>
			<div class="col-sm-9">
				<span id="subject" class="font-weight-bold"></span>
			</div>
		</div>
			<div class="form-group row">
	  <label for="user_id" class="col-sm-3 col-form-label font-weight-bold">글작성자</label>
	  <div class="col-sm-9 d-flex align-items-center justify-content-center">
	    <span id="user_id" class="font-weight-bold"></span>
	    <button type="button" id="userActive" class="btn btn-primary ml-3">상태 변경</button>
	  </div>
	</div>
		<div class="form-group row">
			<label for="reporter" class="col-sm-3 col-form-label font-weight-bold">신고자</label>
			<div class="col-sm-9">
				<span id="reporter" class="font-weight-bold"></span>
			</div>
		</div>
		<div class="form-group row">
			<label for="date" class="col-sm-3 col-form-label font-weight-bold">신고 날짜</label>
			<div class="col-sm-9">
				<span id="date" class="font-weight-bold"></span>
			</div>
		</div>
		<div class="form-group row">
			<label for="reason" class="col-sm-3 col-form-label font-weight-bold">신고사유</label>
			<div class="col-sm-9">
				<span id="reason" class="font-weight-bold"></span>
			</div>
		</div>
		<div class="form-group row">
			<label for="content" class="col-sm-3 col-form-label font-weight-bold">신고내용</label>
			<div class="col-sm-9">
				<span id="content" class="font-weight-bold"></span>
			</div>
		</div>
		<div class="form-group row">
			<label for="admin" class="col-sm-3 col-form-label font-weight-bold">처리관리자</label>
			<div class="col-sm-9">
				<span id="admin" class="font-weight-bold">${sessionScope.loginId}</span>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-3 col-form-label font-weight-bold">처리상태</label>
			<div class="col-sm-9">
				<div class="form-check form-check-inline">
					<input type="radio" name="status" id="완료" value="완료" class="form-check-input">
					<label for="완료" class="form-check-label">완료</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="radio" name="status" id="대기" value="대기" class="form-check-input">
					<label for="대기" class="form-check-label">대기</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="radio" name="status" id="미완료" value="미완료" class="form-check-input">
					<label for="미완료" class="form-check-label">미완료</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-9 offset-sm-3">
				<button type="button" id="confirm" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
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
		  window.location.href = 'userActive.go?user_id=' + userId+'&report_id='+$report_id;
		});


</script>
</html>
				
