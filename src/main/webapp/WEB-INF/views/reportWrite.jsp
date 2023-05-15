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
		    <label for="staticReport" class="col-sm-2 col-form-label">신고 글 작성</label>
		    
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="staticReport" value="" >
		      ${cat_id}
		      ${board_title}
		    </div>
		  </div>
		  <label for="staticReason" class="col-sm-2 col-form-label">신고 사유</label>
		  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id = "reason">
  			<option selected>사유를 선택해 주세요</option>
  			<option value="1">부적절한 내용	</option>
			<option value="2">비방</option>
			<option value="3">광고</option>
			<option value="4">기타</option>
		</select>			
			<div class="form-floating">
  				<textarea class="form-control" placeholder="내용을 입력해 주세요" id="content" style="height: 100px"></textarea>				 
			</div>
		<div class="col text-center">
			<button type="button" class="btn btn-success" onclick="reportSend()">확인</button>
		</div>
</body>
<script>

$('#staticReport').val();

function reportSend(){

    var $staticReport = $('#staticReport');
    var $reason = $('#reason');
    var $content = $('#content');
 
 	if($reason.val()==''){
       alert('사유를 선택해 주세요!');
       $receiver.focus();
    }else if($content.val() == ''){
       alert('내용을 입력해 주세요!');
       $content.focus();
    }else{

    	
       var param = {};
       param.staticReport = $staticReport.val();
       param.receiver = $reason.val();
       param.content = $content.val();
       console.log(param);
       
       $.ajax({
          type:'post',
          url:'reportSend.ajax',
          data:param,
          dataType:'json',
          success:function(data){
             console.log(data);
             if(data.success == 1){
                alert('신고 접수가 완료 되었습니다.');
                location.href = 'recieveletter.go';
             }else{
                alert('신고 접수가 실패 했습니다.\r\n 다시 시도해 주세요!');
             } 
          },
          error:function(e){
             console.log(e);
             alert('신고 접수가 실패 했습니다.\r\n 다시 시도해 주세요!');
          }
       });
    }
}
</script>
</html>