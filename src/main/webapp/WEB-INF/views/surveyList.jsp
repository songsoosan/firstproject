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
    <c:if test="${admincheck}">
    	<button onclick="location.href='surveyWrite.go'">등록</button>
    	<button onclick="location.href='surveyUpdate.go'">수정</button>
	</c:if>
	<button onclick="location.href='main.go'">메인</button>
    <form action="result.go" method="post">
        <table>
            <thead>
                <tr>
                    <th>질문 번호</th>
                    <th>질문 내용</th>
                    <th>선택지</th>
                </tr>
            </thead>
            <tbody>
				<tr></tr>
                <c:forEach items="${list}" var="question">
                    <tr>
                        <td>${question.question_number}</td>
                        <td>${question.question_detail}</td>
                        <td class="radio">
                            <div><input type="radio" name="${question.question_number}" value="1"/>매우 그렇지 않다.</div>
                            <div><input type="radio" name="${question.question_number}" value="2"/>그렇지 않다.</div>
                            <div><input type="radio" name="${question.question_number}" value="3" checked="checked"/>보통이다.</div>
                            <div><input type="radio" name="${question.question_number}" value="4"/>그렇다.</div>
                            <div><input type="radio" name="${question.question_number}" value="5"/>매우 그렇다.</div>
                        </td>
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
