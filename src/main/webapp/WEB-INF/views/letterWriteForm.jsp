<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #id{
      width: 69%;
   }
   textarea{
      width : 100%;
      height:150px;
      resize:none;
   }
	table, th, td{
		border : 1px solid black !important	;
		border-collapse : collapse;
		padding : 5px 10px;
	}
	th{
		vertical-align:middle;
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
	}
<<<<<<< HEAD
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
	}
	
=======
>>>>>>> origin/master
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class="contentBox">
		<div class="text-center">
			<h2>쪽지 쓰기</h2>
		</div>
		<hr/>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="subject"/>
					</td>
				</tr>
				<tr>
					<th>받는 사람</th>
					<td>
						<input type="text" id="receiver" value=""/>
						<button id="toAdmin">관리자에게 보내기</button>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<div class="form-floating">
							<textarea class="form-control" placeholder="Leave a comment here" id="content" style="height: 100px"></textarea>				 
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<div class="col text-center">
							<button type="button" class="btn btn-success" onclick="letterSend()">확인</button>
							<button type="button" class="btn btn-success" onclick="location.href='recieveletter.go'">돌아가기</button>
						</div>
					</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
	</div>
</div>


<!--<h3 class="head">쪽지 작성하기</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" id="subject"/>
			</td>
		</tr>
		<tr>
			<th>받는 사람</th>
			<td><input type="text" id="receiver" value=""/>
				<button id="toAdmin">관리자에게 보내기</button>
			</td> 
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here" id="content" style="height: 100px"></textarea>				 
				</div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<div class="col text-center">
					<button type="button" class="btn btn-success" onclick="letterSend()">확인</button>
					<button type="button" class="btn btn-success" onclick="location.href='recieveletter.go'">돌아가기</button>
				</div>
			</th>
		</tr>
	</table> -->
</body>
<script>

$('#toAdmin').on('click',function(){
   $('#receiver').val("admin");
});



function letterSend(){

      var $subject = $('#subject');
      var $receiver = $('#receiver');
      var $content = $('#content');
   
      if($subject.val()==''){
         alert('제목을 입력해 주세요!');
         $subject.focus();
      }else if($receiver.val()==''){
         alert('받는 사람을 입력해 주세요!');
         $receiver.focus();
      }else if($content.val() == ''){
         alert('내용을 입력해 주세요!');
         $content.focus();
      }else{
         
         var param = {};
         param.subject = $subject.val();
         param.receiver = $receiver.val();
         param.content = $content.val();
         console.log(param);
         
         $.ajax({
            type:'post',
            url:'letterSend.ajax',
            data:param,
            dataType:'json',
            success:function(data){
               console.log(data);
               if(data.success == 1){
                  alert('쪽지전송이 완료 되었습니다.');
                  location.href = 'recieveletter.go';
               }else{
                  alert('쪽지전송에 실패 했습니다.\r\n 다시 시도해 주세요!');
               } 
            },
            error:function(e){
               console.log(e);
               alert('쪽지전송에 실패 했습니다.\r\n 다시 시도해 주세요!');
            }
         });
      }
}




   







</script>
</html>