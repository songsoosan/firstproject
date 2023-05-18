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
	            page = "surveyResult";
	        } else {
	            // 설문조사 결과가 없는 경우
	            ArrayList<CheckListDTO> list = service.list();
	            model.addAttribute("list", list);
	            page = "surveyList";
	        }

	        boolean admincheck = service.admincheck(user_id);
	        model.addAttribute("admincheck", admincheck);
	    } else {
	        page = "redirect:/main.go";
	        
	        session.setAttribute("msg", "로그인 후 이용해주시기 바랍니다.");
	    }

	    // 다시하기 버튼 클릭 시 설문조사 페이지로 이동
	    if (page.equals("surveyResult")) {
	        model.addAttribute("retryUrl", "/admin/surveyReset.do");
	    } else {
	        model.addAttribute("retryUrl", "/survey.do");
	    }
	    return page;
	}
	
	@RequestMapping(value = "/surveyReset.do")
	public String surveyReset(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		if(user_id != null) {
			service.surveyReset(user_id);
		}
		return "redirect:/survey.do";
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
	    String page = "";
	    // logger.info("얻어온 아이디 : "+user_id);
	    // logger.info("파람의 값 : "+params);
	    params.put("user_id", user_id); // "user_id" 키 추가
	    // logger.info("유저 아이디 추가한 파람 : "+params);
	    service.resultsave(session, params); // "user_id" 키가 추가된 params 전달
	    
	    if(params.containsKey("retry")) {
	    	service.surveyReset(user_id);
	    	page = "redirect:/survey.do";
	    } else {
	    	Map<String, String> result = new HashMap<>();
		    result.put("user_id_value", params.get("user_id"));
		    result.put("total_score_value", params.get("total_score"));
		    result.put("step", params.get("step"));
		    // logger.info("result 값 : "+result);
		    // logger.info("컨트롤러 파람의 값 : "+params.toString());
		    model.addAttribute("result", result);
		    service.profilego(params);
		    page = "surveyResult";
	    }
	    return page;

	}
	
}