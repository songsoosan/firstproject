<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class=logincontentBox>
		<div class="text-center">
			<h2>회원가입</h2>
		</div>
		<hr/>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="userID"/>
					<button id="overlayid" class="btn btn-outline-primary">중복체크</button>
					<span id="idmsg"></span>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">패스워드</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="userPW"/>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">패스워드확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id ="confirm"/>
					<span id="pwmsg"></span>
				</div>
			</div>
			
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="userName"/>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">성별</label>
				<div class="col-sm-6">
					<input type="radio" class="form-control" name="userGender" value="male"/>남자
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="form-control" name="userGender" value="female"/>여자
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">연락처</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="userPhone"/>
				</div>
			</div>
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">E-MAIL</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="userEmail"/>
				</div>
			</div>
			<div class="text-center mt-3">
				<button onclick="join()" class="btn btn-outline-primary">가입</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='./'">돌아가기</button>
			</div>
	</div>
</div>
</body>
<script>
var pweq = false;
var overlayIdChk = false;

function join(){
	
	if(pweq && overlayIdChk){
		
		var $user_id = $('#userID');
		var $user_pw= $('#userPW');
		var $user_name = $('#userName');
		var $user_sex = $('input[name="userGender"]:checked');
		var $user_phone = $('#userPhone');
		var $user_email = $('#userEmail');
		
		if($user_id.val()==''){
			alert('아이디를 입력해 주세요!');
			$user_id.focus();
		}else if($user_pw.val()==''){
			alert('비밀번호를 입력해 주세요!');
			$user_pw.focus();			
		}else if($user_pw.val().length <= 7){
			alert('비밀번호를 8자리 이상 입력해 주세요!');
			$user_pw.focus();		
		}else if($user_name.val()==''){
			alert('이름을 입력해 주세요!');
			$user_name.focus();		
		}else if($user_sex.val()==null){
			alert('성별을 입력해 주세요!');			
		}else if($user_phone.val()==''){
			alert('연락처를 입력해 주세요!');
			$user_phone.focus();
		}else if($user_email.val()==''){
			alert('이메일을 입력해 주세요!');
			$user_email.focus();
		}else{
			
			var param = {};
			param.user_id = $user_id.val();
			param.user_pw = $user_pw.val();
			param.user_name = $user_name.val();
			param.user_sex = $user_sex.val();
			param.user_phone = $user_phone.val();
			param.user_email = $user_email.val();
			
			console.log(param);
			
			$.ajax({
				type:'post'
				,url:'join.ajax'
				,data:param
				,dataType:'json'
				,success:function(data){
					console.log(data);
					if(data.success == 1){
						alert('회원가입이 완료 되었습니다.');
						location.href ='./';
					}else{
						alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요');
					}
				},
				error:function(e){
					console.log(e);
					alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요');
				}
			});
		}
				
	}else{
		alert('아이디중복체크와 비밀번호 확인을 해 주세요');
	}	
}

$('#overlayid').on('click', function(e){
    var chkId = $('#userID').val();      
    
    console.log("중복체크 요청 : " + chkId);
    console.log($('#userID').val().length);
    
    $.ajax({
       type: 'get'
       ,url: 'overlayid.ajax'
       ,data:{'user_id':chkId}
       ,dataType:'json'
       ,success:function(data){
          console.log(data);
          if($('#userID').val().length <=4){
        	  $('#idmsg').css({'font-size': '10px','color': 'red'});
        		$('#idmsg').html('아이디를 5자리 이상 입력해주세요.');
        		// && $('#userID').val().length >=5
          }else if(data.overlayid==0){
             alert('사용 가능한 아이디 입니다.');
             overlayIdChk=true;
             $('#idmsg').css({'font-size': '10px','color': 'darkgreen'});
      		$('#idmsg').html('사용 가능한 아이디 입니다.');
          } else {
             alert('사용 불가능한 아이디 입니다.');
             $('#userID').val('');
             $('#idmsg').css({'font-size': '10px','color': 'red'});
       		$('#idmsg').html('사용 불가능한 아이디 입니다.');
          }
       }
       ,error:function(e){
          console.log(e);
       }
    });      
 });



$('#confirm').on('keyup',function(e){	
	if($('#userPW').val() == $(this).val()){
		$('#pwmsg').css({'font-size': '10px','color': 'darkgreen'});
		$('#pwmsg').html('비밀번호가 일치 합니다.');
		pweq = true;
	}else{
		$('#pwmsg').css({'font-size':'10px','color': 'red'});
		$('#pwmsg').html('비밀번호가 일치 하지 않습니다');
	}	
	
});
</script>
</html>