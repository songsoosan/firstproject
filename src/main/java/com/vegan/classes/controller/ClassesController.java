package com.vegan.classes.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

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
	
	private static final Logger logger = LoggerFactory.getLogger(ClassesController.class);
	
	@Autowired ClassesService service;
	

	@RequestMapping(value="/class", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("test");
		return "classTestMain";
	}

	
	@RequestMapping(value="/classList.go", method = RequestMethod.GET)
	public String ClassList(Model model, HttpSession session) {

		if (session.getAttribute("loginId") != null) {
			String loginId = String.valueOf(session.getAttribute("loginId"));
			int admin = (int)service.adminChk(loginId);
			logger.info("admin"+admin);
			if (admin == 1) {
				model.addAttribute("adminChk",admin);
			}
		}
		logger.info("list call");
		ArrayList<ClassesDTO> list = service.list();		
		logger.info("list cnt : "+list.size());
		System.out.println("list cnt "+list.size());
		model.addAttribute("list", list);
		return "classList";
	}
	
	@RequestMapping(value="/classWrite.go")
	public String ClassWriteForm(Model model) {
		String msg = "클래스 등록 테스트";
		model.addAttribute("msg", msg);
		
		
		return "classWrite";
	}
	
	@RequestMapping(value="/classWrite.do", method = RequestMethod.POST)
	public String ClassWrite(MultipartFile photo, Model model, @RequestParam HashMap<String, String> params,HttpSession session) {
		String msg = "클래스 등록";
		logger.info("a"+params);
		model.addAttribute("msg", msg);
		
		return service.write(photo, params);
	}
	
	@RequestMapping(value="/class.detail.do")
	public String detail(Model model, @RequestParam String cl_id, HttpSession session) {
		logger.info("detail : "+cl_id);
		String page = "redirect:/class.go";	
		if (session.getAttribute("loginId") != null) {
			String loginId = String.valueOf(session.getAttribute("loginId"));
			int admin = (int)service.adminChk(loginId);
			logger.info("admin"+admin);
			if (admin == 1) {
				model.addAttribute("adminChk",admin);
			}
		}
		
		
		 ClassesDTO dto = service.detail(cl_id);
		 
		if(dto != null) {
			page = "classDetail";
			model.addAttribute("dto", dto);
		}				
		return page;
	}
	
	
	@RequestMapping(value="/class.appWrite.go")
	public String appWriteForm(Model model, @RequestParam String cl_id, HttpSession session) {
		logger.info("클래스 신청 페이지 이동");
		String loginId =String.valueOf(session.getAttribute("loginId")) ;
		String cl_subject = service.appWrite(cl_id);
		model.addAttribute("cl_id",cl_id);
		model.addAttribute("cl_subject", cl_subject);
		ClassesDTO dto = service.user(loginId);
		model.addAttribute("user", dto);
		
		return "classAppWrite";
	}

	@RequestMapping(value="/class.appWrite.do",method = RequestMethod.POST)
	public String appWrite(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("클래스 신청 저장");
		ClassesDTO dto = new ClassesDTO();
		
		Random random = new Random();
        int number = random.nextInt(100000000); // 8자리의 숫자 생성
        String cl_part_id = String.valueOf(Math.abs(number)); // 생성된 숫자 출력
        logger.info("참여번호"+cl_part_id);

		
		dto.setCl_part_id(cl_part_id);
		dto.setCl_id(Integer.parseInt(params.get("cl_id")));
		dto.setUser_id(params.get("user_id"));
		dto.setPostcode(params.get("postcode"));
		dto.setAddress(params.get("address"));
		dto.setDetailAddress(params.get("detailAddress"));
		dto.setExtraAddress(params.get("extraAddress"));
		dto.setUser_name(params.get("user_name"));
		dto.setUser_phone(params.get("user_phone"));
		int row = service.classApp(dto);
		
		if (row ==1) {
			model.addAttribute("dto", dto);
			model.addAttribute("msg","클래스 신청이 접수되었습니다.");
		}
		
		return "classPartNumber";
	}
	
	@RequestMapping(value="/class.appList.do")
	public String appList(Model model,@RequestParam String cl_id) {
		logger.info("클래스 신청 리스트");
		
		logger.info("list call");
		ArrayList<ClassesDTO> appList = service.appList(cl_id);		
		logger.info("list cnt : "+appList.size());
		model.addAttribute("appList", appList);
		
		return "classAppList";
	}
	
	@RequestMapping(value="/class.update.go")
	public String updateForm(Model model, @RequestParam String cl_id) {
		logger.info("update : "+cl_id);
		String page = "redirect:/list.do";		
		ClassesDTO dto = service.detail(cl_id);
		if(dto != null) {
			page = "classUpdate";
			model.addAttribute("dto", dto);
		}				
		return page;
	}
	
	@RequestMapping(value="/class.update.do", method = RequestMethod.POST)
	public String update(
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.update(params);
	}



}
 