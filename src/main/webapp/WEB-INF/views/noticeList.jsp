<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
      <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
   span{
      text-align:center;
   }
   table{
      width: 100%
   }

   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   .none {
      display: none;
   }
   .onlyAdmin {
      display: block;
   }
   .textDeco {
      text-decoration: line-through;
   }

</style>
</head>
<body>
   <span>
   	<h2><a href="board.go">공지사항</a></h2>
   </span>
   <span>
   	<h2><a href="freeList.go">자유게시판</a></h2>
   </span>
   <div class="inline">
      <input id="search" type="text" name="searchText">
      <button onclick="listCall(1)">검색</button>
      <button class="none adminArea" onclick="location.href='write.go'">글쓰기</button>
   </div>
   <button class="none adminArea" onclick="hide()">숨기기</button>
   <div>
      게시물 갯수: 
      <select id = "pagePerNum">
         <option value="15">15</option>
      </select>
   </div>
   
   <table>
      <thead>
         <tr>
            <th class="none adminArea">숨기기</th>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="list">
      
      </tbody>
      <tr>
         <td colspan="6" id="paging">
            <div class = "container">
               <nav aria-label = "Page navigation" style="text-align:center">
                  <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
   </table>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
adminCheck();

function adminCheck() {
   if(loginId === "admin") {
      $(".adminArea").addClass("onlyAdmin");
   }
}

$("#search").keydown(function (key) {
   console.log("gg down ");
   if (key.keyCode == 13) {
      listCall(1);
   }
});

var showPage= 1;
listCall(showPage);

$('pagePerNum').change(function(){
   listCall(showPage);
   $('#pagination').twbsPagination('destroy');
});

function listCall(page){
   $.ajax({
      type: 'post',
      url: 'noticeList.ajax',
      data: {
         'searchText' : $("input[name=searchText]").val(),
         'page': page,
         'cnt' : $('#pagePerNum').val(), //게시물 갯수
         'loginId': loginId
      },
      dataType: 'json',
      success: function(data){
         listPrint(data.list);
         
         //paging plugin
         $('#pagination').twbsPagination({
            startPage: data.currPage,
            totalPages: data.pages,
            visiblePages: 5,
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
   console.log("listPrint!");
   var content="";
   
   //java.sql.Date 는 js에서 읽지 못해 밀리세컨드로 반환한다.
      // 해결방법 1. DTO에서 Date를 String으로 반환
      // 해결방법 2. js 에서 변환
      list.forEach(function(board,board_id){
         content +='<tr ' + (board.is_hide ? 'class="textDeco"' : "") + '>';
         content +='<td class="none adminArea"><input type="checkbox" name="chk" value="'+board.board_id+'"/></td>';
         content +='<td>'+board.board_id+'</td>';
         content +='<td><a href ="boardDetail.do?board_id='+board.board_id+'">'+board.board_title+'</td>';
         content +='<td>'+board.user_id+'</td>';
         content +='<td>'+board.board_date+'</td>';
         content +='<td>'+board.board_views+'</td>';
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

</script>
</html>