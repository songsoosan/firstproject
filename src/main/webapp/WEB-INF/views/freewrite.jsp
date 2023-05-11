<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
   table{
      width: 100%
   }
   table, th, td{
      border: 2px solid green;
      border-collapse: collapse;
      padding: 5px 10pxl
   }
   button{
      margin: 5px;
   }
   input[type="text"]{
      width: 100%
   }
   textarea{
      heigt: 50%;
      resize: none;
      width: 100%
      
   }
</style>
</head>
<body>
   <form action="freewirte.do" method="post" enctype="multipart/form-data">
      <table>
         <tr>
            <th>제목</th>
            <td><input type="text" name="board_title"/></td>
         </tr>
         <tr>
            <th>작성자</th>
            <td><input type="text" name="user_id" readonly/></td>
         </tr>
         <tr>
            <th>내용</th>
            <td><textarea name="board_content"></textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td><input type="file" name="board_photo"/></td>
         </tr>
         <tr>
            <th colspan="2">
               <input type = "button" onclick="location.href='./freeList.do'" value="리스트"/>
               <button>저장</button>
            </th>
         </tr>
      </table>
   
   </form>
</body>
<script>
var loginId = '<%=(String)session.getAttribute("loginId")%>';
$("input[name=user_id]").val(loginId);
</script>
</html>