package com.vegan.report.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/reportWrite.go")
	public String reportWrite(
			@RequestParam String board_id, Model model,@RequestParam String board_title,@RequestParam String cat_id) {
		model.addAttribute("board_id",board_id);
		model.addAttribute("board_title",board_title);
		model.addAttribute("cat_id",cat_id);
		logger.info("board_title"+board_title);
		return "reportWrite";
	}
	
	
	@RequestMapping(value="/reportSend.ajax" )
	 @ResponseBody
	   public HashMap<String, Object> letterSend(
	         @RequestParam HashMap<String, String> params,HttpSession session){
	      return null;
	   }
}
