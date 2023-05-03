package com.vegan.letter.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.letter.service.LetterService;

import com.vegan.letter.dto.LetterDTO;

@Controller
public class LetterController {
	
	@Autowired LetterService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/list.go")
	public String list(HttpSession session) {
		
		String page = "redirect:/login";
		
		if(session.getAttribute("loginId") != null) {
			logger.info("로그인 여부 확인");
			page = "letter";
		}
				
		return page;
	}
	
	@RequestMapping(value = "/recievList.ajax")
	@ResponseBody
	public HashMap<String, Object> listCall(HttpSession session){
		String loginId = (String) session.getAttribute("loginId");
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("loginId")!= null) {
			login = true;
			ArrayList<LetterDTO> list = service.list(loginId);
			map.put("list", list);
		}
		
		map.put("login", login);
		
		return map;
	}
	
	   @RequestMapping(value="/letterSend.ajax" )
	   @ResponseBody
	   public HashMap<String, Object> letterSend(
	         @RequestParam HashMap<String, String> params,HttpSession session){
	      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      Date now = new Date();
	        String nowTime = sdf1.format(now);
	      String loginId = (String) session.getAttribute("loginId");
	      
	      params.put("date", nowTime);
	      params.put("id", loginId);
	      logger.info("params : {}",params);
	      return service.letterSend(params);
	   }

	
	   @RequestMapping(value="/letterWrite.go" )
	   public String letterWrite(){
	      return "letterWriteForm";
	   }

}
