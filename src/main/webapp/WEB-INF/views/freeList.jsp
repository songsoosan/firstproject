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
      <button onclick="listCall(1)">검색</button></br>
      <button onclick="location.href='freewrite.go'">글쓰기</button></br>
      게시물 갯수: 
      <select id = "pagePerNum">
         <option value="15">15</option>

      </select>
   </div>
   
   <table>
      <thead>
         <tr>
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
         <td colspan="5" id="paging">
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
      url: 'freeList.ajax',
      data: {
         'searchText' : $("input[name=searchText]").val(),
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
      list.forEach(function(freeboard,fboard_id){
         content +='<tr>';
         content +='<td>'+freeboard.fboard_id+'</td>';
         content +='<td><a href ="freeDetail.do?fboard_id='+freeboard.fboard_id+'">'+freeboard.fboard_title+'</td>';
         content +='<td>'+freeboard.user_id+'</td>';
         content +='<td>'+freeboard.fboard_date+'</td>';
         content +='<td>'+freeboard.fboard_views+'</td>';
         content +='</tr>';
      });
      $('#list').empty();
      $('#list').append(content);
}

</script>
</html>