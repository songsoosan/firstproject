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
import org.springframework.web.multipart.MultipartFile;

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.classes.service.ClassesService;




@Controller
public class ClassesController {
	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(ClassesController.class);
	 * 
	 * @Autowired ClassesService service;
	 * 
	 * @RequestMapping(value="/", method = RequestMethod.GET) public String
	 * test(Model model) { logger.info("test"); return "classTestMain"; }
	 * 
	 * @RequestMapping(value="/class.go", method = RequestMethod.GET) public String
	 * ClassList(Model model) { String msg = "클래스 리스트 테스트";
	 * model.addAttribute("msg", msg);
	 * 
	 * logger.info("list call"); ArrayList<ClassesDTO> list = service.list();
	 * logger.info("list cnt : "+list.size());
	 * System.out.println("list cnt "+list.size()); model.addAttribute("list",
	 * list); return "classList"; }
	 * 
	 * @RequestMapping(value="/class.write", method = RequestMethod.GET) public
	 * String ClassWriteForm(Model model) { String msg = "클래스 등록 테스트";
	 * model.addAttribute("msg", msg);
	 * 
	 * 
	 * return "classWrite"; }
	 * 
	 * @RequestMapping(value="/class.write.do", method = RequestMethod.POST) public
	 * String ClassWrite(Model model, @RequestParam HashMap<String, String> params)
	 * { String msg = "클래스 등록 테스트"; model.addAttribute("msg", msg);
	 * 
	 * return service.write(params); }
	 * 
	 * @RequestMapping(value="/class.detail.do") public String detail(Model
	 * model, @RequestParam String cl_id) { logger.info("detail : "+cl_id); String
	 * page = "redirect:/class.go"; ClassesDTO dto = service.detail(cl_id);
	 * 
	 * if(dto != null) { page = "classDetail"; model.addAttribute("dto", dto); }
	 * return page; }
	 * 
	 * 
	 * @RequestMapping(value="/class.appWrite.go") public String appWriteForm(Model
	 * model, @RequestParam String cl_id) { logger.info("클래스 신청 페이지 이동"); String
	 * cl_subject = service.appWrite(cl_id); model.addAttribute("cl_id",cl_id);
	 * model.addAttribute("cl_subject", cl_subject); ClassesDTO dto =
	 * service.appWrite2(); model.addAttribute("dto", dto);
	 * 
	 * return "classAppWrite"; }
	 * 
	 * @RequestMapping(value="/class.appWrite.do",method = RequestMethod.POST)
	 * public String appWrite(Model model, @RequestParam HashMap<String, String>
	 * params) { logger.info("클래스 신청 저장");
	 * 
	 * 
	 * return service.appWrite3(params); }
	 * 
	 * @RequestMapping(value="/class.appList.do") public String appList(Model
	 * model,@RequestParam String cl_id) { logger.info("클래스 신청 리스트");
	 * 
	 * logger.info("list call"); ArrayList<ClassesDTO> appList =
	 * service.appList(cl_id); logger.info("list cnt : "+appList.size());
	 * model.addAttribute("appList", appList);
	 * 
	 * return "classAppList"; }
	 * 
	 * @RequestMapping(value="/class.update.go") public String updateForm(Model
	 * model, @RequestParam String cl_id) { logger.info("update : "+cl_id); String
	 * page = "redirect:/list.do"; ClassesDTO dto = service.detail(cl_id); if(dto !=
	 * null) { page = "classUpdate"; model.addAttribute("dto", dto); } return page;
	 * }
	 * 
	 * @RequestMapping(value="/class.update.do", method = RequestMethod.POST) public
	 * String update(
	 * 
	 * @RequestParam HashMap<String, String> params) {
	 * logger.info("params : "+params); return service.update(params); }
	 */

}
 