<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
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
});

$(document).on('click','#addButton',function(){
	var html = '<div class="group">'
					+'내용 '+x+' <input type = "text" name="rec_content'+x+'">'
					+'<input type = "file" name="thumbnailFile" id="thumbnailFile'+x+'" accept="image/*" onchange="setThumbnail3(event);">'
					+'</div>'
					+'<div id="thumbnailFile'+x+'"></div>';
					document.getElementById("rec_content_id").value = x;
					x++;
					
	$('#recipeContents').append(html);
});


$(document).on('click','#addFoods',function(){
	var html = '<div class="group">'
					+'재료 '+y+' <input type = "text" name="food_name'+y+'">'
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
<form action="recipe.write.do" method="POST" enctype="multipart/form-data">
	<div class="main">
	<h3>레시피 등록</h3>
		<input type="hidden"  name="rec_content_id" id="rec_content_id">
		<input type="hidden"  name="food_id" id="food_id">
			<div>
				레시피 제목 <input type = "text" name = "rec_title" id="rec_title">
			</div>
			<div>
				동영상 링크 <input type = "text" name = "rec_video" id="rec_video">
			</div>
			<div>
				대표사진 등록 <input type = "file" name = "rec_photo" id="rec_photo" accept="image/*" onchange="setThumbnail(event);">
			</div>
			<div id="image_container_main"></div>
			<div class="contents" id="recipeFoods">
				<div class="group">
						재료 1 <input type = "text" name="food_name1"> <input type = "text" name="food_quantity1">
				</div>
			</div>
			<button type = "button" id="addFoods">추가</button>
			<div class="contents" id="recipeContents">
				<div class="group">
					내용 1 <input type = "text" name="rec_content1">
						<input type="file" name="thumbnailFile" accept="image/*" onchange="setThumbnail2(event);"/>
						<div id="image_container"></div>
				</div>
			</div>
			<div class="contents">
				<button type = "button" id="addButton">추가</button>
				<div class="tags">
					<input type="checkbox" value="1"/>
					<input type="checkbox" value="2"/>
					<input type="checkbox" value="3"/>
					<input type="checkbox" value="4"/>
					<input type="checkbox" value="5"/>
				</div>
				<input type="submit" id="submit"/>
			</div>
</div>
</form>
</body>
</html>