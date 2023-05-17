<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
<style></style>
</head>
<body>
<%@ include file="./header.jsp" %>
<table class="table table-striped">
    <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>클래스 참여 번호</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${appList eq null}">
            <tr>
                <th colspan="5">등록된 글이 없습니다.</th>
            </tr>
        </c:if>
        <c:forEach items="${appList}" var="join">
            <tr>
                <td>${join.user_id}</td>
                <td>${join.user_name}</td>
                <td>${join.user_phone}</td>
                <td>${join.cl_part_id}</td>
                <td></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script>

</script>
</html>