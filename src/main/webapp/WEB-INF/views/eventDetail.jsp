<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
         <h2 class="text-center">이벤트 상세</h2>
         
         <hr/>
         
      </div>
      <div class="fr" style="display:inline-flex;">
		 <button type="button" class="btn btn-outline-secondary" onclick="location.href='./event.do'">리스트</button>
		 <button class="btnCtrl btn btn-outline-primary float-right" onclick="location.href='./eventUpdate.go?event_id=${dto.event_id}'" >수정</button>
		 <button class="btnCtrl btn btn-outline-primary float-right" onclick="confirmDelete('${dto.event_id}')" >삭제</button>
		       
		<input type="button" onclick="location.href='./reportWrite.go?evebt_id=${dto.event_id}&board_title=${dto.event_title}&cat_id=${dto.cat_id}'" value="신고"/>
	</div>
      <input type="hidden" name = "event_id" value="${dto.event_id}">
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.event_title}" readonly>
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
            <input type="text" class="form-control-plaintext" value="${dto.user_id}" readonly>
         </div>
      </div>
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">작성일</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dto.event_date}" readonly>
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
      <hr/>
      
      <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
         <div class="col-sm-9">
             <textarea class="form-control" rows="50" readonly>${dto.event_content}</textarea>
         </div>
      </div>
      
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
loginId = '<%=(String)session.getAttribute("loginId")%>';
buttonControl(loginId);

function buttonControl(loginId) {
	if(loginId == 'null') {
	$(".btnCtrl").addClass("none");
	}
	}
	
function buttonControl(loginId) {
    if (loginId === 'null') {
        $(".btnCtrl").addClass("none");
    } else {
        adminCheck();
    }
}


function adminCheck() {
    if (loginId === "admin") {
        $(".btnCtrl").removeClass("none");
    } else {
        $(".btnCtrl").addClass("none");
    }
}

function writeMode(idx) {
   $("tr.reply:eq("+idx+")").find(".editMode").removeClass("none");
   $("tr.reply:eq("+idx+")").find(".readMode").addClass("none");
}

function readMode(idx) {
   $("tr.reply:eq("+idx+")").find(".readMode").removeClass("none");
   $("tr.reply:eq("+idx+")").find(".editMode").addClass("none");
}

function confirmDelete(event_id) {
	   // 확인창 띄우기
	   var result = confirm("이밴트 삭제 하시겠습니까?");

	   // 확인 버튼 클릭 시 링크 실행
	   if (result) {
	      location.href = "./eventDelete.do?event_id=" + event_id;
	   }
	}

</script>
</html>