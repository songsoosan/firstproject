<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.input-file-button{
  padding: 6px 25px;
  background-color:#FF6600;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

</style>
</head>
<script>
var x = 1;
var y = 1;

$(document).ready(function(){
	document.getElementById("rec_content_id").value = x;
	document.getElementById("food_id").value = y;
	x++;
	y++;
	
	if (x <= 2) {
        $('button#removeButton').hide();
    }
	
});

$(document).on('click','#addButton',function(){
	var html = '<div class="content'+x+'">'
					+'내용 '+x+' <input type = "text" name="rec_content'+x+'">'
					+'<input type = "file" name="thumbnailFile" id="thumbnailFile'+x+'" accept="image/*" onchange="setThumbnail3(event);">'
					+'<div id="thumbnailFile'+x+'"></div>';
					+'</div>'
					document.getElementById("rec_content_id").value = x;
					x++;
					if(x == 3){
						$('#removeButton').show();
					}
					$('#recipeContents').append(html);
});



$(document).on('click','#removeButton',function(){
	$('div.content'+(x-1)).remove();
	x--;
	if(x <= 2){
		$('#removeButton').hide();
	}
	document.getElementById("rec_content_id").value = x;
});


$(document).on('click','#addFoods',function(){
	var html = '<div class="food">'
					+' '+y+' <input type = "text" name="food_name'+y+'">'
					+'<input type = "text" name="food_quantity'+y+'">'
					+'</div>';
					document.getElementById("food_id").value = y;
					y++;
					
	$('#recipeFoods').append(html);
});


function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
    	$("div#image_container_main").empty();
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container_main").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
  
function setThumbnail2(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
    	$("div#image_container").empty();
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
      
    };

    reader.readAsDataURL(event.target.files[0]);
  }
  
function setThumbnail3(event) {
    var reader = new FileReader();
    var inputId = $(event.target).attr('id')
    reader.onload = function(event) {
    	$('div#'+inputId).empty();
      var img = document.createElement("img");
      
      console.log(inputId);
      img.setAttribute("src", event.target.result);
      document.querySelector("div#"+inputId).appendChild(img);
      
    };
    reader.readAsDataURL(event.target.files[0]);
  }
	
$(document).on('click','#submit',function(){
	
	console.log(x);
});





	
</script>

<body>
  <%@ include file="./header.jsp" %>
  <div class="contentWrap mt-5 container">
    <div class="contentBox">
      <div class="text-center">
        <h2>레시피 등록</h2>
      </div>
      <hr/>

      <form action="recipe.write.do" method="POST" enctype="multipart/form-data">
        <div class="main">
          <input type="hidden"  name="rec_content_id" id="rec_content_id">
          <input type="hidden"  name="food_id" id="food_id">
          <input type="hidden"  name="user_id" id="user_id" value="${sessionScope.loginId}">

          <br/>

          <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">레시피 제목</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="rec_title" id="rec_title">
            </div>
          </div>

          <br/><br/>
          <hr>
          <br/><br/>

          <!-- <div class="input-group mb-3 mt-3">
            <label class="col-sm-2 offset-sm-1 col-form-label">동영상 링크</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="rec_video" id="rec_video">
            </div>
          </div>

          <br/><br/>
          <hr>
          <br/><br/> -->

          <div class="row">
            <div class="input-group">
              <label for="recipe_photo" class="col-sm-2 offset-sm-1 col-form-label">사진</label>
              <input type="file" class="form-control w-auto" name="rec_photo" id="rec_photo" accept="image/*" onchange="setThumbnail(event);">
              <div id="image_container_main"></div>
            </div>
         </div> 
         
         <br/><br/>
			<hr>
		<br/><br/>
         
         
        <div class="input-group mb-3 mt-3"> 
         <label for= recipe class="col-sm-2 offset-sm-1 col-form-label">재료</label>
       <div id="image_container_main"></div>
			<div class="contents" id="recipeFoods">
				<div class="food">
					1 <input type ="text" name="food_name1"><input type = "text" name="food_quantity1">
				</div>
			</div>
		</div>
			<button type = "button"  id="addFoods">추가</button>	
			<button type = "button" id="removeFoods">삭제</button>
			
			
		<br/><br/>
			<hr>
		<br/><br/>
			
		<div class="input-group mb-3 mt-3"> 
 		<label for= recipe class="col-sm-2 offset-sm-1 col-form-label">내용</label>
		<div class="contents" id="recipeContents">
			<div class="content">
				내용 1 <input type = "text" name="rec_content1">
					<input type="file" name="thumbnailFile" accept="image/*" onchange="setThumbnail2(event);"/>
					<div id="image_container"></div>
				</div>
			</div>
		</div>
		<div class="contents">
			<button type = "button" id="addButton">추가</button>
			<button type = "button" id="removeButton">삭제</button> 
		</div>
         
        <br/><br/>
        	<hr>
        <br/><br/>
    

<div class="input-group mb-3 mt-3">
    <label class="col-sm-2 offset-sm-1 col-form-label">태그를 선택해 주세요</label>
    <div class="col-sm-9">
        <fieldset>
            <legend>식단 유형</legend>
            <div>
                <input type="checkbox" name="tag" value="0" id="flexitarian">
                <label for="flexitarian">플렉시테리언</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="1" id="pollo-pesco-vegetarian">
                <label for="pollo-pesco-vegetarian">폴로 페스코 베지테리언</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="2" id="pesco-vegetarian">
                <label for="pesco-vegetarian">페스코 베지테리언</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="3" id="lacto-ovo-vegetarian">
                <label for="lacto-ovo-vegetarian">락토 오보 베지테리언</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="4" id="vegan">
                <label for="vegan">비건</label>
            </div>
        </fieldset>
    </div>
</div>
<div class="input-group mb-3 mt-3">
    <div class="col-sm-2 offset-sm-1"></div>
    <div class="col-sm-9">
        <fieldset>
            <legend>난이도</legend>
            <div>
                <input type="checkbox" name="tag" value="5" id="anyone">
                <label for="anyone">아무나</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="6" id="beginner">
                <label for="beginner">초급</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="7" id="intermediate">
                <label for="intermediate">중급</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="8" id="advanced">
                <label for="advanced">상급</label>
            </div>
            <div>
                <input type="checkbox" name="tag" value="9" id="expert">
                <label for="expert">전문가</label>
            </div>
        </fieldset>
    </div>
</div>


        <br/>
        <hr>
        <br/>

        <input type="submit" class="btn btn-primary" id="submit">
      </form>
    </div>
  </div>

</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>