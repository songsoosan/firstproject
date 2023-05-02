package com.vegan.magazine.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.magazine.dao.MagazineDAO;
import com.vegan.magazine.dto.MagazineDTO;

@Service
public class MagazineService {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MagazineDAO dao;
	
	public ArrayList<MagazineDTO> list() {
		return dao.list();
	}

	public String write(MultipartFile photo, HashMap<String, String> params) {
		
		String page = "redirect:/magazine.do";
		
		// 1. 게시글만 작성한 경우
		// 빙금 insert 한 값의 key 를 반환 받는 방법
		// 조건 1. 파라메터를 dto 로 보내야 한다.
		MagazineDTO dto = new MagazineDTO();
		dto.setBoard_title(params.get("board_title"));
		dto.setUserID(params.get("userID"));
		dto.setBoard_content(params.get("board_content"));
		dto.setCategoryID(params.get("categoryID"));
		int row = dao.write(dto);
		logger.info("update row : "+row);
		
		// 조건 3. 받아온 키는 파라메터 dto 에서 뺀다.
		int board_id = dto.getBoard_id();
		logger.info("방금 insert 한 board_id : "+board_id);
		
		page = "redirect:/magazineDetail.do?idx="+board_id;
		
		// 2. 파일도 업로드 한 경우
		if(!photo.getOriginalFilename().equals("")) {
			logger.info("파일 업로드 작업");
			fileSave(board_id,photo);
		}
		return page;
	}

	private void fileSave(int board_id, MultipartFile file) {
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
			Path path = Paths.get("C:/img/upload/"+photo_name);
			Files.write(path, bytes);
			logger.info(photo_name+" save OK");
			// 2. 저장 정보를 DB 에 저장
			//2-1. 가져온 idx, oriFileName, newFileName insert
			dao.fileWrite(board_id,ori_photo_name,photo_name);
								
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public MagazineDTO detail(int board_id, String flag) {
		if(flag.equals("detail")) {
			dao.board_views(board_id);
		}
		return dao.detail(board_id);
	}

	public void delete(String board_id) {
		// 1. photo 에 해당 board_id 값이 있는지?
		String photo_name = dao.findFile(board_id);
		logger.info("file name : "+photo_name);
		// 2. 없다면?
		int row = dao.delete(board_id);
		logger.info("delete data : "+row);
		
		if(photo_name != null && row>0) {
			File file = new File("C:/img/upload/"+photo_name);
			if(file.exists()) {
				file.delete();
			}
		}
		
		
	}
	
	

}
