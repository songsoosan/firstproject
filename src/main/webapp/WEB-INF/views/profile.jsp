<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

textarea {
	width: 100%;
	height: 150px;
	resize: none;
}

#login {
	margin-bottom: 20px;
}

div {
	margin: 0 auto;
	text-align: center;
}

table {
	width: 60%;
	border: 1px solid black;
	margin: 0 auto;
}

th, td {
	border: 1px solid black;
	padding: 10px;
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

.ul {
	list-style-type: none;
	text-align: center;
	display: inline-block;
	width: 100%;
}

.li {
	float: left;
	width: 16%;
}

.li>a {
	text-decoration-line: none;
	font-size: 25px;
}

.menu {
	margin-top: 30px;
	border-bottom: 1px solid #ccc;
}

.divImages {
	margin-top: 100px;
}

.img {
	width: 20%;
	height: 30%;
	vertical-align: middle;
	display: inline-block;
}

.logout-button {
	float: right;
}

/* .profile-table {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

.profile-table th, .profile-table td {
	border: 1px solid black;
	padding: 10px;
}

.profile-photo {
	width: 40%;
} */
</style>

</head>
<body>


	<div>
		<a href="main.go"> <img src="resources/img/logo.png" alt="푸른식탁"
			width="70px" height="70px" />
		</a> <input type="text" placeholder="검색" /> <a href="profile.do"> <img
			src="resources/img/user.png" alt="유저" width="70px" height="70px" />
		</a> <a href="write.go"> <img src="resources/img/write.png" alt="글쓰기"
			width="70px" height="70px" />
		</a> <a href="recieveletter.go"> <img src="resources/img/letter.png"
			alt="쪽지" width="70px" height="70px" />
		</a>
	</div>
	<button class="logout-button" onclick="location.href='logout.do'">로그아웃</button>
	<div class="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="classList.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
		</ul>
	</div>
	<table class="profile-table">
		<colgroup>
			<col style="width: 40%;">
			<col style="width: 20%;">
			<col style="width: 40%;">
		</colgroup>
		<tr>
			<td rowspan="4" class="profile-photo"><c:if
					test="${user.photo_name eq null}">
					<form action="profilePhoto.do" method="post"
						enctype="multipart/form-data">
						<input type="file" name="photo" />
						<button>등록</button>
					</form>
				</c:if> <c:if test="${user.photo_name ne null}">
					<img width="200" src="/photo/${user.photo_name}" alt="프로필 사진" />
					<form action="profilePhoto.do" method="post"
						enctype="multipart/form-data">
						<input type="file" name="photo" />
						<button>등록</button>
					</form>
				</c:if></td>
			<th>ID</th>
			<td>${user.user_id }</td>
		</tr>
		<tr>
			<th>NAME</th>
			<td>${user.user_name }</td>
		</tr>
		<tr>
			<th>E-MAIL</th>
			<td>${user.user_email }</td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td>${user.user_phone }</td>
		</tr>
		<c:if test="${not empty user.vegan_step}">
			<tr>
				<th colspan="3">${user.vegan_step}</th>
			</tr>
		</c:if>
		<c:if test="${empty user.vegan_step}">
			<tr>
				<td colspan="3"><a href="survey.do">비건단계 질문지로 이동</a></td>
			</tr>
		</c:if>
		<form action="profileUpdate.do" method="post">
			<tr>
				<td colspan="3" class="introduction"><textarea
						name="introduction">${user.introduction}</textarea> <input
					type="submit" value="확인"></td>
			</tr>
		</form>
		<tr>
			<td colspan="3" class="profile-section"><a class="action-link"
				href="#">내가 작성한 레시피</a></td>
		</tr>
		<tr>
			<td colspan="3" class="profile-section"><a class="action-link"
				href="#">즐겨찾기한 레시피</a></td>
		</tr>
		<tr>
			<td colspan="3" class="profile-section"><a href="myClassList.do"
				class="action-link">구매한 클래스</a></td>
		</tr>
		<tr>
			<th colspan="3" class="profile-section"><input type="button"
				value="개인정보" onclick="location.href='profileDetail.do'"></th>
		</tr>
	</table>


</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>