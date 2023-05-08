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
</style>
</head>
<body>
   
   <span><h2>공지사항</h2></span>
   <div>
      <input type="text" name="searchText">
      <button onclick="listCall(1)">검색</button>
      <button onclick="location.href='write.go'">글쓰기</button>
   </div>
   <div>
      게시물 갯수: 
      <select id = "pagePerNum">
         <option value="5">5</option>
         <option value="10">10</option>
         <option value="15">15</option>
         <option value="20">20</option>
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
            <th>숨기기</th>
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
         'cnt' : $('#pagePerNum').val()
      },
      dataType: 'json',
      success: function(data){
         console.log(data);
         listPrint(data.list);
         
         //paging plugin
         $('#pagination').twbsPagination({
            startPage: data.currPage,
            totalPages: data.pages,
            visiblePages: 5,
            onPageClick: function(event,page){
               console.log(page, showPage);
               
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
   
   //java.sql.Date 는 js에서 읽지 못해 밀리세컨드로 반환한다.
      // 해결방법 1. DTO에서 Date를 String으로 반환
      // 해결방법 2. js 에서 변환
      list.forEach(function(board,board_id){
         content +='<tr>';      
         content +='<td>'+board.board_id+'</td>';
         content +='<td><a href ="boardDetail.do?board_id='+board.board_id+'">'+board.board_title+'</td>';
         content +='<td>'+board.user_id+'</td>';

         
         var date = new Date(board.board_date);
         content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>'; //en-US 를 ko-KR로 바꿔준다.
         content +='<td>'+board.board_views+'</td>';
         content +='</tr>';
         
      });
      $('#list').empty();
      $('#list').append(content);
}

</script>
</html>