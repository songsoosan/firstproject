<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
    <%@ include file="./header.jsp" %>
    <div class="container mt-4">
        <form action="userUpdate.do" method="post">
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <td><input type="text" name="id" value="${detail.user_id}" readonly /></td>
                </tr>

                <tr>
                    <th>NAME</th>
                    <td><input type="text" name="name" value="${detail.user_name}" /></td>
                </tr>
                <tr>
                    <th>E-MAIL</th>
                    <td><input type="text" name="email" value="${detail.user_email}" /></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><input type="text" name="phone" value="${detail.user_phone}" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="비밀번호 변경" onclick="location.href='passwardChk.go'" class="btn btn-primary" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="수정" class="btn btn-success" />
                        <input type="button" value="탈퇴" onclick="location.href='delUser.do?idx=${detail.user_id}'" class="btn btn-danger" />
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	var msg="${msg}";
	if (msg!="") {
		alert(msg);
		
	}

</script>
</html>