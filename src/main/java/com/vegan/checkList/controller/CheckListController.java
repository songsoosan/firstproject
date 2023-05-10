package com.vegan.checkList.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegan.checkList.dto.CheckListDTO;
import com.vegan.checkList.service.CheckListService;

@Controller
public class CheckListController {
	
	@Autowired CheckListService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/survey.do")
	public String list(Model model) {
	    logger.info("list call");
	    ArrayList<CheckListDTO> list = service.list();  // 질문 리스트를 서비스에서 가져옴
	    //logger.info("list의 값 : "+list);
	    model.addAttribute("list", list); // 질문 리스트를 모델에 담음
	    return "surveyList";
	}
		
	@RequestMapping(value ="/surveyWrite.go")
	public String surveyWrite() {
		return "surveyWrite";
	}
	
	@RequestMapping(value = "/surveyWrite.do", method = RequestMethod.POST)
	public String write(@RequestParam HashMap<String, Object> params) { 
		return service.write(params);
		
	}
	
	@RequestMapping(value = "/surveyUpdate.go")
	public String updateForm(Model model) {
		ArrayList<CheckListDTO> list = service.list();
		model.addAttribute("list", list);
		return "surveyUpdate";
	}
	
	@RequestMapping(value = "/surveyUpdate.do", method = RequestMethod.POST)
	public String update(@RequestParam HashMap<String, Object> params) {
		return service.update(params);
	}

	@RequestMapping(value = "/result.go", method = RequestMethod.POST)
	public String resultsave(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
	    String user_id = (String) session.getAttribute("loginId");
	    logger.info("얻어온 아이디 : "+user_id);
	    logger.info("파람의 값 : "+params);
	    params.put("user_id", user_id); // "user_id" 키 추가
	    logger.info("유저 아이디 추가한 파람 : "+params);
	    service.resultsave(params); // "user_id" 키가 추가된 params 전달
	    Map<String, String> result = new HashMap<>();
	    result.put("user_id_value", params.get("user_id"));
	    result.put("total_score_value", params.get("total_score"));
	    result.put("grade", params.get("grade"));
	    logger.info("result 값 : "+result);
	    logger.info("컨트롤러 파람의 값 : "+params.toString());
	    model.addAttribute("result", result);
	    return "surveyResult";
	}
	
}
	 

	
	
	



