<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>	div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 100%;
		border: 1px solid black;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
	.ul {
		list-style-type: none;
		text-align: center;
		display:inline-block;
		width: 100%;
	}
	.li {
		float: left;
		width: 16%;
	}
	.li > a {
		text-decoration-line: none;
		font-size: 25px;
	}
	.menu{
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
	}
	.divImages{
	margin-top: 100px;
	}
	.img{
		width: 20%;
		height: 30%;
		vertical-align: middle;
		display:inline-block;
	}
	.logout-button {
 		float: right;
	}
	
	

</style>

</head>
<body>
	<div class="d-flex align-items-center justify-content-center">
	<a href="main.go" class="me-3">
		<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
	</a>
	<input type="text" class="form-control me-3" style="width: 300px;" placeholder="검색"/>
	&nbsp;&nbsp;&nbsp;
	<a href="profile.do" class="me-3">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
		</svg>
	</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="recipeWrite.go" class="me-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="recieveletter.go">
			<svg xmlns="http://www.w3.org/2000/svg"width="30" height="30" fill="currentColor" class="bi bi-chat-left-dots-fill" viewBox="0 0 16 16">
				<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			</svg>
		</a>
	</div>
	<c:if test="${sessionScope.loginId eq null}">
		<button class="logout-button" onclick="location.href='/login.go'">로그인</button>	
	</c:if>
	<c:if test="${sessionScope.loginId ne null}">
		<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>
	</c:if>	
		<div class="menu text-center">
		    <ul class="nav nav-pills d-flex justify-content-center">
		        <li class="nav-item">
		            <a class="nav-link" href="recipe.go">레시피</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="ranking.go">랭킹</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="classList.go">클래스</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="magazine.go">매거진</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="board.go">게시판</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="event.go">이벤트</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link" href="admin.go">관리자(test)</a>
		        </li>
		    </ul>
		</div>

			<div class="container">
			  <c:if test="${adminChk ne null}">
			    <div class="row">
			      <div class="col-md-12 text-left">
			        <input type="button" onclick="location.href='./class.update.go?cl_id=${dto.cl_id}'" class="btn btn-primary" value="수정"/>
			      </div>
    		</div>
  			</c:if>
			<div class="row">

			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body">
			          <h5 class="card-title">제목</h5>
			          <p class="card-text">${dto.cl_subject}</p>
			        </div>
			      </div>
			    </div>
			  </div>
			
			  <c:if test="${dto.photo_name ne null}">
			    <div class="row">
			      <div class="col-md-12">
			        <div class="card mb-3">
			          <div class="card-body">
			            <h5 class="card-title"></h5>
			            <img class="img-fluid" src="/photo/${dto.photo_name}" alt="Class Photo">
			          </div>
			        </div>
			      </div>
			    </div>
			  </c:if>
			
			  <div class="row">
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">모집기간</h5>
			          <p class="card-text">${dto.cl_period}~${dto.cl_deadlinePeriod}</p>
			        </div>
			      </div>
			    </div>
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">마감 인원</h5>
			          <p class="card-text">${dto.cl_deadline}<c:if test="${adminChk ne null}"><input type="button" onclick="location.href='class.appList.do?cl_id=${dto.cl_id}'" class="btn btn-primary" value="신청 리스트"/></c:if></p>
			        </div>
			      </div>
			    </div>
			  </div>
			
			  <div class="row">
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">강사 소개</h5>
			          <p class="card-text"><a href="profile2.do?user_id=${dto.cl_teacher}&cl_id=${dto.cl_id}">${dto.cl_teacher}</a></p>
			        </div>
			      </div>
			    </div>
			    </div>
			    
			
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">수업 날짜</h5>
			          	<p class="card-text">${dto.cl_date}</p>
			        </div>
			      </div>
			    </div>

			
			  <div class="row">
			    <div class="col-md-6">
			      <div class="card mb-3">
			      	<c:if test="${dto.cl_ing_chk == 1}">
			        <div class="card-body text-center">
			          <h5 class="card-title">재료 제공 여부</h5>
			          <p class="card-text">제공</p>
			        </div>
			        </c:if>
			        <c:if test="${dto.cl_ing_chk == 0}">
			        <div class="card-body text-center">
			          <h5 class="card-title">재료 제공 여부</h5>
			          <p class="card-text">미제공</p>
			        </div>
			        </c:if>
			      </div>
			    </div>
			   
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">클래스 상태</h5>
			          <p class="card-text">${dto.cl_status}</p>
			        </div>
			      </div>
			    </div>
			  </div>
			
			  <div class="row">
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">주소</h5>
			          <p class="card-text">
			            ${dto.postcode}<br>
			            ${dto.address}<br>
			            ${dto.detailAddress}<br>
			            ${dto.extraAddress}
			          </p>
			        </div>
			      </div>
			    </div>
			    <div class="col-md-6">
			      <div class="card mb-3">
			        <div class="card-body text-center">
			          <h5 class="card-title">수업소개</h5>
			          <p class="card-text">${dto.cl_content}</p>
			        </div>
			      </div>
			    </div>
			  </div>
			
			  <div class="row">
			    <div class="col-md-12">
			      <c:if test="${dto.cl_deadline <= dto.join_count}">
			        <div class="card mb-3">
			          <div class="card-body text-center">
			            <h5 class="card-title">클래스 신청하기</h5>
			            <p class="card-text">마감</p>
			          </div>
			        </div>
			      </c:if>
			      <c:if test="${dto.cl_deadline > dto.join_count}">
			        <div class="card mb-3">
			          <div class="card-body text-center">
			            <h5 class="card-title">클래스 신청하기</h5>
			            <input type="button" onclick="location.href='./class.appWrite.go?cl_id=${dto.cl_id}'" class="btn btn-primary" value="신청"/>
			          </div>
			        </div>
			      </c:if>
			    </div>
			  </div>
			</div>
			
			
			
				<!-- 문의글 댓글 리스트 가져오기-->
		<c:if test="${clReviewList.size() eq 0}">
			<tr><th colspan="10">등록된 후기가 없습니다.</th></tr>
		</c:if>
		
		<c:forEach items="${clReviewList}" var="review">
			<div class="comment">
				${review.review_id}
				${review.user_id} / ${review.date}
				<input type ="button" onclick='location.href="reviewDel.do?review_id=${review.review_id}&cl_id=${dto.cl_id}"' value="삭제"/>
				<p>${review.content}</p>
			</div>
		</c:forEach>
		
		<!-- 댓글 작성 -->
	    <form method="post" action="reviewWrite.do">
	    	<input type="hidden" name="cl_id" value="${dto.cl_id}">
	    	<input type="hidden" name="user_id" value="${sessionScope.loginId}">
	    	<input type="text" name="cl_part_id" value="">
	    	
				<table>	
						<tr>
							<th colspan="2">${sessionScope.loginId}</th>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="review_content"></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="button" onclick="reviewWrite()">등록</button>
							</th>
						</tr>
	    		</table>
	    </form>
		<!--  댓글 끝 -->
			

</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

function reviewWrite() {
	$.ajax({
		type:'get',
		url:'reviewWrite.ajax',
		data:{
			id : '${sessionScope.loginId}',
			cl_id : $('input[name="cl_id"]').val(),
			content : $('textarea[name="review_content"]').val(),	
			cl_part_id : $('input[name="cl_part_id"]').val()	
		},
		dataType:'text',
		success:function(data){
			console.log(data);
			alert(data);
			location.href='classDetail.do?cl_id='+$('input[name="cl_id"]').val();
		},
		error:function(e){
			console.log(e);
		}
	});	
} 


</script>
</html>