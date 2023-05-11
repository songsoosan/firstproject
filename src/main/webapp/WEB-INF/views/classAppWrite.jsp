<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css" type="text/css">
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
	

	tr.colored:nth-child(odd){
  background-color: yellowgreen;
}

</style>

</head>
<body>
	<div>
		<a href="main.go">
			<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
		</a>
		<input type ="text" placeholder="검색"/>
		<a href="profile.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp; 
		<a href="recipeWrite.go">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  			<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  			<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		</a>
		&nbsp;&nbsp;&nbsp;
		<a href="recieveletter.go">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-left-dots-fill" viewBox="0 0 16 16">
  			<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			</svg>
		</a>
	</div>
		<c:if test="${sessionScope.loginId eq null}">
		<button class="logout-button" onclick="location.href='/login.go'">로그인</button>	
	</c:if>
	<c:if test="${sessionScope.loginId ne null}">
		<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>
	</c:if>	
	<div class ="menu">
		<ul class="ul">
			<li class="li"><a href="recipe.go">레시피</a></li>
			<li class="li"><a href="ranking.go">랭킹</a></li>
			<li class="li"><a href="classList.go">클래스</a></li>
			<li class="li"><a href="magazine.go">매거진</a></li>
			<li class="li"><a href="board.go">게시판</a></li>
			<li class="li"><a href="event.go">이벤트</a></li>
			<li class="li"><a href="admin.go">관리자(test)</a></li>
		</ul>
	</div>
	
<form action="classAppWrite.do" method="post">
	<table>
	<tr class="colored">
		<th colspan="2">클래스 신청서</th>
	</tr>

	<input type="hidden" name="cl_id" value="${cl_id}" readonly/>
<input type="hidden" name="user_id" value="${user.user_id}" readonly/>

	<tr>
		<th>클래스명</th>
		<td>${cl_subject}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${user.user_id}님</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="user_name" value="${user.user_name}" /></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="user_email" value="${user.user_email}" /></td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td><input type="text" name="user_phone" value="${user.user_phone}" /></td>
	</tr>
	<tr>
		<th>주소</th>
					<td>
						<input type="text" id="postcode" name="postcode" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address" placeholder="주소"><br>
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
						<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
					</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" onclick="location.href='redirect:/classList.go'" value="리스트"/>
			<button>저장</button>
		</th>
	</tr>
	</table>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
</html>