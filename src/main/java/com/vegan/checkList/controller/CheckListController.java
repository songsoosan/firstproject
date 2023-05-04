package com.vegan.checkList.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	    ArrayList<CheckListDTO> list = service.list(); // 질문 리스트를 서비스에서 가져옴
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
	public String updateForm() {
		return "surveyUpdate";
	}
	
	
	@RequestMapping(value = "/surveyUpdate.do")
	public String update(Model model, @RequestParam HashMap<String, Object> params) {
		return service.update(params);
	}
	
}
	 
	
	
	



