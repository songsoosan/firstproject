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
${msg}
	<form action="class.write.do" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="cl_subject"/></td>
			</tr>
			<tr>
				<th>모집기간</th>
				<td>모집 시작일<input type="date" name="cl_period"/>모집 마감일<input type="date" name="cl_deadlinePeriod"/></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="cl_deadline"/></td>
			</tr>
			<tr>
				<th>강사이름</th>
				<td><input type="text" name="cl_teacher"/></td>
			</tr>
			<tr>
				<th>강좌날짜</th>
				<td><input type="date" name="cl_date"/></td>
			</tr>
			<tr>
				<th>재료여부</th>
				<td>
					<input type="radio" name="cl_ing_chk" value="1" checked> 있음
					<input type="radio" name="cl_ing_chk" value="0"> 없음
			</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>
						<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" placeholder="주소"><br>
						<input type="text" id="detailAddress" placeholder="상세주소"><br>
						<input type="text" id="extraAddress" placeholder="참고항목">
					</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cl_content"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./class.go'" value="리스트"/>
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