<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
		<% String userId = (String) session.getAttribute("loginId"); %>
		<table>
			<c:forEach items="dto">
			<tr>
				<th>제목</th>
				<td>${dto.board_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= userId %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.board_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.board_content}</td>
			</tr>
			<c:if test="${dto.photo_name ne null}">
			<tr>
				<th>대표사진</th>
				<td><img width="500" src="/photo/${dto.photo_name}"/></td>
			</tr>
			</c:if>
			<tr>
				<th>링크</th>
				<td><a href="https://www.naver.com" target="_blank">링크 3</a></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./magazine.do'" value="리스트"/>
			<c:if test="${adminChk ne null}">
					<input type="button" onclick="location.href='./magazineUpdate.go?board_id=${dto.board_id}'" value="수정"/>
					<input type="button" onclick="location.href='./magazineDelete.do?board_id=${dto.board_id}'" value="삭제"/>
			</c:if>
				</th>
			</tr>
			</c:forEach>
		</table>
		
		<br/><br/>
		
		<!-- 문의글 댓글 리스트 가져오기-->
		<c:if test="${commentlist.size() eq 0}">
			<tr><th colspan="10">등록된 답변이 없습니다.</th></tr>
		</c:if>
		
		<c:forEach items="${magacommentlist}" var="comment">
			<div class="comment">
				${comment.comment_id}
				${comment.user_id} / ${comment.comment_date}
				<c:if test="${comment.user_id eq sessionScope.loginId}">
					<input type ="button" onclick='location.href="commentdel.do?comment_id=${comment.comment_id}&board_id=${dto.board_id}"' value="삭제"/>
				<input type ="button" onclick='location.href="commentupdate.go?comment_id=${comment.comment_id}&board_id=${dto.board_id}&comment_content=${comment.comment_content}"' value="수정"/>
				</c:if>
				
				<p>${comment.comment_content}</p>
			</div>
		</c:forEach>
		
		<!-- 댓글 작성 -->
	    <form method="post" action="commentWrite.do">
	    	<input type="hidden" name="board_id" value="${dto.board_id}">
	    	<input type="text" name="comment_id" value="${eventcommentlist2.comment_id}">
				<table>	
					<c:if test="${loginId ne null}">
						<tr>
							<th>댓글 작성</th>
							<td><textarea name="comment_content"></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="submit">등록</button>
							</th>
						</tr>
					</c:if>
					<c:if test="${loginId eq null}">
						<tr>
							<th>댓글 작성</th>
						</tr>
					</c:if>
	    		</table>
	    </form>
		<!--  댓글 끝 -->
		
</body>
<c:if test="${not empty message}">
<script>

alert("${message}");

</script>
</c:if>

</html>