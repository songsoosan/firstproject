<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">   
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel= "stylesheet" href="resources/css/paging.css" type="text/css">
<style>
	 .none {
      display: none !important;
   }
   .onlyAdmin {
      display: block !important;
   }
   th.onlyAdmin, td.onlyAdmin {
      display: table-cell !important;
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
   .eventStatus {
    padding: 4px 8px;
    border-radius: 4px;
    font-weight: bold;
}

.preparing {
    background-color: khaki;
    color: white;
}

.ongoing {
    background-color: darkseagreen;
    color: white;
}

.expired {
    background-color: gray;
    color: white;
}
</style>
</style>
</head>
<body>
<%@ include file="./header.jsp" %>
<div class="contentWrap mt-5">
   <div class="contentBox">
      <div class="text-center">
		<h3>최신 이벤트</h3>
	</div>
      <hr/>
      <div>
         <div class="d-flex" style="float: left;">
            <span class="mt-1">게시물 갯수&nbsp;:&nbsp;</span>
            <select id="pagePerNum" class="form-select w-auto">
               <option value="5">5</option>
               <option value="10">10</option>
               <option value="15">15</option>
               <option value="20">20</option>
            </select>
             </div>
        	 <div style="float: right;" class="d-flex">
            	<button class="btnCtrl btn btn-outline-primary float-right"  onclick="location.href='eventWrite.go'">글쓰기</button>
            </div>         
	      </div>
	      <div style="margin-top: 70px;">
	      <table class="table table-striped table-bordered">
	         <thead>
	            <tr>
	               <th class="text-center col-md-1">번호</th>
	               <th class="text-center" style="width:25%">제목</th>
	               <th class="text-center col-md-1">모집기간</th>
	               <th class="text-center col-md-1">작성자</th>
	               <th class="text-center col-md-1">이벤트 상태</th>
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
	</div>
	</div>
	</div>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
buttonControl(loginId);
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
                next : '<span style="color: #87d1bf;">></span>', 
                last : '<span style="color: #87d1bf;">>></span>',
                first : '<span style="color: #87d1bf;"><<</span>',
               prev : '<span style="color: #87d1bf;"><</span>',
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

        // 날짜형식설정
        var startDateFormatted = event_start_date.toISOString().substring(0, 10);
        var endDateFormatted = event_end_date.toISOString().substring(0, 10);

        content += '<td>' + startDateFormatted + ' ~ ' + endDateFormatted + '</td>';
        content += '<td>' + event.user_id + '</td>';
        
		
        
        // 준비중,마감,진행중
        var currentDate = new Date();
        var eventStatusText = '';

        if (event_start_date > currentDate) {
            eventStatusText = '<span class="eventStatus preparing">준비중</span>';
        } else if (event_end_date < currentDate) {
            eventStatusText = '<span class="eventStatus expired">마감</span>';
        } else {
            eventStatusText = '<span class="eventStatus ongoing">진행중</span>';
        }
        
        content += '<td>' + eventStatusText + '</td>';
        
        content += '</tr>';
        
    });
        

    $('#list').empty();
    $('#list').append(content);
}


function buttonControl(loginId) {
	if(loginId == 'null') {
	$(".btnCtrl").addClass("none");
	}
	}
	
function buttonControl(loginId) {
    if (loginId === 'null') {
        $(".btnCtrl").addClass("none");
    } else {
        adminCheck();
    }
}



function adminCheck() {
    if (loginId === "admin") {
        $(".btnCtrl").removeClass("none");
    } else {
        $(".btnCtrl").addClass("none");
    }
}
</script>
</html>