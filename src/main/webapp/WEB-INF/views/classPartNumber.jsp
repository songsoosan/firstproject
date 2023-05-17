<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	div {
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

</style>

</head>
<body>
    <%@ include file="./header.jsp" %>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card text-center">
                    <div class="card-body">
                        <h3 class="card-title">${dto.user_name}님 해당 클래스의 접수가 완료되었습니다.</h3>
                        <h2 class="card-text">회원님의 해당 클래스 참여번호는 ${dto.cl_part_id}입니다!</h2>
                        <button onclick="location.href='classDetail.do?cl_id=${dto.cl_id}'" class="btn btn-primary">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>