<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	table{
	margin: 0 auto;
	}
	
</style>
</head>
<body>
    <%@ include file="./header.jsp" %>
    <div class="container mt-4 d-flex justify-content-center">
        <form action="passwardChk.do" method="post">
            <table class="table table-bordered">
                <tr>
                    <th colspan="2">비밀번호를 입력해주세요.</th>
                </tr>
                <tr>
                    <th>PW</th>
                    <td><input type="password" name="pwChk" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Check" class="btn btn-primary" />
                        <button type="button" onclick="location='profile.do'" class="btn btn-secondary">돌아가기</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>