<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<style>
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="text-center">
         <h2>공지사항 등록</h2>
      </div>
      <hr/>
      <form action="write.do" id="writeForm" method="post" enctype="multipart/form-data">
         <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" name="board_title" required/>
            </div>
         </div>
         <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" id="user_id" name="user_id" readonly>
            </div>
         </div>
         <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
            <div class="col-sm-9">
               <textarea class="form-control" name="board_content" required></textarea>
            </div>
         </div>
         <div class="row">
            <div class="input-group">
               <label for="board_photo" class="col-sm-2 offset-sm-1 col-form-label">사진</label>
               <input type="file" class="form-control w-auto" id="board_photo" name="board_photo">
            </div>
         </div>
         <div class="text-center mt-3">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='./boardList.do'">리스트</button>
            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#saveModal">저장</button>
         </div>
      </form>
   </div>
</div>
<!-- Modal -->
<div class="modal fade" id="saveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         공지사항 등록 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="save()">등록</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);
function save() {
   $("#writeForm").submit();
}
</script>
</html>