<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .pagination {
      justify-content: center;
   }
	#del{
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
	}
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class="contentBox">
		<div class="text-center">
			<h2>받은 쪽지</h2>
		</div>
		<hr/>
		<div class="row mb-3">
			<div class="col-sm-6 d-flex">
				<button class="none adminArea btn btn-outline-primary float-start" onclick="location.href='recieveletter.go'">받은 쪽지함</button>
				<button class="none adminArea btn btn-outline-primary float-start mx-1" onclick="location.href='sendletter.go'">보낸 쪽지함</button>
				<span class="mt-1">게시물 갯수&nbsp;:&nbsp;</span>
				<select id="pagePerNum" class="form-select w-auto">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
				</select>
			</div>
			<div class="col-sm-6">
				<button class="none adminArea btn btn-outline-primary float-end mx-1" onclick="location.href='letterWrite.go'">글쓰기</button>
			</div>
		</div>
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>읽음</th>
				<th>보낸사람</th>
				<th>제목</th>
				<th>보낸시간</th>
				<th><input type="checkbox" id="all"/><button type="button" class="btn btn-danger" onclick="del()" id = "del">삭제</button></th>
			</tr>
		</thead>
		<tbody id="list">
		</tbody>
	</table>
		<div id="paging">
         	<nav aria-label="Page navigation">
            	<ul class="pagination" id="pagination"></ul>
         	</nav>
		</div>
	</div>
</div>
	<!-- <button type="button" class="btn btn-primary" onclick = "location.href='recieveletter.go'">받은 쪽지함</button>
	<button type="button" class="btn btn-primary" onclick = "location.href='sendletter.go'">보낸 쪽지함</button>
				쪽지 갯수 : 
	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select>
	<button type="button" class="btn btn-info" onclick = "location.href='letterWrite.go'" id = "ne">새 쪽지</button>
	<table>
		<thead>
			<tr>
				<th>읽음</th>
				<th>보낸사람</th>
				<th>제목</th>
				<th>보낸시간</th>
				<th><input type="checkbox" id="all"/><button type="button" class="btn btn-danger" onclick="del()" id = "del">삭제</button></th>
			</tr>
		</thead>
		<tbody id="list">
		</tbody>
		<tr>
			<td colspan="6" id="paging">	
					플러그인 사용	(twbsPagination)	
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>
	</table> -->
</body>
<script>
var showPage = 1;
list(showPage);

$('#pagePerNum').change(function(){
	list(showPage);
	$('#pagination').twbsPagination('destroy');
});

function list(page){
	$.ajax({
		type:'get',
		url:'recieveList.ajax',
		data:{		
			'page':page,
			'cnt':$('#pagePerNum').val()
		},
		dataType:'json',
		success:function(data){
			//console.log(data);
			if(!data.login){
				alert('로그인이 필요한 서비스 입니다.');
				location.href='login.go';
			}else{
				listDraw(data.list);
				
				$('#pagination').twbsPagination({
					startPage:data.currPage,	//시작페이지
					totalPages:data.pages,//총 페이지 수
					visiblePages:5, //보여줄 페이지 [1][2][3][4][5]
					onPageClick:function(event,page){// 페이지 클릭시 동작되는 함수(콜백)
						console.log(page, showPage);
						if(page != showPage){
							showPage = page;	
							list(page);							
						}				
					}
				});	
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