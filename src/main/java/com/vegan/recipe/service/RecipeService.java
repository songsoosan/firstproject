package com.vegan.recipe.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUpload;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.utils.JsonUtil;
import com.utils.upload.FileBean;
import com.vegan.recipe.dao.RecipeDAO;
import com.vegan.recipe.dto.RecipeDTO;


@Service
public class RecipeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RecipeDAO recipeDAO;
	
	public Map<String, Object> write(MultipartHttpServletRequest request) {	
		Map<String, Object> result = new HashMap<>();
        Gson gson = new Gson();
        FileUpload fileUpload = new FileUpload();
        
        JSONObject jsonObject = JsonUtil.requestToJsonObj(request);
        RecipeDTO receipeDTO = gson.fromJson(jsonObject.toString(), RecipeDTO.class);
        
        receipeDTO.setCat_id("recipe");
        receipeDTO.setRec_blind_chk(1);
        receipeDTO.setUser_id("aaaa");
        receipeDTO.setStep_id(1);
        receipeDTO.setRec_title("1234125");

        
        MultipartFile multipartFile = request.getFile("mainThumbnailImage");
        if(!multipartFile.isEmpty()) {
        	//레시피 글등록
        	int row = recipeDAO.write(receipeDTO);
    		int idx = 0;
        	//메인사진등록
        	fileSave(receipeDTO.getCat_id(), idx, multipartFile);	
        	
        }
                
        
        List<MultipartFile> multipartFiles = request.getFiles("thumbnailImages");
        List<FileBean> fileBean = new ArrayList<>();
        
        if ( !multipartFiles.isEmpty() ) {
        	for(int i = 0; i<multipartFiles.size(); i++) {
        		//contents 쓰는걸 여기서 작성
        		//index값을 받아서 
        		
        		int idx = receipeDTO.getRec_id();
        		logger.info("방금 insert 한 idx : "+idx);
        		//contents 글 등록
                fileSave(receipeDTO.getCat_id(), idx, multipartFiles.get(i));
        	}
        }
		
        result.put("resultCode", "200");
        
		return result;
	}
	private void fileSave(String cat_id, int idx, MultipartFile multipartFile) {
		// 1. 파일을 C:/img/upload/ 에 저장
		//1-1. 원본 이름 추출
		String ori_photo_name = multipartFile.getOriginalFilename();
		//1-2. 확장자 추출
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		//1-3. 새이름 생성 + 확장자
		String photo_name = System.currentTimeMillis()+ext;
		logger.info(ori_photo_name+" => "+photo_name);		
		try {
			byte[] bytes = multipartFile.getBytes();//1-4. 바이트 추출
			//1-5. 추출한 바이트 저장
			Path path = Paths.get("C:/img/upload/"+photo_name);
			Files.write(path, bytes);
			logger.info(photo_name+" save OK");
			// 2. 저장 정보를 DB 에 저장
			//2-1. 가져온 idx, oriFileName, newFileName insert
			recipeDAO.fileWrite(cat_id, ori_photo_name, photo_name, idx);
						
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
