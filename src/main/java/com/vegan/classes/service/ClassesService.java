	package com.vegan.classes.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.classes.dao.ClassesDAO;
import com.vegan.classes.dto.ClassesDTO;
import com.vegan.mypage.dto.MypageDTO;

@Service
public class ClassesService {
	
	@Autowired ClassesDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public String write(MultipartFile photo, HashMap<String, String> params) {
		ClassesDTO dto = new ClassesDTO();
		logger.info("photo"+photo);
		dto.setUser_id(params.get("user_id"));
		dto.setCl_subject(params.get("cl_subject"));
		dto.setCl_period(params.get("cl_period"));
		dto.setCl_deadlinePeriod(params.get("cl_deadlinePeriod"));
		dto.setCl_deadline(Integer.valueOf(params.get("cl_deadline")));
		dto.setCl_teacher(params.get("cl_teacher"));
		dto.setCl_date(params.get("cl_date"));
		dto.setCl_ing_chk(Boolean.valueOf(params.get("cl_ing_chk")));
		dto.setPostcode(params.get("postcode"));
		dto.setAddress(params.get("address"));
		dto.setDetailAddress(params.get("detailAddress"));
		dto.setExtraAddress(params.get("extraAddress"));
		dto.setCl_content(params.get("cl_content"));
	
		int row = dao.write(dto);		
		logger.info("update row : "+row);
		String page = "redirect:/classList.go";
		
		
		int idx = dto.getIdx();
		logger.info("recieve idx : "+idx);
		if(!photo.getOriginalFilename().equals("")) {
			logger.info("파일 업로드 작업");
			fileSave(idx, photo);
		}
		
		return page;
	}

	private void fileSave(int idx, MultipartFile file) {
		// 1. 파일을 C:/img/upload/ 에 저장
		//1-1. 원본 이름 추출
		String ori_photo_name = file.getOriginalFilename();
		//1-2. 확장자 추출
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		//1-3. 새이름 생성 + 확장자
		String photo_name = System.currentTimeMillis()+ext;
		logger.info(ori_photo_name+" => "+photo_name);		
		try {
			byte[] bytes = file.getBytes();//1-4. 바이트 추출
			//1-5. 추출한 바이트 저장
			Path path = Paths.get("C:/img/upload/"+photo_name); //경로가져오기
			Files.write(path, bytes);
			logger.info(photo_name+" save OK");
			dao.fileWrite(idx, ori_photo_name, photo_name);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ClassesDTO> list() {
		
		return dao.list();
	}

	public ClassesDTO detail(String cl_id) {
		
		return dao.detail(cl_id);
	}
	
	public MypageDTO profile2(String user_id) {
		
		return dao.profile2(user_id);
	}

	public String appWrite(String cl_id) {
		
		return dao.appWrite(cl_id);
	}

	public ClassesDTO user(String loginId) {
		
		return dao.user(loginId);
	}

	public int classApp(ClassesDTO dto) {
		
	
		
		return dao.classApp(dto);
	}

	public ArrayList<ClassesDTO> appList(String cl_id) {
		
		
		return dao.appList(cl_id);
	}

	public String update(HashMap<String, String> params) {
		
		int cl_id = Integer.parseInt(params.get("cl_id"));		
		int row = dao.update(params);
		
		String page = row>0 ? "redirect:/class.detail.do?cl_id="+cl_id : "redirect:/classList.go";
		logger.info("update => "+page);
		
		return page;
	}

	public byte adminChk(String loginId) {
		
		return dao.adminChk(loginId);
	}

}
