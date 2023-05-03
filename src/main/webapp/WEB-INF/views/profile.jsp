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
</style>
</head>
<body>
	<!-- <table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME<th>
				<th>EMAIL</th>
				<th>phone</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${user.user_id }</td>
					<td>${user.user_name }</td>
					<td>${user.user_email }</td>
					<td>${user.user_phone }</td>
					<td>상세보기</td>
				</tr>
		</tbody>
	</table>
	 -->
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