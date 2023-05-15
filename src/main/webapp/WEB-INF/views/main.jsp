<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>푸른 식탁</title>
<style>
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

<%@ include file="./header.jsp" %>
<a href="survey.do">설문조사</a>
<!-- <div class ="divImages">
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
</div> -->
</body>
<script>
   var msg = "${msg}";
   
   if(msg != ""){
      alert(msg);
   }
</script>
</html>