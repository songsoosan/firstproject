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

	    dao.resultsave(params);
	}

	public ArrayList<CheckListDTO> getresult(HashMap<String, String> params) {
	    return dao.getresult(params);
	}
	
	
//    String user_id = "";
//    if (params.containsKey("user_id")) {
//        user_id = (String) params.get("user_id");
//    }
//    logger.info("유저아이디 확인 : "+user_id);
//    int total_score = 0;
//    if (params.containsKey("total_score")) {
//        total_score = Integer.parseInt(params.get("total_score").toString());
//    }
//    int question_count = 0;
//    for (String key : params.keySet()) { // 파람에서 가져온값의 이름은 key
//        if (key.equals("user_id")) { // key가 user_id일때
//            continue; // "user_id"는 정수형으로 변환하지 않고 다음 반복문으로 건너뛰기
//        }
//        if (key.startsWith("question_")) { // 키에서 question_로 시작하는걸 다가져와서
//        	String questionNumber = key.substring("question_".length()); // "question_" 이후의 문자열을 추출하여 질문 번호로 사용
//            question_count++; // 숫자증가
//            Integer choiceValue = (Integer) params.get(key);
//            if (choiceValue != null) {
//                int choice = choiceValue.intValue(); //question_number의 value를 가져와서 정수형으로 저장 > choice에 담기
//                total_score += choice; // 증가
//            } else {
//            	logger.info("키"+key+"의 값은 null입니다.");
//            }
//            // 질문번호에 대한 선택지를 통해 총점계산
//        }
//    }	









	


	
	
	

	
	
}
