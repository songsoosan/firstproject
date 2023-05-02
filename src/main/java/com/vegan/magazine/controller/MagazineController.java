package com.vegan.magazine.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.vegan.magazine.dto.MagazineDTO;
import com.vegan.magazine.service.MagazineService;


@Controller
public class MagazineController {
	
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MagazineService service;

	@RequestMapping(value = "/magazine")
	public String list(Model model) {
		logger.info("list call");
		ArrayList<MagazineDTO> list = service.list();		
		logger.info("list cnt : "+list.size());
		model.addAttribute("list", list);
		return "magazineList";
	}
	
	@RequestMapping(value="/magazineWrite.go")
	public String writeForm() {
		logger.info("write page 이동");
		return "magazineWriteForm";
	}
	
	
	@RequestMapping(value="/magazineWrite.do", method = RequestMethod.POST)
	public String write(MultipartFile photo, 
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return service.write(photo, params);
	}
	
	
	@RequestMapping(value="/magazineDetail.do")
	public String detail(HttpSession session, Model model, @RequestParam int board_id) {
		logger.info("magazineDetail : "+board_id);
		String page = "redirect:/magazine.do";		
		MagazineDTO dto = service.detail(board_id,"detail");
		if(dto != null) {
			page = "magazineDetail";
			model.addAttribute("dto", dto.getBoard_id());
		}				
		return page;
	}
	
	@RequestMapping(value="/magazineDelete.do")
	public String delete(@RequestParam String board_id) {
		service.delete(board_id);
		return "redirect:/magazine";
	}
	
}
