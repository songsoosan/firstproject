package com.vegan.mypage.controller;

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

import com.vegan.mypage.dto.MypageDTO;
import com.vegan.mypage.service.MypageService;



@Controller
public class MypageController {

	@Autowired MypageService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/profile.do", method = RequestMethod.POST)
	public String profile(@RequestParam String id, Model model) {
		String page = "login";
		
		MypageDTO dto = service.profile(id);
		if (dto != null) {
			page = "profile";
			logger.info("profile:"+dto);
			model.addAttribute("user",dto);
		}
		
		return page;
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	public String detail(@RequestParam String id, Model model) {
		
		MypageDTO dto = service.detail(id);
			
			logger.info("detail:"+dto);
			model.addAttribute("detail",dto);
		
		
		return "userdetail";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update( Model model, @RequestParam HashMap<String,String> params, HttpSession session) {
		logger.info("update param:"+params);
		if (session.getAttribute("loginId")!= null) {
			service.update(params);
		}
		return "redirect:/detail.do?id="+params.get("id");
	}
	
	@RequestMapping(value ="/passwardChk.do", method = RequestMethod.POST)
	public String pwChk(@RequestParam String pw) {
		String page = "pwcheck";
		if (service.pwChk(pw) != null) {
			page = "pwCheck";
		}
		
		return page;
	}
	 
}
