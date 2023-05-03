<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
</style>
</head>
<body>
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
                  <textarea id="content"></textarea>
               </td>
            </tr>
            <tr>
               <th colspan="2">
                  <button onclick="letterSend()">확인</button>
                  <button onclick="location.href='letter'">돌아가기</button>
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
                  location.href = '/';
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