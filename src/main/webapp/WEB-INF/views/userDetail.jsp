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
	<form action="userUpdate.do" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="${detail.user_id}" readonly/></td>
			</tr>
<%-- 			<tr>
				<th>PW</th>
				<td><input type="text" name="pw"  value="${detail.user_pw}"/></td>
			</tr> --%>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" value="${detail.user_name}"/></td>
			</tr>
			<!-- <tr>
				<th>GENDER</th>
				<td>
					<input type="radio" name="gender" value="남" 
					<c:if test="${member.gender eq '남'}">checked</c:if>
					/>남자 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여"
					<c:if test="${member.gender eq '여'}">checked</c:if>
					/>여자
				</td> 
			</tr>-->
			<tr>
				<th>E-MAIL</th>
				<td><input type="text" name="email" value="${detail.user_email}"/></td>
			</tr>
			<tr>
				<th>phone</th>
				<td><input type="text" name="phone" value="${detail.user_phone}"/></td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="비밀번호변경" onclick="location.href='passwardChk.go'"/></th>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정"/>
					<input type="button" value="탈퇴" onclick="location.href='delUser.do?idx=${detail.user_id}'"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
	var msg="${msg}";
	if (msg!="") {
		alert(msg);
		
	}

</script>
</html>