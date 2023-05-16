<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<style>
   .none {
      display: none !important;
   }
   .onlyAdmin {
      display: block !important;
   }
   .borderBottom {
        border-bottom: solid 1px #49c5a2;
   }
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="row mb-2 text-center">
         <h2 class="text-center">공지사항 상세</h2>
         <hr/>
      </div>
      <div class="fr" style="display:inline-flex;">
         <button type="button" class="btn btn-outline-secondary" onclick="location.href='./boardList.do'">리스트</button>
           <button type="button" class="mx-1 none adminArea btn btn-outline-primary" onclick="location.href='./boardUpdate.go?board_id=${dto.board_id}'" >수정</button>
           <button type="button" class="none adminArea btn btn-outline-danger" onclick="location.href='./boardDelete.go?board_id=${dto.board_id}'" >삭제</button>
      </div>
      <input type="hidden" name = "board_id" value="${dto.board_id}">
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.board_title}">
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.user_id}">
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">작성일</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.board_date}">
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.board_title}">
         </div>
      </div>
      <c:if test="${dto.photo_name ne null}">
         <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">사진</label>
            <div class="col-sm-9">
               <img max-width="300" max-height="300" src="/photo/${dto.photo_name}"/>
            </div>
         </div>
      </c:if>
      <div>
         <b style="margin-left:45px;">댓글</b>${fn:length(commentList)}<b>개</b>
      </div>
      <hr/>
      <table class="table">
      <c:forEach items="${commentList}" var="commentList" varStatus="status">
         <tr class="reply">
            <th class="col-sm-2 px-5">${commentList.user_id} </th>
            <td class="col-sm-6">
               <p class="readMode">${commentList.comment_content}</p>
               <textarea rows="3" name="comment_content" class="editMode none form-control">${commentList.comment_content}</textarea>
            </td>
            <td class="col-sm-2 text-center">${commentList.comment_date}</td>
            <td class="col-sm-2">
               <c:if test="${commentList.user_id eq loginId}">
                  <button type="button" class="readMode btn btn-outline-primary" onclick="writeMode(${status.index});">수정</button>
                  <button type="button" class="readMode btn btn-outline-danger" onclick="location.href='noticecommentDelete.do?comment_id=${commentList.comment_id}&board_id=${dto.board_id}'">삭제</button>
                  <button type="button" class="editMode none btn btn-outline-primary" onclick="commentUpdate(${status.index}, '${commentList.comment_id}', ${dto.board_id});">확인</button>
                  <button type="button" class="editMode none btn btn-outline-danger" onclick="readMode(${status.index});">취소</button>
               </c:if>
               <c:if test="${commentList.user_id ne loginId}">
                  <button type="button" class="btn btn-outline-danger" onclick="location.href='./reportWrite.go'">신고</button>
               </c:if>                    
               </td>
            </tr>
      </c:forEach>
      </table>
      <form action="noticecommentWrite.do" method="post">
         <input type="hidden" name = "board_id" value="${dto.board_id}">
         <table class="table">
            <tr>
               <th class="col-sm-2 px-5">
                  <input type="hidden" name="user_id" value="<%=(String)session.getAttribute("loginId")%>"/>
                  <b><%=(String)session.getAttribute("loginId")%></b>
               </th>
               <th class="col-sm-8">
                  <textarea class="form-control" name="comment_content"></textarea>
               </th>
               <th class="col-sm-2">
                  <button class="btn btn-outline-primary">작성</button>
               </th>
            </tr>
         </table>
      </form>
   </div>
</div>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
if(loginId === "admin") {
   console.log("gg");
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