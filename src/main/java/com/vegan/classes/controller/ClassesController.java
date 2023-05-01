package com.vegan.classes.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.classes.service.ClassesService;


@Controller
public class ClassesController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClassesController.class);
	
	@Autowired ClassesService service;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("test");
		return "classTestMain";
	}
	
	@RequestMapping(value="/class.go", method = RequestMethod.GET)
	public String ClassList(Model model) {
		String msg = "클래스 리스트 테스트";
		model.addAttribute("msg", msg);
		
		logger.info("list call");
		ArrayList<ClassesDTO> list = service.list();		
		logger.info("list cnt : "+list.size());
		System.out.println("list cnt "+list.size());
		model.addAttribute("list", list);
		return "classList";
	}
	
	@RequestMapping(value="/class.write", method = RequestMethod.GET)
	public String ClassWriteForm(Model model) {
		String msg = "클래스 등록 테스트";
		model.addAttribute("msg", msg);
		
		
		return "classWrite";
	}
	
	@RequestMapping(value="/class.write.do", method = RequestMethod.POST)
	public String ClassWrite(Model model, @RequestParam HashMap<String, String> params) {
		String msg = "클래스 등록 테스트";
		model.addAttribute("msg", msg);
		
		return service.write(params);
	}


}
