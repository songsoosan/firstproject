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

$(document).on('click','#addButton',function(){
	var html = '<div class="group">'
					+'내용<input type = "text" class="rec_content'+x+'">'
					+'<input type = "file" id="thumbnailFile'+x+'" accept="image/*" onchange="setThumbnail3(event);">'
					+'</div>'
					+'<div id="thumbnailFile'+x+'"></div>';
					x++;
	$('#recipeContents').append(html);
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
	document.getElementById("myInput").value = x;
});
	
</script>

<body>
	<div class="main">
	<h3>레시피 등록</h3>

		<form action="./recipe.write.do" method="get" enctype="multipart/form-data">
		<input type="hidden" id="myInput">
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
			
			
			
			<div class="contents" id="recipeContents">
				<div class="group">
					내용<input type = "text" class="rec_content">
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
			</form>
</div>
</body>
</html>