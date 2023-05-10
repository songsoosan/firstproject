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
		logger.info("업데이트 확인 : "+row);
		return "redirect:/survey.do";
	}

	public void resultsave(HashMap<String, String> params) {
	    String user_id = params.get("user_id");
	    logger.info("유저 아이디 확인 : " + user_id);
	    logger.info("서비스 파람 확인 : " + params);

	    int total_score = 0;
	    for (String key : params.keySet()) {
	        Object value = params.get(key);
	        if (value instanceof Integer) {
	            total_score += (Integer) value;
	        } else if (value instanceof String) {
	            if (key.equals("user_id") || key.equals("total_score")) {
	                continue;
	            }
	            try {
	                total_score += Integer.parseInt((String) value);
	            } catch (NumberFormatException e) {
	                // 숫자로 변환할 수 없는 경우 기본값인 0으로 설정합니다.
	                total_score += 0;
	            }
	        }
	    }

	    logger.info("총 점수 : " + total_score);
	    params.put("total_score", String.valueOf(total_score));
	    logger.info("파람의 값 : "+params.toString());
	    
	    int total_score_value = Integer.parseInt(params.get("total_score"));

	    String grade;
	    if (total_score_value >= 1 && total_score_value <= 10) {
	        grade = "플렉시테리언";
	    } else if (total_score_value >= 11 && total_score_value <= 20) {
	        grade = "폴로 페스코 베지테리언";
	    } else if (total_score_value >= 21 && total_score_value <= 30) {
	        grade = "페스코 베지테리언";
	    } else if (total_score_value >= 31 && total_score_value <= 40) {
	        grade = "락토 오보 베지테리언";
	    } else if (total_score_value >= 41 && total_score_value <= 50) {
	        grade = "비건";
	    } else {
	        // 점수가 범위에 포함되지 않는 경우 기본값으로 플렉시테리언 설정
	        grade = "플렉시테리언";
	    }

	    params.put("grade", grade);

	    dao.resultsave(params);
	}

	public ArrayList<CheckListDTO> getresult(HashMap<String, String> params) {
	    return dao.getresult(params);
	}
	
}
