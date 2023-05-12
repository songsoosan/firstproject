<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
   div{
    text-align: center;
       display :inline-block;
   }
   table{
      width: 100%
   }
   table, th, td{
      border: 2px solid green;
      border-collapse: collapse;
      padding: 5px 10pxl
   }
   .none {
      display: none;
   }
   .onlyAdmin {
      display: block;
   }
</style>
</head>
<body>
   <input type="hidden" name = "board_id" value="${dto.board_id}">
   <table>
      <tr>
         <th>제목</th>
         <td colspan="3">${dto.board_title}</td>
      </tr>
      <tr>
         <th>작성자</th>
         <td colspan="3">${dto.user_id}</td>
      </tr>
      <tr>
         <th>작성일</th>
         <td colspan="3">${dto.board_date}</td>
      </tr>
      <tr>
         <th>내용</th>
         <td colspan="3">${dto.board_content}</td>
      </tr>
      <c:if test="${dto.photo_name ne null}">
      <tr>
         <th>사진</th>
         <td colspan="3">
            <img width="500" src="/photo/${dto.photo_name}"/>
            <input type="hidden" name="photo_id" value="${dto.photo_id}"/>
         </td>
      </tr>
      </c:if>
      <tr>
         <th colspan="4">
         <div><input type="button" onclick="location.href='./boardList.do'" value="리스트"/></div>
         <div><input class="none adminArea" type="button" onclick="location.href='./boardUpdate.go?board_id=${dto.board_id}'" value="수정"/></div>
         <div><input class="none adminArea" type="button" onclick="location.href='./boardDelete.go?board_id=${dto.board_id}'" value="삭제"/></div>
         </th>
      </tr>
   
      <c:forEach items="${commentList}" var="commentList" varStatus="status">
         <tr class="reply">
            <th>${commentList.user_id} </th>
            <td>
               <p class="readMode">${commentList.comment_content}</p>
               <textarea rows="3" name="comment_content" class="editMode none">${commentList.comment_content}</textarea>
            </td>
            <td>${commentList.comment_date}</td>
            <td>
               <c:if test="${commentList.user_id eq loginId}">
               <a class="readMode" href="javascript:void(0);" onclick="writeMode(${status.index});">수정</a>
               <a class="readMode" href="noticecommentDelete.do?comment_id=${commentList.comment_id}&board_id=${dto.board_id}">삭제</a>
               <a class="editMode none" href="javascript:void(0);" onclick="commentUpdate(${status.index}, '${commentList.comment_id}', ${dto.board_id});">확인</a>
               <a class="editMode none" href="javascript:void(0);" onclick="readMode(${status.index});">취소</a>
               </c:if>
               <c:if test="${commentList.user_id ne loginId}">
               <a href="#">신고</a>
               </c:if>                    
            </td>
         </tr>
      </c:forEach>

   <form action="noticecommentWrite.do" method="post">
         <input type="hidden" name = "board_id" value="${dto.board_id}">
         <th>
            <input type="hidden" name="user_id" value="<%=(String)session.getAttribute("loginId")%>"/>
            <b><%=(String)session.getAttribute("loginId")%></b>
         </th>
         <th>
            <input type="text" name="comment_content"/>
         </th>
         <th colspan="2">
            <button>작성</button>
         </th>
   </form>
   </table>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
if(loginId === "admin") {
   $(".adminArea").addClass("onlyAdmin");
}

function writeMode(idx) {
   $("tr.reply:eq("+idx+")").find(".editMode").removeClass("none");
   $("tr.reply:eq("+idx+")").find(".readMode").addClass("none");
}

function readMode(idx) {
   $("tr.reply:eq("+idx+")").find(".readMode").removeClass("none");
   $("tr.reply:eq("+idx+")").find(".editMode").addClass("none");
}

function commentUpdate(idx, comment_id, board_id) {
   var comment_content = $("tr.reply:eq("+idx+")").find("textarea[name=comment_content]").val();
   $.ajax({
      type: 'post',
      url: 'commentUpdate.ajax',
      data: {
         'board_id' : board_id,
         'comment_id': comment_id,
         'comment_content': comment_content
      },
      dataType: 'text',
      success: function(res){
         location.href='boardDetail.do?board_id='+board_id;
      },
      error: function(e){
         console.log(e);
      }
   });
}

</script>
</html>