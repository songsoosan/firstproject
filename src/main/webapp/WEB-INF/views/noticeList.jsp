<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
      <div class="text-center">
         <h2>공지사항</h2>
      </div>
      <hr/>
      <div class="row mb-3">
         <div class="col-sm-6 d-flex">
            <span class="mt-1">게시물 갯수&nbsp;:&nbsp;</span>
            <select id="pagePerNum" class="form-select w-auto">
               <option value="5">5</option>
               <option value="10">10</option>
               <option value="15">15</option>
               <option value="20">20</option>
            </select>
         </div>
         <div class="col-sm-6">
            <button class="none adminArea btn btn-outline-danger float-end" onclick="hide()">숨기기</button>
            <button class="none adminArea btn btn-outline-primary float-end mx-1" onclick="location.href='write.go'">글쓰기</button>
         </div>
      </div>
      <table class="table table-striped table-bordered">
         <thead>
            <tr>
               <th class="none adminArea text-center col-md-1">숨기기</th>
               <th class="text-center col-md-1">번호</th>
               <th class="text-center" style="width:25%">제목</th>
               <th class="text-center col-md-1">작성자</th>
               <th class="text-center col-md-1">작성일</th>
               <th class="text-center col-md-1">조회수</th>
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
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
var showPage= 1;

adminCheck();
listCall(showPage);
	
function listCall(page){
   $.ajax({
      type: 'post',
      url: 'noticeList.ajax',
      data: {
         'searchText' : $("#searchText").val(),
         'page': page,
         'cnt' : $('#pagePerNum').val(),
         'loginId': loginId
      },
      dataType: 'json',
      success: function(data){
         listPrint(data.list);
         //paging plugin
         $('#pagination').twbsPagination({
            startPage: data.currPage,
            totalPages: data.pages,
            visiblePages: $("#pagePerNum").val(),
            onPageClick: function(event,page){
               if(page != showPage){
                  showPage=page;
                  listCall(page);
               }
               }
         });
      },
      error: function(e){
         console.log(e);
      }
   });
}

function listPrint(list){
   var content="";
   list.forEach(function(board,board_id){
      content +='<tr ' + (board.is_hide ? 'class="textDeco"' : "") + '>';
      content +='<td class="none adminArea text-center col-md-1"><input type="checkbox" name="chk" value="'+board.board_id+'"/></td>';
      content +='<td class="text-center col-md-1">'+board.board_id+'</td>';
      content +='<td class="text-center" style="width:25%"><a href ="boardDetail.do?board_id='+board.board_id+'">'+board.board_title+'</td>';
      content +='<td class="text-center col-md-1">'+board.user_id+'</td>';
      content +='<td class="text-center col-md-1">'+board.board_date+'</td>';
      content +='<td class="text-center col-md-1">'+board.board_views+'</td>';
      content +='</tr>';
   });
   $('#list').empty();
   $('#list').append(content);
   adminCheck();
}

function hide() {
   var hideList = new Array();
   $("input[name=chk]:checked").each(function() {
      hideList.push($(this).val());
   });
   $.ajax({
      type: 'post',
      url: 'hide.ajax',
      data: {
         'hideList' : hideList
      },
      dataType: 'text',
      success: function(data){
         listCall(1);
      },
      error: function(e){
         console.log(e);
      }
   });
}

function adminCheck() {
   if(loginId === "admin") {
      $(".adminArea").addClass("onlyAdmin");
   }
}

$("#searchText").keydown(function (key) {
   if (key.keyCode == 13) {
      listCall(1);
      $('#pagination').twbsPagination('destroy');
   }
});

$("#search").click(function (key) {
   listCall(1);
   $('#pagination').twbsPagination('destroy');
});

$('#pagePerNum').change(function(){
   listCall(showPage);
   $('#pagination').twbsPagination('destroy');
});

</script>
</html>