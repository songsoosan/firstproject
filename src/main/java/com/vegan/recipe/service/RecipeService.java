package com.vegan.recipe.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
	
	@Autowired RecipeDAO dao;
	
	public ArrayList<RecipeDTO> list() {
		
		
		return dao.list();
	}

	public String write(MultipartFile rec_photo, List<MultipartFile> thumbnailFile, HashMap<String, String> params) {
		
		String page = "redirect:/list.do";
		
		// 1. 게시글만 작성한 경우
		// 방금 insert 한 값의 key 를 반환 받는 방법
		// 조건 1. 파라메터를 DTO 로 보내야 한다.
		RecipeDTO dto = new RecipeDTO();
		RecipeDTO dtoContent = new RecipeDTO();
		RecipeDTO dtoFood = new RecipeDTO();
		
		int rec_content_id = Integer.parseInt(params.get("rec_content_id"));
		int food_id = Integer.parseInt(params.get("food_id"));
		
		dto.setRec_title(params.get("rec_title"));
		dto.setRec_video(params.get("rec_video"));
		dto.setUser_id("admin"); // 세션 아이디 넣게 수정할것
		
		logger.info(dto.getUser_id());
		
		dto.setCat_id("rec");
		dto.setStep_id(1);
		logger.info(Integer.toString(dto.getStep_id()));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		dto.setRec_creatdate(format.format(now)); 
		
		int row = dao.write(dto);
		
		logger.info("update row : "+row);
		
		for (int i = 0; i < rec_content_id; i++) {
			dtoContent.setRec_id(dto.getRec_id());
			dtoContent.setRec_content(params.get("rec_content"+(i+1)));
			dtoContent.setRec_content_id(i+1);
			
			row = dao.writeContent(dtoContent);
		}
		logger.info("update row : "+row);
		
		for (int i = 0; i < food_id; i++) {
			dtoFood.setRec_id(dto.getRec_id());
			dtoFood.setFood_name(params.get("food_name"+(i+1)));
			dtoFood.setFood_quantity(params.get("food_quantity"+(i+1)));
			dtoFood.setFood_id(i+1);
			
			row = dao.writeFood(dtoFood);
		}
		logger.info("update row : "+row);
				
		// 조건 3. 받아온 키는 파라메터 DTO 에서 뺀다.
		int rec_id = dto.getRec_id();
		logger.info("방금 insert 한 rec_id : "+rec_id);
		
		page = "redirect:/recipe.detail.do?rec_id="+rec_id; 
		

			logger.info("파일 업로드 작업");
			fileSave(rec_id, thumbnailFile);
			photoSave(rec_id,rec_photo);
		
		
		return page;
	}
	
	private void photoSave(int rec_id, MultipartFile rec_photo) {
		int identify_number = rec_id;
		int photo_number = 0;
		
		 logger.info(rec_photo.getOriginalFilename());  
		  
				//1-1. 원본 이름 추출
				String ori_photo_name = rec_photo.getOriginalFilename();
				//1-2. 확장자 추출
				String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
				//1-3. 새이름 생성 + 확장자
				String photo_name = System.currentTimeMillis()+ext;
				logger.info(ori_photo_name+" => "+photo_name);		
				String cat_id = "rec_p";
				try {
					byte[] bytes = rec_photo.getBytes();//1-4. 바이트 추출
					//1-5. 추출한 바이트 저장
					Path path = Paths.get("C:/img/upload/"+photo_name);
					Files.write(path, bytes);
					logger.info(photo_name+" save OK");
					// 2. 저장 정보를 DB 에 저장
					//2-1. 가져온 rec_id, oriFileName, newFileName insert
					logger.info(Integer.toString(identify_number));
					dao.fileWrite(identify_number,photo_number,ori_photo_name,photo_name,cat_id);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
		
	}

	private void fileSave(int rec_id, List<MultipartFile> thumbnailFile) {
		// 1. 파일을 C:/img/upload/ 에 저장
		
		int identify_number = rec_id;
		int photo_number = 1;
		for (MultipartFile files : thumbnailFile) {
			  logger.info(files.getOriginalFilename());  
			  
			//1-1. 원본 이름 추출
				String ori_photo_name = files.getOriginalFilename();
				//1-2. 확장자 추출
				String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
				//1-3. 새이름 생성 + 확장자
				String photo_name = System.currentTimeMillis()+ext;
				logger.info(ori_photo_name+" => "+photo_name);		
				String cat_id = "rec_p";
				try {
					byte[] bytes = files.getBytes();//1-4. 바이트 추출
					//1-5. 추출한 바이트 저장
					Path path = Paths.get("C:/img/upload/"+photo_name);
					Files.write(path, bytes);
					logger.info(photo_name+" save OK");
					// 2. 저장 정보를 DB 에 저장
					//2-1. 가져온 rec_id, oriFileName, newFileName insert
					logger.info(Integer.toString(identify_number));
					dao.fileWrite(identify_number,photo_number,ori_photo_name,photo_name,cat_id);
					photo_number++;
					
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

	}
	public RecipeDTO detail(String rec_id) {
		dao.upRec_view(rec_id);
	
		 return  dao.detail1(rec_id);
	}

	public List<RecipeDTO> detailContent(String rec_id) {
		
		return dao.detail2(rec_id);
	}

	public List<RecipeDTO> detailPhoto(String rec_id) {
		
		return dao.detail3(rec_id);
	}

	public List<RecipeDTO> detailFood(String rec_id) {
	
		return dao.detail4(rec_id);
	}


	public String mainPhoto(String rec_id) {
		
		return dao.detail5(rec_id);
	}

	public ArrayList<RecipeDTO> listPhoto() {
		
		return dao.listPhoto();
	}


}
