<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<style>
			b{
				color:red;
			}

			table{
				width:100%;
			}
			
			table, td, th{
				border : 1px solid;
				border-collapse : collapse;
				padding: 5px;
			}
			
			#paging{
				text-align: center;
			}
		</style>
</head>
<body>
	<h3>최신 이벤트</h3>
	게시물 갯수 : 
	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select>
	<c:if test="${adminChk ne null}">
	<button onclick="location.href='eventWrite.go'">글쓰기</button>
	</c:if>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>모집기간</th>
				<th>작성자</th>
				<th>이벤트 상태</th>
			</tr>
		</thead>
		<tbody id="list">			
		<!-- 리스트가 출력될 영역 -->
		</tbody>
		<tr>
			<td colspan="6" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	-->
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>		
	</table>
</body>
<script>

var showPage = 1;
listCall(showPage);

$('#pagePerNum').change(function(){
    listCall(showPage);
    // 페이지처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
    // 그래서 pagePerNum 이 변경되면 부수고 다시 만들어야 한다.
    $('#pagination').twbsPagination('destroy');
});

function listCall(page){
    $.ajax({
        type: 'post',
        url: 'event.ajax',
        data: {
            'page': page,
            'cnt': $('#pagePerNum').val()
        },
        dataType: 'json',
        success: function(data){
            console.log(data);
            listPrint(data.list);

            // paging plugin
            $('#pagination').twbsPagination({
                startPage: data.page, // 시작페이지
                totalPages: data.pages, // 총 페이지 수
                visiblePages: 5, // 보여줄 페이지 [1][2][3][4][5]
                onPageClick: function(event, page){ // 페이지 클릭시 동작되는 함수(콜백)
                    console.log(page, showPage);
                    if(page !== showPage){
                        showPage = page;    
                        listCall(page);                          
                    }               
                }
            }); 
        },
        error: function(e){
            console.log(e);
        }
    });
}

function listPrint(list) {
    var content = '';

    list.forEach(function(event) {
        content += '<tr>';
        content += '<td>' + event.event_id + '</td>';
        content += '<td><a href="eventDetail.do?event_id=' + event.event_id + '">' + event.event_title + '</a></td>';

        var event_start_date = new Date(event.event_start_date);
        var event_end_date = new Date(event.event_end_date);

        // 날짜 형식 설정
        var startDateFormatted = event_start_date.toISOString().substring(0, 10);
        var endDateFormatted = event_end_date.toISOString().substring(0, 10);

        content += '<td>' + startDateFormatted + ' ~ ' + endDateFormatted + '</td>';
        content += '<td>' + event.user_id + '</td>';
        

        var status = event.event_status;
        if (new Date() > event_end_date) {
            status = false;
        }
		
        
        content += '<td>' + status + '</td>';
        content += '</tr>';
        
    });
        

    $('#list').empty();
    $('#list').append(content);
}

</script>
</html>