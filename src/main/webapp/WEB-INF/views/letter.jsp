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
	}
	button{
		margin: 5px;
			
	}
	table{
		width: 100%;
	}
	

</style>
</head>
<body>
<h3>쪽지</h3>
	<table>
		<thead>
			<tr>
				<td>받은 쪽지함</td>
				<td>보낸 쪽지함</td>
				<td colspan = 2><button onclick = "location.href='letterWrite.go'">새 쪽지</button></td>
			</tr>
			<tr>
				<th>보낸사람</th>
				<th>제목</th>
				<th>보낸시간</th>
				<th><input type="checkbox" id="all"/></th>
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
		url:'recievList.ajax',
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
		content+='<td>'+item.send_user_id+'</td>';
		content+='<td>'+item.letter_tItle+'</td>';
		content+='<td>'+item.letter_date+'</td>';	
		content += '<td><input type="checkbox" value="'+item.id+'"/></td>';
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
</script>
</html>