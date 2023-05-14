package com.vegan.event.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.event.dao.EventDAO;
import com.vegan.event.dto.EventDTO;

@Service
public class EventService {

Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EventDAO dao;
	
	/*
	public ArrayList<MagazineDTO> list() {
		return dao.list();
	}
	*/

	public HashMap<String, Object> list(int page, int cnt) {
		logger.info(page+" 페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		HashMap<String, Object> map = new HashMap<String, Object>();		
		
		// 1page = offset : 0
		// 2page = offset : 5
		// 3page = offset : 10
		int offset = (page-1)*cnt;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지당 보여줄 수
		int total = dao.totalCount();
		int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
		logger.info("전체 게시물 수 : "+total);
		logger.info("총 페이지 수 : "+range);
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		ArrayList<EventDTO> list = dao.list(cnt, offset);
	
		map.put("list", list);
		return map;
	}
	
	
	public String eventwrite(MultipartFile photo, HashMap<String, String> params) {
		
		String page = "redirect:/event";
		
		// 1. 게시글만 작성한 경우
		// 빙금 insert 한 값의 key 를 반환 받는 방법
		// 조건 1. 파라메터를 dto 로 보내야 한다.
		EventDTO dto = new EventDTO();
		//receipeDTO.setCat_id("recipe");
		dto.setCat_id("e");
		dto.setEvent_title(params.get("event_title"));
		dto.setEvent_content(params.get("event_content"));
		dto.setUser_id(params.get("user_id"));
		
		String eventDateStr = params.get("event_start_date");
		String eventDateStrr = params.get("event_end_date");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = dateFormat.format(new Date());
		params.put("currentDate", currentDate);
		try {
		    java.util.Date utilStartDate = dateFormat.parse(eventDateStr);
		    java.util.Date utilEndDate = dateFormat.parse(eventDateStrr);
		    
		    java.sql.Date eventStartDate = new java.sql.Date(utilStartDate.getTime());
		    java.sql.Date eventEndDate = new java.sql.Date(utilEndDate.getTime());

		    dto.setEvent_start_date(eventStartDate);
		    dto.setEvent_end_date(eventEndDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		
		int row = dao.eventwrite(dto);
		logger.info("update row : "+row);
		

		// 조건 3. 받아온 키는 파라메터 dto 에서 뺀다.
		int event_id = dto.getEvent_id();
		String cat_id = dto.getCat_id();
		logger.info("방금 insert 한 event_id : "+event_id);
		
		page = "redirect:/eventDetail.do?event_id="+event_id;
		
		// 2. 파일도 업로드 한 경우
		if(!photo.getOriginalFilename().equals("")) {
			logger.info("파일 업로드 작업");
			
			fileSave(cat_id,event_id,photo);
		}
		return page;
	}

	private void fileSave(String cat_id, int event_id, MultipartFile file) {
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
			dao.fileWrite(cat_id, event_id, ori_photo_name, photo_name);
								
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	

	public EventDTO detail(String event_id) {
		
	    
		return dao.detail(event_id);
	}
	

	public void delete(String event_id) {
		// 1. photo 에 해당 board_id 값이 있는지?
		String photo_name = dao.findFile(event_id);
		logger.info("file name : "+photo_name);
		// 2. 없다면?
		int row = dao.delete(event_id);
		logger.info("delete data : "+row);
		
		if(photo_name != null && row>0) {
			File file = new File("C:/img/upload/"+photo_name);
			if(file.exists()) {
				file.delete();
			}
		}
		
		
	}

	public String update(MultipartFile photo, HashMap<String, String> params) {
		
		logger.info("idx : " + params.get("event_id"));
		int idx = Integer.parseInt(params.get("event_id"));
		int row = dao.update(params);
		logger.info("row:"+row);
		
		// 2. photo 에 파일명이 존재 한다면?
		if(photo != null && !photo.getOriginalFilename().equals("")) {
			String cat_id = params.get("cat_id");
			fileSave(null, idx, photo);
		}
		
		String page = row>0 ? "redirect:/eventDetail.do?event_id="+idx : "redirect:/event";
		logger.info("update => "+page);
		
		return page;
	}


	public byte adminChk(String loginId) {
		
		return dao.adminChk(loginId);
	}

	


}
