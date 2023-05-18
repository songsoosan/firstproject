<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
table.profile-table {
	border-collapse: collapse;
	max-width: 800px;
	width: 100%;
	margin: 20px auto 0;
}

table.profile-table colgroup col {
	width: 40%;
}

table.profile-table th, table.profile-table td {
	border: 1px solid #000;
	padding: 8px;
}

table.profile-table th {
	background-color: #f2f2f2;
}

table.profile-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

table.profile-table tr:hover {
	background-color: #ddd;
}

table.profile-table .profile-photo {
	vertical-align: top;
}
</style>

</head>
<body>

	<%@ include file="./header.jsp"%>
	<div class="container">
		<table class="table table-bordered profile-table">

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
							<button class="btn btn-primary">등록</button>
						</form>
					</c:if></td>
				<th>ID</th>
				<td>${user.user_id}</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${user.user_name}</td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td>${user.user_email}</td>
			</tr>
			<tr>
				<th>PHONE</th>
				<td>${user.user_phone}</td>
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
						type="submit" class="btn btn-primary" value="확인"></td>
				</tr>
			</form>
			<tr>
				<td colspan="3" class="profile-section"><a class="action-link"
					href="myRecipeList.do">내가 작성한 레시피</a></td>
			</tr>
<!-- 			<tr>
				<td colspan="3" class="profile-section"><a class="action-link"
					href="#">즐겨찾기한 레시피</a></td>
			</tr> -->
			<tr>
				<td colspan="3" class="profile-section"><a
					href="myClassList.do" class="action-link">구매한 클래스</a></td>
			</tr>
			<tr>
				<th colspan="3" class="profile-section"><input type="button"
					class="btn btn-primary" value="개인정보"
					onclick="location.href='profileDetail.do'"></th>
			</tr>
		</table>
	</div>

</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>