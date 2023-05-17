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
<%@ include file="./header.jsp" %>


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

				<c:if test="${review.user_id eq sessionScope.loginId}">
					<input type ="button" onclick='location.href="reviewDel.do?review_id=${review.review_id}&cl_id=${dto.cl_id}"' value="삭제"/>
				</c:if>
				
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