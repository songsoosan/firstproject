<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
table,th,td{
	border : 1px solid black;
	border-collapse : collapse;
	padding : 5px 10px;

}
textarea{
		width : 100%;
		height:150px;
		resize:none;
	}
#login{
	margin-bottom:20px;
}
	div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 60%;
		border: 1px solid black;
		margin: 0 auto;
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
	
	<div>
		<a href="main.go">
			<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
		</a>
		<input type ="text" placeholder="검색"/>
		<a href="profile.do">
			<img src="resources/img/user.png" alt="유저" width="70px" height="70px"/>
		</a> 
		<a href="write.go">
			<img src="resources/img/write.png" alt="글쓰기" width="70px" height="70px"/>
		</a>
		<a href="recieveletter.go">
			<img src="resources/img/letter.png" alt="쪽지" width="70px" height="70px"/>
		</a>
	</div>
	<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>

	<div class ="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="classes.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
		</ul>
	</div>
	<table>
		<tr>
			<td rowspan="4">
				<c:if test="${dto.newFileName eq null}">
					<form action="profilePhoto.do" method="post" enctype="multipart/form-data">
						<input type="file" name="photo"/>
						<button>등록</button>
					</form>	
				</c:if>
				<c:if test="${dto.newFileName ne null }">
					<img src="/photo/${dto.newFileName}"/>
				</c:if>					
			</td>
			<td>${user.user_id }</td>
		</tr>
		<tr>
			<td>${user.user_name }</td>
		</tr>
		<tr>
			<td>${user.user_email }</td>
		</tr>
		<tr>
			<td>${user.user_phone }</td>
		</tr>
		<tr>
			<td colspan="2">비건단계</td>
		</tr>
		<form action="profileUpdate.do" method="post">
			<tr>
				<td><textarea name=introduction>${user.introduction}</textarea></td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</form>
		<tr>
			<td colspan="2"><a>내가 작성한 레시피</a></td>
		</tr>
		<tr>
			<td colspan="2"><a>즐려찾기한 레시피</a></td>
		</tr>
		<tr>
			<td colspan="2"><a>구매한 클래스</a></td>
		</tr>
		<tr>
			<th colspan = "2">
				<input type="button" value="상세보기" onclick="location.href='passwardChk.go'"/>
			</th>
		</tr>
	</table>
		

</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>