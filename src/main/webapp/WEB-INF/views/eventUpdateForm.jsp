<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style>
table{
	width: 100%;
}

table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	padding : 5px 10px;	
}

button{
	margin: 5px;
}

input[type="text"]{
	width: 100%;
}

textarea{
	width: 100%;
	height: 150px;
	resize: none;
}
</style>
</head>
<body>
	<form action="eventWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="event_id" value="${dto.event_id}"/>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="event_title" value="${dto.event_title}"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_id" value="${dto.user_id}"/></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td><input type="text" id="event_start_date" name="event_start_date" placeholder="시작일"
					value="${dto.event_start_date}"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="text" id="event_end_date" name="event_end_date" placeholder="종료일"
					value="${dto.event_end_date}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="event_content">${dto.event_content}</textarea></td>
			</tr>
			<tr>
				<th>대표사진</th>
				<td>
					<c:if test="${dto.photo_name eq null}">
						<input type="file" name="photo"/>
					</c:if>
					<c:if test="${dto.photo_name ne null }">
						<img src="/photo/${dto.photo_name}"/>
					</c:if>		
				</td>
			</tr>
			<tr>
				<th>링크</th>
				<td><a href="https://www.naver.com" target="_blank">링크 3</a></td>
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
$(document).ready(function() {
	  $("#event_start_date").datepicker({
	    dateFormat: "yy-mm-dd" // 날짜 형식 설정
	  });
	  
	  $("#event_end_date").datepicker({
	    dateFormat: "yy-mm-dd" // 날짜 형식 설정
	  });
	});

</script>
</html>