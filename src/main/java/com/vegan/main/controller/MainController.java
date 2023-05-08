package com.vegan.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vegan.member.service.MemberService;



@Controller
public class MainController {
	
	 Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired MemberService service;
	 
	
	
	@RequestMapping(value = "/recipe.go", method = RequestMethod.GET)
	public String recipe(Model model) {
			return "recipeList";
	}
	
	@RequestMapping(value = "/ranking.go", method = RequestMethod.GET)
	public String ranking(Model model) {
			return "ranking";
	}
	@RequestMapping(value = "/classes.go", method = RequestMethod.GET)
	public String classes(Model model) {
			return "classes";
	}
	@RequestMapping(value = "/magazine.go", method = RequestMethod.GET)
	public String magazine(Model model) {
			return "magazine";
	}
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String board(Model model) {
			return "board";
	}
	@RequestMapping(value = "/event.go", method = RequestMethod.GET)
	public String event(Model model) {
		return "event";
	}
	@RequestMapping(value = "/write.go", method = RequestMethod.GET)
	public String write(Model model) {
		return "recipeWrite";
	}

	
}
