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
	
	@RequestMapping(value = "/recieveList.ajax")
	@ResponseBody
	public HashMap<String, Object> recieveList(HttpSession session
			, @RequestParam String page,	@RequestParam String cnt){
		String loginId = (String) session.getAttribute("loginId");
		return service.recieveList(loginId ,Integer.parseInt(page), Integer.parseInt(cnt));
	}
	@RequestMapping(value = "/sendList.ajax")
	@ResponseBody
	public HashMap<String, Object> sendList(HttpSession session
			, @RequestParam String page,	@RequestParam String cnt){
		String loginId = (String) session.getAttribute("loginId");
		return service.sendList(loginId ,Integer.parseInt(page), Integer.parseInt(cnt));
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
	   
		@RequestMapping(value="/delete.ajax")
		@ResponseBody
		public HashMap<String, Object> delete(
				@RequestParam(value="delList[]") ArrayList<String> delList){
			logger.info("delList : "+delList);
			return service.delete(delList);
		}
	   
		@RequestMapping(value="/detail.go")
		public String detail(@RequestParam int id, HttpSession session) {
			logger.info("detail id : "+ id);
			session.setAttribute("detailId", id);
			return "letterDetail";
		}
		
		@RequestMapping(value="/detail.ajax")
		@ResponseBody
		public HashMap<String, Object> detail(HttpSession session){
			String detailId = String.valueOf(session.getAttribute("detailId"));
			
			logger.info("상세보기 할 아이디 : "+detailId);
			
			HashMap<String, Object> map = service.detail(detailId);
			logger.info("result : "+map);
			if(map != null && map.size()>0) {
				session.removeAttribute("detailId");
			}
					
			return map;
		}
		@RequestMapping(value="/recieveletter.go")
		public String recieveletter() {
	
			return "recieveLetter";
		}
		@RequestMapping(value="/sendletter.go")
		public String sendletter() {
	
			return "sendLetter";
		}
		@RequestMapping(value="/reportWrite.go")
		public String reportWrite() {
	
			return "reportWrite";
		}
		
		
}
