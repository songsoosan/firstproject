<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style></style>
</head>
<body>
${msg}
	<div class="container">
        <h1>클래스 등록</h1>
        <form action="classWrite.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="user_id">아이디</label>
                <input type="text" class="form-control" id="user_id" name="user_id" value="${sessionScope.loginId }">
            </div>
            <div class="form-group">
                <label for="cl_subject">제목</label>
                <input type="text" class="form-control" id="cl_subject" name="cl_subject">
            </div>
            <div class="form-group">
                <label for="photo">사진</label>
                <input type="file" class="form-control-file" id="photo" name="photo">
            </div>
            <div class="form-group">
                <label>모집기간</label>
                <div class="row">
                    <div class="col">
                        <input type="date" class="form-control" name="cl_period" placeholder="모집 시작일">
                    </div>
                    <div class="col">
                        <input type="date" class="form-control" name="cl_deadlinePeriod" placeholder="모집 마감일">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="cl_deadline">모집인원</label>
                <input type="text" class="form-control" id="cl_deadline" name="cl_deadline">
            </div>
            <div class="form-group">
                <label for="cl_teacher">강사이름</label>
                <input type="text" class="form-control" id="cl_teacher" name="cl_teacher">
            </div>
            <div class="form-group">
                <label for="cl_date">강좌날짜</label>
                <input type="date" class="form-control" id="cl_date" name="cl_date">
            </div>
            <div class="form-group">
                <label>재료여부</label>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="cl_ing_chk" value="1" checked>
                    <label class="form-check-label">있음</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="cl_ing_chk" value="0">
                    <label class="form-check-label">없음</label>
                </div>
            </div>
            <div class="form-group">
                <label>주소</label>
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호">
					</div>
					<div class="col">
					<button type="button" class="btn btn-primary" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
					</div>
					<input type="text" class="form-control" id="address" name="address" placeholder="주소">
					<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" class="form-control" id="extraAddress" name="extraAddress" placeholder="참고항목">
					</div>
					<div class="form-group">
					<label for="cl_content">내용</label>
					<textarea class="form-control" id="cl_content" name="cl_content"></textarea>
					</div>
					<div class="form-group">
					<input type="button" class="btn btn-secondary" onclick="location.href='./classList.go'" value="리스트">
					<button type="submit" class="btn btn-primary">저장</button>
					</div>
					</form>
					</div>
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