<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .none {
      display: none !important;
   }
   .textDeco {
      text-decoration: line-through;
   }
   #list a {
      text-decoration-line: none;
   }
   .pagination {
      justify-content: center;
   }
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
	<div class="contentBox">
      <div class="text-center">
		<h2>레시피 리스트</h2>
		</div>
		
		<hr/>
		
		<div style="float: right;" class="d-flex">
            <button class="btnCtrl btn btn-outline-primary float-right" onclick="location.href='./recipe.write.go'" value="레시피 작성">레시피 작성</button>
         </div>
		<div style="margin-top: 70px;">
      <table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th class="text-center col-md-1">글아이디</th>
				<th class="text-center col-md-1">대표사진</th>
				<th class="text-center" style="width:25%">제목</th>
				<th class="text-center col-md-1">작성자</th>
				<th class="text-center col-md-1">조회수</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="11">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="recipe" varStatus="loop">
			<c:set var="b" value="photo_name${loop.index}" />
				<tr>
					<td class="text-center">${recipe.rec_id}</td>
					<td class="text-center"><img width="300" src="/resources/photo/${photo[b]}"/></td>
					<td class="text-center">${recipe.rec_title}</td>
					<td class="text-center">${recipe.user_id}</td>
					<td class="text-center">${recipe.rec_view}</td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	
</body>
</html>