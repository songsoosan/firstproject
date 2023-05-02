package com.vegan.mypage.service;



import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.mypage.dao.MypageDAO;
import com.vegan.mypage.dto.MypageDTO;

@Service
public class MypageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired MypageDAO dao;
	public MypageDTO profile(String id) {
		
		return dao.profile();
	}
	public MypageDTO detail(String id) {
		
		return dao.detail();
	}
	public void update(HashMap<String, String> params) {
		int row = dao.update(params);
		logger.info("update row:"+row);
		
	}
	public Object pwChk(String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
