function RecipeWrite() {
	this.groupCount = 1;
	this.thumbnailImages = [];
	this.deleteImages = [];
	this.mainThumbnailImage = "";

    this.init = function(){
    	recipeWrite.event();	
    }
    
    
    this.event = function(){
    	//추가 버튼 클릭 이벤트
		$(".main")
			.on("click", "#addButton", function(){
				var html = '<div class="group">'
								+'내용<input type = "textarea" class="rec_content">'
								+'<input type = "file" name="thumbnailFile">'
								+'<button id="addImgButton">사진추가</button>'
								+'</div>';
								
								recipeWrite.groupCount++;
				$("#recipeContents").append(html);
				
				
			})
			
			.on("click", "#saveButton", function(){			
				var array1 = new Array();
				var array2 = new Array();
				var array3 = new Array();
				
				var data1 = new Object();
				data1.tag_id = 1;
				
				array1.push(data1);
								
				var data2 = new Object();
				data2.rec_content = "wo";
				data2.photo_name = "ho";
				
				array2.push(data2);
				
				var data3 = new Object();
				data3.food_name = "fo";
				data3.food_quantity = "go";
				
				array3.push(data3);
			
				var params = {
                      rec_title : $("#rec_title").val()
                    , tags : array1
                    , contents : array2
                    , foods : array3
            	}
				
				recipeWrite.save(params);
			})
			
			.on("change", "input[name=thumbnailFile]", function () {
                var fileReader = new FileReader();
                var file = $(this)[0].files[0];
                console.log(file);
                if (file === undefined) {
                    return false;
                }
                fileReader.readAsDataURL($(this)[0].files[0]);
                fileReader.onload = function (e) {
                    var thumbnail = '<li class="img-thumbnail" style="width: 15%; position: relative;"><img style="width: 100%;" src="' + e.target.result + '"><div class="btnDeleteThumbnail"></div></li>';
                    recipeWrite.thumbnailImages.push(file);
                    $(".thumbnailWrap").append(thumbnail);
                };
            });
    }
    
    this.save = function(params) {
    		var form = $("#addForm")[0];
	        var formData = new FormData(form);
	        formData.append("mainThumbnailImage", recipeWrite.mainThumbnailImage);
	        recipeWrite.thumbnailImages.forEach(value => {
	            formData.append("thumbnailImages", value);
	        });
	        formData.append("deleteImages", recipeWrite.deleteImages);
    		formData.append("optionList", JSON.stringify(params));
    		
			// ajax 통신
            $.ajax({
            	url: "/recipe/write.do",
            	type: "POST",
            	enctype: 'multipart/form-data', 
            	dataType: "json", 
            	data: formData,
            	processData: false,
            	contentType: false,
            	success: function (data) {
	                if (data.resultCode == "200") {
                    	alert("등록이 완료되었습니다.");
                	}
            	}, error: function (request, status, error) {
	                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            	}
        	})
    }
}

RecipeWrite.prototype = {}
RecipeWrite.prototype.constructor = RecipeWrite;
var recipeWrite = new RecipeWrite();