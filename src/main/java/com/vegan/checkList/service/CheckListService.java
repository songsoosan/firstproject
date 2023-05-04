package com.vegan.checkList.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.checkList.dao.CheckListDAO;
import com.vegan.checkList.dto.CheckListDTO;

@Service
public class CheckListService {

	@Autowired CheckListDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ArrayList<CheckListDTO> list() {
		return dao.list();
		
	}

	public String write(HashMap<String, Object> params) {
		
		CheckListDTO dto = new CheckListDTO();
		// String questionNumberParam = request.getParameter("question_number");
		String questionNumberParam = (String) params.get("addnum");
		int questionNumber = 0; // 기본값 설정
		if (questionNumberParam != null) {
		    questionNumber = Integer.parseInt(questionNumberParam);
		}
		dto.setQuestion_number(questionNumber);
		// dto.setQuestion_number(Integer.parseInt((String) params.get("question_number")));
		dto.setQuestion_detail((String) params.get("additem"));
		int row = dao.write(dto);
		logger.info("update row : "+row);
		
		return "redirect:/survey.do";
	}

	public String update(HashMap<String, Object> params) {
		int row = dao.update(params);
		return "redirect:/survey.do";
	}



	


	
	
	

	
	
}
