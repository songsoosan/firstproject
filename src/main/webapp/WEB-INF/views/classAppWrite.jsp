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
<%@ include file="./header.jsp" %>
	
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

            var addr = ''; 
            var extraAddr = ''; 


            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }


            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;

            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
</html>