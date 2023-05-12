package com.vegan.main.controller;

import javax.servlet.http.HttpSession;

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
public class MainController {
	
	 Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired MemberService service;
	 
//	@RequestMapping(value = "/login.do", method= RequestMethod.POST)
//	public String main(Model model, HttpSession session) {
//		String page = "login";
//		
//			return "main";
//	}
	
	@RequestMapping(value = "/recipe.go", method = RequestMethod.GET)
	public String recipe(Model model) {
			return "recipe";
	}
	
	@RequestMapping(value = "/ranking.go", method = RequestMethod.GET)
	public String ranking(Model model) {
			return "ranking";
	}

	@RequestMapping(value = "/magazine.go", method = RequestMethod.GET)
	public String magazine(Model model) {
			return "magazineList";
	}

	@RequestMapping(value = "/event.go", method = RequestMethod.GET)
	public String event(Model model) {
		return "eventList";
	}
	@RequestMapping(value = "/recipeWrite.go", method = RequestMethod.GET)
	public String write(Model model) {
		return "recipeWrite";
	}

	
}
