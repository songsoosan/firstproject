<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="text-center">
      <hr/>
	
	<% String userId = (String) session.getAttribute("loginId"); %>
	<form action=eventUpdate.do method="post" enctype="multipart/form-data">
		<input type="hidden" name="event_id" value="${dto.event_id}"/>
		<input type="hidden" name = "cat_id" value = "e"/> 
		<div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" name="event_title" value="${dto.event_title}"/>
            </div>
         </div>
          <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
            <div class="col-sm-9">
               <input type="text" class="form-control" name="user_id" value="${dto.user_id}" readonly>
            </div>
         </div>
          <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">시작일</label>
            <div class="col-sm-9">
               <input type="date" class="form-control" id="event_start_date" name="event_start_date" placeholder="시작일" value="${dto.event_start_date}" >
            </div>
         </div>
          <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">종료일</label>
            <div class="col-sm-9">
               <input type="date" class="form-control" id="event_end_date" name="event_end_date" placeholder="종료일" value="${dto.event_end_date}" >
            </div>
         </div>
         <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
            <div class="col-sm-9">
               <textarea class="form-control" rows="35" name="event_content">${dto.event_content}</textarea>
            </div>
         </div>  
		 <div class="row">
		 <c:if test="${dto.photo_name eq null}">
		 <div class="input-group">
                    <label for="board_photo" class="col-sm-2 offset-sm-1 col-form-label">사진</label>
                    <input type="file" class="form-control w-auto" name="photo">
                </div>
            </div>
        </c:if>
        <c:if test="${dto.photo_name ne null}">
            <div class="offset-sm-3">
            	<p id="filename">
                    	<img max-width="300" max-height="300" src="/photo/${dto.photo_name}"/>
                    	<button id="deleteButton" onclick="delphoto()">삭제</button>
                </p>
					<input type="file" name="photo" id ="fileInput" onchange="checkExtension()"/>	
					<input type="hidden" name="deletePhoto" value="false" id="deletePhotoInput">
                    <input type="hidden" name="photo_name" value="${dto.photo_name}">
            </div>
       </c:if>
            <div class="text-center mt-3">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='./event'">리스트</button>
                <button class="btn btn-outline-primary">저장</button>
            </div>
        </form>
    </div>
</div>
         
         
         
			<tr>
				<th>제목</th>
				<td><input type="text" name="event_title" value="${dto.event_title}"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_id" value="<%= userId %>" readonly/></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td><input type="date" id="event_start_date" name="event_start_date" placeholder="시작일"
					value="${dto.event_start_date}"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="date" id="event_end_date" name="event_end_date" placeholder="종료일"
					value="${dto.event_end_date}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="event_content">${dto.event_content}</textarea></td>
			</tr>
			<tr>
				<th>대표사진</th>
				<td>
					<p id="filename">
					<c:if test="${dto.photo_name eq null}">
						<input type="file" name="photo"/>
					</c:if>
					<c:if test="${dto.photo_name ne null }">
						<img src="/photo/${dto.photo_name}"/>
						<button id="deleteButton" onclick="delphoto()">삭제</button>
					</p>
					 <input type="file" name="photo" id ="fileInput" onchange="checkExtension()"/>	
					   <input type="hidden" name="deletePhoto" value="false" id="deletePhotoInput">
                      <input type="hidden" name="photo_name" value="${dto.photo_name}">	
					</c:if>	
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./event'" value="리스트"/>
					<button>저장</button>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);

$(document).ready(function() {
	  $("#event_start_date").datepicker({
	    dateFormat: "yy-mm-dd" // 날짜 형식 설정
	  });
	  
	  $("#event_end_date").datepicker({
	    dateFormat: "yy-mm-dd" // 날짜 형식 설정
	  });
	});
	
function delphoto(){
	   document.getElementById("filename").remove();    
	    document.getElementById("deletePhotoInput").value = "true";
	    
	}

	function checkExtension() {
	    var file = document.getElementById("fileInput");
	    var fileName = file.value;
     var idx = fileName.lastIndexOf(".");
   
     // 확장자명 추출
     var ext = fileName.slice(idx + 1).toLowerCase();
   
     // 확장자명이 jsp인 경우 경고창 출력
     if (ext != "jpg" && ext != "png") {
       alert("확장자가 .jpg, .png인 파일만 선택할 수 있습니다.");
       file.value = "";
       return false;
           }


	    if(document.getElementById("filename")) {
	            alert("이미 등록된 이미지가 있습니다. 새로운 이미지를 등록하려면 삭제 버튼을 눌러주세요.");
	            file.value = "";
	            return false;
	           }    
	  }

</script>
</html>