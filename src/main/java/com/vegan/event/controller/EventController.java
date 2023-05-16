package com.vegan.event.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.vegan.event.dto.EventDTO;
import com.vegan.event.service.EventService;

@Controller
public class EventController {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EventService service;
	
	
	@RequestMapping(value="/event")
	public String main(Model model, HttpSession session) {
		String page = "eventList";
		
		if(session.getAttribute("loginId") != null) {
			   page = "eventList";
			   String loginId = String.valueOf(session.getAttribute("loginId"));
			   int admin = (int)service.adminChk(loginId);
			   logger.info("admin" + admin);
			   if(admin == 1) {
				   model.addAttribute("adminChk", admin);
			   }
		   }
		return page;
	}
	
	@RequestMapping(value="/event.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object>list(
			@RequestParam String page,	@RequestParam String cnt){
		return service.list(Integer.parseInt(page), Integer.parseInt(cnt));
	}
	

	
	@RequestMapping(value="/eventWrite.go")
	public String writeForm() {
		logger.info("write page 이동");
		return "eventWriteForm";
	}
	
	
	@RequestMapping(value="/eventWrite.do", method = RequestMethod.POST)
	public String write(MultipartFile photo,HttpSession session, 
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.eventwrite(photo, params);
	}
	
	
	 @RequestMapping(value="/eventDetail.do", method = RequestMethod.GET)
	   public String detail(Model model, @RequestParam String event_id, HttpSession session) {
	      logger.info("eventDetail : "+event_id);
	      
	     
	      //String page = "redirect:/event.do"; 
	      String page = "eventDetail";
	      EventDTO dto = service.detail(event_id);
	      
	      model.addAttribute("dto", dto);
	      
	      if(session.getAttribute("loginId") != null) {
	        	 page = "eventDetail";
	        	 String loginId = String.valueOf(session.getAttribute("loginId"));
	        	 int admin = (int)service.adminChk(loginId);
	        	 logger.info("admin" + admin);
	        	 if(admin == 1) {
	        		 model.addAttribute("adminChk", admin);
	        	 }
	         }
 
	      if(dto != null) {
	         page = "eventDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      
	                
	      return page;
	   }


	@RequestMapping(value="/eventDelete.do")
	public String delete(@RequestParam String event_id) {
		service.delete(event_id);
		return "redirect:/event";
	}
	
	@RequestMapping(value="/eventUpdate.go")
	public String updateForm(Model model, @RequestParam String event_id) {
		logger.info("detail : "+event_id);
		String page = "redirect:/event.do";		
		EventDTO dto = service.detail(event_id);
		if(dto != null) {
			page = "eventUpdateForm";
			model.addAttribute("dto", dto);
		}				
		return page;
	}
	
	@RequestMapping(value="/eventUpdate.do", method = RequestMethod.POST)
	public String update(MultipartFile photo, 
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.update(photo, params);
	}
	
	

}
