<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>푸른식탁 회원가입</title>
<script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}
	button{
		margin: 5px;
			
	}
	table{
	margin: 0 auto;
	}
	h3{
	
	}
	
</style>
</head>
<body>
<h3>회원가입</h3>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="userID"/>					
					<button id="overlayid">중복체크</button></br>
					<span id="idmsg"></span>
				</td>
			</tr>			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="userPW"/></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id ="confirm"/></br>
					<span id="pwmsg"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="userName"/>					
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="userGender" value="male"/>남자 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="userGender" value="female"/>여자
				</td>				
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" id="userPhone"/></td>
			</tr>		
			<tr>
				<th>E-MAIL</th>
				<td><input type="email" id="userEmail"/></td>
			</tr>			
			<tr>
         	<th colspan="2">
            <button onclick="join()">가입</button>
            <button onclick="location.href='./'">돌아가기</button>
         </th>
      	</tr>
		</table>
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