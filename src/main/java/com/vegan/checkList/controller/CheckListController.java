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
	public String list(Model model, HttpSession session) {
	    String page = "";
	    String user_id = (String) session.getAttribute("loginId");
	    if (user_id != null) {
	        boolean resultCheck = service.resultCheck(user_id);
	        if (resultCheck) {
	            // 설문조사 결과가 있는 경우
	            Map<String, String> result = service.getresult(user_id);
	            model.addAttribute("result", result);
	            // logger.info("result 의 값 : "+result);
	            page = "surveyResult";
	        } else {
	            // 설문조사 결과가 없는 경우
	            page = "surveyList";
	            ArrayList<CheckListDTO> list = service.list();
	            model.addAttribute("list", list);
	        }
	        
	        boolean admincheck = service.admincheck(user_id);
	        model.addAttribute("admincheck", admincheck);
	    } else {
	        page = "main";
	        model.addAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
	    }
	    
	    // logger.info("list call");
	    return page;
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

	@RequestMapping(value = "/result.go", method = {RequestMethod.POST, RequestMethod.GET})
	public String resultsave(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
	    String user_id = (String) session.getAttribute("loginId");
	    // logger.info("얻어온 아이디 : "+user_id);
	    // logger.info("파람의 값 : "+params);
	    params.put("user_id", user_id); // "user_id" 키 추가
	    // logger.info("유저 아이디 추가한 파람 : "+params);
	    service.resultsave(session, params); // "user_id" 키가 추가된 params 전달
	    Map<String, String> result = new HashMap<>();
	    result.put("user_id_value", params.get("user_id"));
	    result.put("total_score_value", params.get("total_score"));
	    result.put("step", params.get("step"));
	    // logger.info("result 값 : "+result);
	    // logger.info("컨트롤러 파람의 값 : "+params.toString());
	    model.addAttribute("result", result);
	    return "surveyResult";
	}
	
}
	 

	
	
	



