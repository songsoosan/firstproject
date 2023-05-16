<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="resources/css/commons.css">
    <style>
        .btn-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .btn-list .btn {
            display: block;
            width: 200px;
            height: 200px;
            margin: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            text-align: center;
            line-height: 200px;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: #333;
        }
        .btn-list .btn:hover {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <div class="btn-list">
        <a href="./admin.userList" class="btn">유저 리스트</a>
        <a href="./admin.reportList" class="btn">신고 리스트</a>
        <a href="./admin.blindList" class="btn">블라인드 리스트</a>
        <a href="./admin.category" class="btn">카테고리</a>
        <a href="./admin.adminLetterList" class="btn">관리자 쪽지</a>
    </div>
</body>
</html>
