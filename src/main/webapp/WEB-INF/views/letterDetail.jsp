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
   .none {
     display: none !important;
   }
   .onlyAdmin {
      display: block !important;
   }
   .borderBottom {
        border-bottom: solid 1px #49c5a2;
   }
	/* #del{
		margin: 0 0 0 10px;
	}
	
	table, th, td{
		border : 1px solid black !important	;
		border-collapse : collapse;
		padding : 5px 10px;
	}
	div {
	   margin: 0 auto; 
	   text-align:center;
	}
	table {
		width: 60%;
		margin: 15 auto;
	}
	th, td {
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.head{
		margin-top: 10px;
		margin-left: 10px;
	}
	#paging {
    	text-align: center;
	}
	#ne {
	   float: right;
	   background-color:#0d6efd;
	   border-color: white;
	   color: white;
	} */
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class="contentBox">
		<div class="row mb-2 text-center">
			<h3 class="text-center">쪽지 상세보기</h3>
			<hr/>
		</div>
			<div class="input-group borderBottom mb-3 mt-3">
			<label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
				<div class="col-sm-9">
					<span class="form-control-plaintext" id="subject"></span>
				</div>
			</div>
	        <div class="input-group borderBottom mb-3 mt-3">
			<label class="col-sm-2 offset-sm-1 col-form-label">보내는 사람</label>
				<div class="col-sm-9">
					<span class="form-control-plaintext" id="send_user"></span>
				</div>
			</div>
			<div class="input-group borderBottom mb-3 mt-3">
			<label class="col-sm-2 offset-sm-1 col-form-label">받는 사람</label>
				<div class="col-sm-9">
					<span class="form-control-plaintext" id="receive_user"></span>
				</div>
			</div>
			<div class="input-group borderBottom mb-3 mt-3">
			<label class="col-sm-2 offset-sm-1 col-form-label">보낸 시간</label>
				<div class="col-sm-9">
					<span class="form-control-plaintext" id="date"></span>
				</div>
			</div>
			<div class="form-group row">
			<label for="content" class="col-sm-2 offset-sm-1 col-form-label">내용</label>
				<div class="col-sm-9">
					<span class="form-control" id="content" readonly></span>
				</div>
			</div>
			<div class="fr" style="display:inline-flex;">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='recieveletter.go'">돌아가기</button>
		</div>
	</div>
</div>
<!-- <table>
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
			<button type="button" class="btn btn-primary" onclick="location.href='recieveletter.go'">돌아가기</button>
		</div>
		</th>
	</tr>
</table> -->
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