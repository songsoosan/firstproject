<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>

</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="text-center">
	
	<form action="eventWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name = "cat_id" value = "e"/> 
			<div class="input-group mb-3 mt-3">
	            <label class="col-sm-2 offset-sm-1 col-form-label">제목</label>
	            <div class="col-sm-9">
	               <input type="text" class="form-control" name="event_title"/>
	            </div>
	        </div>
	         <div class="input-group mb-3 mt-3">
	            <label class="col-sm-2 offset-sm-1 col-form-label">작성자</label>
	            <div class="col-sm-9">
	               <input type="text" class="form-control" name="user_id" value="user_id" readonly>
	            </div>
	         </div>
	        <div class="input-group mb-3 mt-3">
	            <label class="col-sm-2 offset-sm-1 col-form-label">시작일</label>
	            <div class="col-sm-9">
	               <input type="date" class="form-control" id="event_start_date" name="event_start_date" placeholder="시작일">
	            </div>
	         </div>
	         <div class="input-group mb-3 mt-3">
	            <label class="col-sm-2 offset-sm-1 col-form-label">종료일</label>
	            <div class="col-sm-9">
	               <input type="date" class="form-control" id="event_end_date" name="event_end_date" placeholder="종료일">
	            </div>
	         </div>
	         	<div class="input-group mb-3 mt-3">
	            <label class="col-sm-2 offset-sm-1 col-form-label">내용</label>
	            <div class="col-sm-9">
	               <textarea class="form-control" rows="35" name="event_content"></textarea>
	            </div>
	         </div>
           <div class="row">
	            <div class="input-group">
	               <label for= event_photo class="col-sm-2 offset-sm-1 col-form-label">사진</label>
	               <input type="file" class="form-control w-auto" name="photo">
	            </div>
	         </div> 
			<div class="text-center mt-3">
	            <button type="button" class="btn btn-outline-secondary" onclick="location.href='./event'">리스트</button>
	            <button class="btn btn-outline-primary">저장</button>
	         </div>
	         </div>
      	</form>
   	</div>
   </div>

	         
	        
	        
	        
			
</body>
<script>

var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);

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


$(document).ready(function() {
	  $("#event_start_date").datepicker({
	    dateFormat: "yy-mm-dd" //날짜형식설정
	  });
	  
	  $("#event_end_date").datepicker({
	    dateFormat: "yy-mm-dd" 
	  });
	});

</script>
</html>