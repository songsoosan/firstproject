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
		    	<input type="text" readonly class="form-control-plaintext" id="reportCategory" value="${params.cat_id}" >
		      <input type="text" readonly class="form-control-plaintext" id="reportTitle" value="${params.subject}" >
		      <input type="hidden" readonly class="form-control-plaintext" id="user_id" value="${params.user_id}" >
		      <input type="hidden" readonly class="form-control-plaintext" id="reporter" value="${params.reporter}" >
		      <input type="hidden" readonly class="form-control-plaintext" id="board_id" value="${params.board_id}" >
		      <c:if test="${not empty params.comment_id}">
		      	<input type="hidden" readonly class="form-control-plaintext" id="comment_id" value="${params.comment_id}" >
		      </c:if>
		    </div>
		  </div>
		  <label for="staticReason" class="col-sm-2 col-form-label">신고 사유</label>
		  <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id = "reason">
  			<option selected>사유를 선택해 주세요</option>
  			<option value="unsuitable">부적절한 내용	</option>
			<option value="abuse">비방</option>
			<option value="advertisement">광고</option>
			<option value="etc">기타</option>
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

    var $reportCategory = $('#reportCategory');
    var $title = $('#reportTitle');
    var $reason = $('#reason');
    var $content = $('#content');
    var $user = $('#user_id');
    var $reporter = $('#reporter');
    var $board_id = $('#board_id');
    var $comment_id = $('#comment_id');
 
 	if($reason.val()==''){
       alert('사유를 선택해 주세요!');
       $receiver.focus();
    }else if($content.val() == ''){
       alert('내용을 입력해 주세요!');
       $content.focus();
    }else{

    	
       var param = {};
       param.cat_id = $reportCategory.val();
       param.title = $title.val();
       param.reason = $reason.val();
       param.content = $content.val();
       param.user_id = $user.val();
       param.reporter = $reporter.val();
       param.board_id = $board_id.val();
       param.comment_id = $comment_id.val();
       console.log(param);
       
       $.ajax({
          type:'post',
          url:'reportSend.ajax',
          data:param,
          dataType:'json',
          success:function(data){
             console.log(data);
             if(data.success == "1"){
                alert('신고 접수가 완료 되었습니다.');
                location.href = 'main.go';
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