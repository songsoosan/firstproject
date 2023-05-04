<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		text-align: center;
	}
	#ne{
		margin:5px;
		float: right;
	}
	table{
		width: 100%;
	}

	

</style>
</head>
<body>
<h3>쪽지</h3>
				<button onclick = "location.href='recieveletter.go'">받은 쪽지함</button>
				<button onclick = "location.href='sendletter.go'">보낸 쪽지함</button>
				<button onclick = "location.href='letterWrite.go'" id = "ne">새 쪽지</button>
	<table>
		<thead>
			<tr>
				<th>읽음</th>
				<th>보낸사람</th>
				<th>제목</th>
				<th>보낸시간</th>
				<th><input type="checkbox" id="all"/><button onclick="del()" id = "del">삭제</button></th>
			</tr>
		</thead>
		<tbody id="list">

		</tbody>
	</table>
</body>
<script>


list();
function list(){
	$.ajax({
		type:'get',
		url:'recieveList.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			//console.log(data);
			if(!data.login){
				alert('로그인이 필요한 서비스 입니다.');
				location.href='./login';
			}else{
				listDraw(data.list);
			}
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function listDraw(list){
	console.log(list);
	var content = '';
	list.forEach(function(item,index){
		content += '<tr>';
		if (item.letter_chk == 1) {
			content+='<td>'+'읽음'+'</td>';
		}else{
			content+='<td>'+'안읽음'+'</td>';
		}
		content+='<td>'+item.send_user_id+'</td>';
		content+='<td><a href="detail.go?id='+item.letter_id+'">'+item.letter_tItle+'</a></td>';
		content+='<td>'+item.letter_date+'</td>';	
		content += '<td><input type="checkbox" value="'+item.letter_id+'"/></td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}


$('#all').click(function(e){	
	var $chk = $('input[type="checkbox"]');
	console.log($chk);
	if($(this).is(':checked')){
		$chk.prop('checked',true);
	}else{
		$chk.prop('checked',false);
	}	
});

function del(){
	
	var checkArr = [];
	
	$('input[type="checkbox"]:checked').each(function(idx,item){		
		if($(this).val()!='on'){
			
			checkArr.push($(this).val());
		}	
	});
	
	console.log(checkArr);
		
	$.ajax({
		type:'get',
		url:'delete.ajax',
		data:{'delList':checkArr},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success){
				alert(data.msg);
				list();
			}
		},
		error:function(e){
			console.log(e);
		}		
	});
	
}

</script>
</html>