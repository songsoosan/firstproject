<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
		width: 100%;
		border: 1px solid black;
		border-collapse: collapse;

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
<%@ include file="./header.jsp"%>
  <div class="container mt-5">
    <table class="table table-bordered">
      <tr>
        <td rowspan="4" class="align-middle">
          <c:if test="${user.photo_name eq null}">
            기본사진
          </c:if>
          <c:if test="${user.photo_name ne null}">
            <img width="300" src="/photo/${user.photo_name}" alt="User Photo">
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
      <tr>
        <td colspan="2">${user.introduction}</td>
      </tr>
    </table>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>