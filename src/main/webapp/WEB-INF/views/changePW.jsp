<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .button-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

<%@ include file="./header.jsp" %>
	<form action="changePW.do" method = "post">
  <div class="container">
    <h2 class="text-center mt-5">새로운 비밀번호를 입력해주세요.</h2>
    <form>
      <div class="form-group">
        <label for="userPW">새 비밀번호</label>
        <input type="password" class="form-control" id="userPW" name="newPW">
      </div>
      <div class="form-group">
        <label for="confirm">비밀번호 확인</label>
        <input type="password" class="form-control" id="confirm" name="confirm">
        <span id="pwmsg"></span>
      </div>
      <button type="submit" class="btn btn-primary">입력</button>
    </form>
  </div>
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
