package com.vegan.report.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReportController {

	
	@RequestMapping(value="/reportSend.ajax" )
	 @ResponseBody
	   public HashMap<String, Object> letterSend(
	         @RequestParam HashMap<String, String> params,HttpSession session){
	      return null;
	   }
}
