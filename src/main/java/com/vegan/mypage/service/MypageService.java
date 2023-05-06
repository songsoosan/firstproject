package com.vegan.mypage.service;



import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.mypage.dao.MypageDAO;
import com.vegan.mypage.dto.MypageDTO;

@Service
public class MypageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired MypageDAO dao;
	public MypageDTO profile(String id) {
		
		return dao.profile(id);
	}
	public MypageDTO profileDetail(String id) {
		
		return dao.profileDetail(id);
	}
	public void update(HashMap<String, String> params) {
		int row = dao.update(params);
		logger.info("update row:"+row);
		
	}
	public int pwChk(String id, String pw) {
		
		return dao.pwChk(id,pw);
	}
	public int del(String idx) {
		
		return dao.del(idx);
	}
	public  int proUpdate(String loginId, String introduction) {
		
		return dao.proUpdate(loginId,introduction);
	}
	public int profilePhoto(MultipartFile photo, String loginId) {
		// 1. 파일을 C:/img/upload/ 에 저장
				//1-1. 원본 이름 추출
				String oriFileName = photo.getOriginalFilename();
				//1-2. 확장자 추출
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				//1-3. 새이름 생성 + 확장자
				String newFileName = System.currentTimeMillis()+ext;
				logger.info(oriFileName+" => "+newFileName);		
				try {
					byte[] bytes = photo.getBytes();//1-4. 바이트 추출
					//1-5. 추출한 바이트 저장
					Path path = Paths.get("C:/img/upload/"+newFileName); //경로가져오기
					Files.write(path, bytes);
					logger.info(newFileName+" save OK");
				} catch (IOException e) {
					e.printStackTrace();
				}
		
		
		return dao.profilePhoto(oriFileName,newFileName,loginId); 
	}
	

	
	
}
