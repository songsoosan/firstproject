<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<% String userId = (String) session.getAttribute("loginId"); %>
			<c:forEach items="dto">
			<div class="input-group borderBottom mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
				<div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dtoo.board_title}" readonly>
         </div>
      </div>	
       <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dtoo.user_id}" readonly>
         </div>
      </div>
       <div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">작성일</label>
         <div class="col-sm-9">
            <input type="text" class="form-control-plaintext" value="${dtoo.board_date}" readonly>
         </div>
      </div>
		<div class="input-group borderBottom mb-3 mt-3">
         <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
         <div class="col-sm-9">
             <textarea class="form-control" rows="25" readonly>${dtoo.board_content}</textarea>
         </div>
      </div>
      
      </div>
		<c:if test="${dtoo.photo_name ne null}">
			<div class="input-group mb-3 mt-3">
				<label class="col-sm-2 offset-sm-1 col-form-label">사진</label>
				<div class="col-sm-9">
					<img max-width="300" max-height="300" src="/photo/${dtoo.photo_name}"/>
				</div>
        	 </div>
		</c:if>
			<div class="fr" style="display:inline-flex;">
		         <button type="button" class="btn btn-outline-secondary" onclick="location.href='./magazine.do'">리스트</button>
		         	<button class="btnCtrl btn btn-outline-primary float-right" onclick="location.href='./magazineUpdate.go?board_id=${dtoo.board_id}'" >수정</button>
		          	<button class="btnCtrl btn btn-outline-primary float-right" onclick="location.href='./magazineDelete.do?board_id=${dtoo.board_id}'" >삭제</button>
		       
				<input type="button" onclick="location.href='./reportWrite.go?board_id=${dtoo.board_id}&board_title=${dtoo.board_title}&cat_id=${dtoo.cat_id}'" value="신고"/>
		     </div>
		</c:forEach>
	
		
		<br/><br/>
		
		<!-- 매거진 댓글 리스트 가져오기-->
		<div>
         <b style="margin-left:45px;">댓글</b>${fn:length(magacommentlist)}<b>개</b>
      </div>
      <hr/>
      <table class="table">
      <c:forEach items="${magacommentlist}" var="comment" varStatus="status">
      <tr class="reply">
            <th class="col-sm-2 px-5">${comment.user_id} </th>
            <td class="col-sm-6">
            <p class="readMode">${comment.comment_content}</p>
               <textarea rows="3" name="comment_content" class="editMode none form-control">${comment.comment_content}</textarea>
     		</td>
     		<td class="col-sm-2 text-center">${comment.comment_date}</td>
            <td class="col-sm-2">
               <c:if test="${comment.user_id eq sessionScope.loginId}">
                  <button type="button" class="readMode btn btn-outline-primary" onclick='location.href="commentupdate.go?comment_id=${comment.comment_id}&board_id=${dtoo.board_id}&comment_content=${comment.comment_content}"'>수정</button>
                  <button type="button" class="readMode btn btn-outline-danger" onclick='location.href="commentdel.do?comment_id=${comment.comment_id}&board_id=${dtoo.board_id}"'>삭제</button>
               </c:if>
               <c:if test="${comment.user_id ne sessionScope.loginId}">
                  <button type="button" class="btn btn-outline-danger" onclick="location.href='./reportWrite.go?board_id=${dtoo.board_id}&board_title=${dtoo.board_title}&cat_id=${dtoo.cat_id}'">신고</button>
               </c:if>                    
               </td>
            </tr>
      </c:forEach>
     </table>
      <form action="commentWrite.do" method="post">
         <input type="hidden" name="board_id" value="${dtoo.board_id}">
	    <input type="hidden" name="comment_id" value="${magacommentlist2.comment_id}">
         <table class="table">
            <c:if test="${loginId ne null}">
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
            </c:if>
            <c:if test="${loginId eq null}">
				<tr>
					<th class="col-sm-8">
                  <textarea class="form-control" name="comment_content" readonly>회원만 작성 가능합니다.</textarea>
               </th>
				</tr>
			</c:if>
         </table>
      </form>
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
		$("tr.reply:eq(" + idx + ")").find(".editMode").removeClass("none");
		$("tr.reply:eq(" + idx + ")").find(".readMode").addClass("none");
	}

	function readMode(idx) {
		$("tr.reply:eq(" + idx + ")").find(".readMode").removeClass("none");
		$("tr.reply:eq(" + idx + ")").find(".editMode").addClass("none");
	}




</script>
</html>