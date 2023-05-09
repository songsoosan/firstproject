<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
   #id{
      width: 69%;
   }
   textarea{
      width : 100%;
      height:150px;
      resize:none;
   }
   table,th,td{
  	 border : 1px solid black;
   	border-collapse : collapse;
   	padding : 5px 10px;
	}



}
table,th,td{
	border : 1px solid black;
	border-collapse : collapse;
	padding : 5px 10px;

}
textarea{
		width : 100%;
		height:150px;
		resize:none;
	}
#login{
	margin-bottom:20px;
}
	div {
	   margin:0 auto; 
	   text-align:center;
	}

	table {
		width: 60%;
		border: 1px solid black;
		margin: 0 auto;
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
	
	
</style>

</head>
<body>
	
	<div>
		<a href="main.go">
			<img src="resources/img/logo.png" alt="푸른식탁" width="70px" height="70px"/>
		</a>
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
	<button class="logout-button" onclick="location.href='/logout.do'">로그아웃</button>

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
   <h3>쪽지 작성하기</h3>
      
         <table>
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" id="subject"/>
               </td>
            </tr>
            <tr>
               <th>받는 사람</th>
               <td><input type="text" id="receiver" value=""/>
               <button id="toAdmin">관리자에게 보내기</button>
               </td> 
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <div class="form-floating">
  					<textarea class="form-control" placeholder="Leave a comment here" id="content" style="height: 100px"></textarea>				 
				</div>
               </td>
            </tr>
            <tr>
               <th colspan="2">
               	<div class="col text-center">
                  <button type="button" class="btn btn-success" onclick="letterSend()">확인</button>
                  <button type="button" class="btn btn-success" onclick="location.href='recieveletter.go'">돌아가기</button>
               </div>
               </th>
            </tr>
         </table>
      
</body>
<script>

$('#toAdmin').on('click',function(){
   $('#receiver').val("admin");
});



function letterSend(){

      var $subject = $('#subject');
      var $receiver = $('#receiver');
      var $content = $('#content');
   
      if($subject.val()==''){
         alert('제목을 입력해 주세요!');
         $subject.focus();
      }else if($receiver.val()==''){
         alert('받는 사람을 입력해 주세요!');
         $receiver.focus();
      }else if($content.val() == ''){
         alert('내용을 입력해 주세요!');
         $content.focus();
      }else{
         
         var param = {};
         param.subject = $subject.val();
         param.receiver = $receiver.val();
         param.content = $content.val();
         console.log(param);
         
         $.ajax({
            type:'post',
            url:'letterSend.ajax',
            data:param,
            dataType:'json',
            success:function(data){
               console.log(data);
               if(data.success == 1){
                  alert('쪽지전송이 완료 되었습니다.');
                  location.href = 'recieveletter.go';
               }else{
                  alert('쪽지전송에 실패 했습니다.\r\n 다시 시도해 주세요!');
               } 
            },
            error:function(e){
               console.log(e);
               alert('쪽지전송에 실패 했습니다.\r\n 다시 시도해 주세요!');
            }
         });
      }
}




   







</script>
</html>