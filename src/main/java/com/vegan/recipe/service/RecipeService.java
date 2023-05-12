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
	

	public String write(MultipartFile photo, HashMap<String, String> params) {
		
		String page = "redirect:/list.do";
		
		// 1. 게시글만 작성한 경우
		// 방금 insert 한 값의 key 를 반환 받는 방법
		// 조건 1. 파라메터를 DTO 로 보내야 한다.
		RecipeDTO dto = new RecipeDTO();
		/*dto.setSubject(params.get("subject"));
		dto.setUser_name(params.get("user_name"));
		dto.setContent(params.get("content"));	*/	
		int row = dao.write(dto);		
		
		logger.info("update row : "+row);
				
		// 조건 3. 받아온 키는 파라메터 DTO 에서 뺀다.
		/*int idx = dto.getIdx();*/
		logger.info("방금 insert 한 idx : "+idx);
		
		page = "redirect:/detail.do?idx="+idx;
		
		// 2. 파일도 업로드 한 경우
		if(!photo.getOriginalFilename().equals("")) {
			logger.info("파일 업로드 작업");
			fileSave(idx, photo);
		}
		
		return page;
	}
	
	private void fileSave(int idx, MultipartFile file) {
		// 1. 파일을 C:/img/upload/ 에 저장
		//1-1. 원본 이름 추출
		String oriFileName = file.getOriginalFilename();
		//1-2. 확장자 추출
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		//1-3. 새이름 생성 + 확장자
		String newFileName = System.currentTimeMillis()+ext;
		logger.info(oriFileName+" => "+newFileName);		
		try {
			byte[] bytes = file.getBytes();//1-4. 바이트 추출
			//1-5. 추출한 바이트 저장
			Path path = Paths.get("C:/img/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" save OK");
			// 2. 저장 정보를 DB 에 저장
			//2-1. 가져온 idx, oriFileName, newFileName insert
			dao.fileWrite(idx,oriFileName,newFileName);
						
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
