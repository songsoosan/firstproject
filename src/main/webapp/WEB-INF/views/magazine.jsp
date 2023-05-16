<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
   <title>Insert title here</title>
      <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
      <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
      <style>
         b{
            color:red;
         }

         table{
            width:100%;
         }
         
         table, td, th{
            border : 1px solid;
            border-collapse : collapse;
            padding: 5px;
         }
         
         #paging{
            text-align: center;
         }
      </style>
</head>
<body>
<%@ include file="./header.jsp" %>
   <h3>최신 매거진</h3>
   게시물 갯수 : 
   <select id="pagePerNum">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
   </select>
   <button onclick="location.href='magazineWrite.go'">글쓰기</button>
   <table>
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
         </tr>
      </thead>
      <tbody id="list">         
      <!-- 리스트가 출력될 영역 -->
      </tbody>
      <tr>
         <td colspan="6" id="paging">   
            <!--    플러그인 사용   (twbsPagination)   -->
            <div class="container">                           
               <nav aria-label="Page navigation" style="text-align:center">
                  <ul class="pagination" id="pagination"></ul>
               </nav>               
            </div>
         </td>
      </tr>      
   </table>
</body>
<script>

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
            startPage:data.currPage,   //시작페이지
            totalPages:data.pages,//총 페이지 수
            visiblePages:5, //보여줄 페이지 [1][2][3][4][5]
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


</script>
</html>