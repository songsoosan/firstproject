package com.vegan.member.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegan.member.service.MemberService;

@Controller
public class MemberController {

	 Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired MemberService service;
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
			return "login";
	}
	 
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinForm(Model model) {
		return "joinForm";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(Model model, @RequestParam HashMap<String, String> params) {
		logger.info("join param : " + params);
		
		String msg = service.join(params);
		model.addAttribute("msg", msg);
		
		return "login";
	}

	
}
