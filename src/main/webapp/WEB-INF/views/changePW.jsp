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
                    <th>phone</th>
                    <td><input type="text" name="phone" value="${detail.user_phone}" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="button-container">
                            <input type="button" value="비밀번호변경" onclick="location.href='passwardChk.go'" class="btn btn-primary mr-2" />
                            <input type="submit" value="수정" class="btn btn-primary mr-2" />
                            <input type="button" value="탈퇴" onclick="location.href='delUser.do?idx=${detail.user_id}'" class="btn btn-danger" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <!-- Add Bootstrap JS scripts here -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
