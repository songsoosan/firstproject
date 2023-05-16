<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="text-center">
	<hr/>
	<form action="magazinewrite.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name = "cat_id" value = "m"/> 
		<div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" name="board_title"/>
            </div>
        </div>
        <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" name="user_id" value="user_id" readonly>
            </div>
         </div>
		<div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
            <div class="col-sm-9">
               <textarea class="form-control" name="board_content"></textarea>
            </div>
         </div>
           <div class="row">
            <div class="input-group">
               <label for= magazine_photo class="col-sm-2 offset-sm-1 col-form-label">사진</label>
               <input type="file" class="form-control w-auto" name="photo">
            </div>
         </div> 
		<div class="text-center mt-3">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='./magazine.do'">리스트</button>
            <button class="btn btn-outline-primary">저장</button>
         </div>
      </form>
   </div>
   </div>
</div>
		

</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);

var linkInput = document.getElementById("linkInput");
var linkAnchor = document.getElementById("linkAnchor");

linkInput.addEventListener('input', function() {
    var link = linkInput.value.trim();
    if (link !== "") {
        linkAnchor.href = link;
        linkAnchor.innerText = link;
    } else {
        linkAnchor.href = "";
        linkAnchor.innerText = "";
    }
});

</script>
</html>