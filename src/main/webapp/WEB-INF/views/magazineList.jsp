<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel= "stylesheet" href="resources/css/paging.css" type="text/css">
<style>
	.none {
      display: none !important;
   }
   .onlyAdmin {
      display: block !important;
   }
   th.onlyAdmin, td.onlyAdmin {
      display: table-cell !important;
   }
   .textDeco {
      text-decoration: line-through;
   }
   #list a {
      text-decoration-line: none;
   }
   .pagination {
      justify-content: center;
   }
</style>
</head>
<body>
<%@ include file="./header.jsp" %>	
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="row mb-2 text-center">
		<h3>최신 매거진</h3>
		</div>
	  <hr/>
	   <div>
         <div class="d-flex" style="float: left;">
		<span class="mt-1">게시물 갯수&nbsp;:&nbsp;</span>
		<select id="pagePerNum">
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select>
		</div>
			<div style="float: right;" class="d-flex">
				<button class="btnCtrl btn btn-outline-primary float-right" onclick="location.href='magazineWrite.go'">글쓰기</button>
			</div>
	     </div>
	     <div style="margin-top: 70px;">
      <table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th class="text-center col-md-1">번호</th>
				<th class="text-center" style="width:25%">제목</th>
				<th class="text-center col-md-1">작성자</th>
				<th class="text-center col-md-1">조회수</th>
				<th class="text-center col-md-1">작성일</th>
			</tr>
		</thead>
		<tbody id="list">			
		<!-- 리스트가 출력될 영역 -->
		</tbody>
	</table>
		</div>
			<div colspan="6" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	-->
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>		
		   </div>
	   </div>
	 </div>
	 	  
	
</body>

<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
buttonControl(loginId);
var showPage = 1;
listCall(showPage);

$('#pagePerNum').change(function(){
	listCall(showPage);
	// 페이지처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
	// 그래서 pagePerNum 이 변경되면 부수고 다시 만들어야 한다.
	$('#pagination').twbsPagination('destroy');
});


function listCall(page){
	$.ajax({
		type:'post',
		url:'magazine.ajax',
		data:{
			'page':page,
			'cnt':$('#pagePerNum').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			listPrint(data.list);			
			
			//paging plugin
			$('#pagination').twbsPagination({
				startPage:data.currPage,	//시작페이지
				totalPages:data.pages,//총 페이지 수
				visiblePages:5, //보여줄 페이지 [1][2][3][4][5]
				 next : '<span style="color: #87d1bf;">></span>', 
	             last : '<span style="color: #87d1bf;">>></span>',
	             first : '<span style="color: #87d1bf;"><<</span>',
	             prev : '<span style="color: #87d1bf;"><</span>',
				onPageClick:function(event,page){// 페이지 클릭시 동작되는 함수(콜백)
					console.log(page, showPage);
					if(page != showPage){
						showPage = page;	
						listCall(page);							
					}				
				}
			});	
			
		},
		error:function(e){
			console.log(e);
		}
	});
}

function listPrint(list){
	var content = '';
	//java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
	// 해결방법 1. DTO 에서 Date 를 String 으로 반환
	// 해결방법 2. js 에서 변환
	list.forEach(function(board, board_id){
		content +='<tr>';
		content +='<td>'+board.board_id+'</td>';
		content +='<td><a href="magazineDetail.do?board_id='+board.board_id+'">'+board.board_title+'</td>';
		
		
		
	
		
		content +='<td>'+board.user_id+'</td>';
		content +='<td>'+board.board_views+'</td>';
		
		//content +='<td>'+item.reg_date+'</td>';
		var date = new Date(board.board_date);
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';//en-US
		content +='</tr>';
	});

	
	$('#list').empty();
	$('#list').append(content);
}


function buttonControl(loginId) {
	if(loginId == 'null') {
	$(".btnCtrl").addClass("none");
	}
	}
	
function buttonControl(loginId) {
    if (loginId === 'null') {
        $(".btnCtrl").addClass("none");
    } else {
        adminCheck();
    }
}


function adminCheck() {
    if (loginId === "admin") {
        $(".btnCtrl").removeClass("none");
    } else {
        $(".btnCtrl").addClass("none");
    }
}



</script>
</html>