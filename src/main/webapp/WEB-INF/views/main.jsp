<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
	

</style>

</head>
<body>
	
	<div>
		<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
		<input type ="text" placeholder="검색"/>
		<a href="profile.do">
			<img src="resources/img/user.png" alt="유저" width="70px" height="70px"/>
		</a> 
		<a href="write.go">
			<img src="resources/img/write.png" alt="글쓰기" width="70px" height="70px"/>
		</a>
		<a href="recieveletter.go">
			<img src="resources/img/letter.png" alt="쪽지" width="70px" height="70px"/>
		</a>
	</div>

	<div class ="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="classes.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
		</ul>
	</div>
	
	<div class ="divImages">
		<ul class="ul">
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
		</ul>
	</div>
	
	<div>
		<ul class="ul">
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
			<li class="img"><a href="#"><img src="resources/img/logo.png" width="100" height="100"></a></li>
		</ul>
	</div>


    </body>

<script>
</script>
</html>