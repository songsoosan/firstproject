<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

{
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
	.status.active {
    color: blue;
	}
	
	.status.inactive {
	    color: gray;
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
		<% String userId = (String) session.getAttribute("loginId"); %>
		<table>
			<c:forEach items="dto">
			<tr>
				<th>제목</th>
				<td>${dto.board_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.user_id}</td>
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
	    	<input type="hidden" name="comment_id" value="${eventcommentlist2.comment_id}">
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
							<td>회원만 입력 가능합니다.</td>
						</tr>
					</c:if>
	    		</table>
	    </form>
		<!--  댓글 끝 -->
		
</body>
<script>


</script>
</html>