package com.vegan.letter.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.letter.dao.LetterDAO;
import com.vegan.letter.dto.LetterDTO;

@Service
public class LetterService {
	@Autowired LetterDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	public HashMap<String, Object> letterSend(HashMap<String, String> params) {
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("success", dao.letterSend(params));
	      return map;
	   }

	public HashMap<String, Object> detail(String detailId) {
		
		dao.read(detailId);
		
		return dao.detail(detailId);
	}

	public HashMap<String, Object> recieveList(String loginId, int page, int cnt) {
		logger.info(page+" 페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = (page-1)*cnt;
		
		int total = dao.totalCount();
		
		int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
		logger.info("전체 게시물 수 : "+total);
		logger.info("총 페이지 수 : "+range);
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		boolean login = false;
		
		if(loginId != null) {
			login = true;
			ArrayList<LetterDTO> list = dao.recieveList(loginId, cnt, offset);
			map.put("list", list);
		}
		map.put("login", login);
		
		return map;
	}

	public HashMap<String, Object> sendList(String loginId, int page, int cnt) {
		logger.info(page+" 페이지 보여줘");
		logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = (page-1)*cnt;
		
		int total = dao.totalCount();
		
		int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
		logger.info("전체 게시물 수 : "+total);
		logger.info("총 페이지 수 : "+range);
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		boolean login = false;
		
		if(loginId != null) {
			login = true;
			ArrayList<LetterDTO> list = dao.sendList(loginId, cnt, offset);
			map.put("list", list);
		}
		map.put("login", login);
		
		return map;
		
	}

	public HashMap<String, Object> delete(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = delList.size();
		int successCnt = 0;
		for (String id : delList) {
			successCnt += dao.delete(id);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}
	
}
