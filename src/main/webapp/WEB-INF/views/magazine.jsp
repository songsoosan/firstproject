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
           <button type="button" class="mx-1 none adminArea btn btn-outline-primary" onclick="location.href='./eventUpdate.go?event_id=${dto.event_id}'" >수정</button>
           <button type="button" class="btnCtrl guest btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eventdelete">삭제</button>
      </div>
      <input type="hidden" name = "event_id" value="${dto.event_id}">
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.event_title}">
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">시작일</label>
         <div class="col-sm-9">
            <input type="date" class="form-control-plaintext" value="${dto.event_start_date}" disabled>
         </div>
        </div>
        <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">종료일</label>
         <div class="col-sm-9">
            <input type="date" class="form-control-plaintext" value="${dto.event_end_date}" disabled>
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
            <input type="text" class="form-control-plaintext" value="${dto.event_date}">
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.event_title}">
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
      </div>
      </div>

<!-- Modal -->
<div class="modal fade" id="eventdelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	이벤트 삭제 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="location.href='./eventDelete.do?event_id=${dto.event_id}'">삭제</button>
      </div>
    </div>
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


</script>
</html>