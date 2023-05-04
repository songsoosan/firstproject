<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
    <h3>비건 설문조사</h3>
    <form action="update.do" method="post">
        <table>
            <thead>
                <tr>
                    <th>질문 번호</th>
                    <th>질문 내용</th>
                    <th>선택지</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="question">
                    <tr>
                        <td><input type="text" name="question_number" value="${question.question_number}"></td>
                        <td><input type="text" name="question_detail" value="${question.question_detail}"></td>
                    </tr>
                </c:forEach>
                <tr>
                    <th colspan="3">
                        <input type="submit" value="제출">
                    </th>
                </tr>
            </tbody>
        </table>
    </form>
</body>
<script></script>
</html>
