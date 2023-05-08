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
</style>
</head>
<body>
<h3>신고하기</h3>
		<div class="mb-3 row">
		    <label for="staticReport" class="col-sm-2 col-form-label">신고 대상글</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticReport" value="reportTarget">
		    </div>
		  </div>
		  <label for="staticReason" class="col-sm-2 col-form-label">신고 사유</label>
		  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
  			<option selected>사유를 선택해 주세요</option>
  			<option value="1">부적절한 내용	</option>
			<option value="2">비방</option>
			<option value="3">광고</option>
			<option value="4">기타</option>
		</select>			
		<input class="form-control form-control-lg" type="text" placeholder="사유를 입력해 주세요" aria-label=".form-control-lg example">
		
		<div class="col text-center">
			<button type="button" class="btn btn-success" onclick="reportSend()">확인</button>
		</div>
</body>
<script>

</script>
</html>