package com.vegan.classes.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.classes.dao.ClassesDAO;
import com.vegan.classes.dto.ClassesDTO;

@Service
public class ClassesService {
	
	@Autowired ClassesDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public String write(HashMap<String, String> params) {
		ClassesDTO dto = new ClassesDTO();
		dto.setUser_id(params.get("user_id"));
		dto.setCl_subject(params.get("cl_subject"));
		dto.setCl_period(params.get("cl_period"));
		dto.setCl_deadlinePeriod(params.get("cl_deadlinePeriod"));
		dto.setCl_deadline(params.get("cl_deadline"));
		dto.setCl_teacher(params.get("cl_teacher"));
		dto.setCl_date(params.get("cl_date"));
		dto.setCl_ing_chk(Boolean.valueOf(params.get("cl_ing_chk")));
		dto.setPostcode(params.get("postcode"));
		dto.setAddress(params.get("address"));
		dto.setDetailAddress(params.get("detailAddress"));
		dto.setExtraAddress(params.get("extraAddress"));
		dto.setCl_content(params.get("cl_content"));
	
		int row = dao.write(dto);		
		logger.info("update row : "+row);
		String page = "redirect:/classList.go";
		
		return page;
	}

	public ArrayList<ClassesDTO> list() {
		
		return dao.list();
	}

	public ClassesDTO detail(String cl_id) {
		
		return dao.detail(cl_id);
	}

	public String appWrite(String cl_id) {
		
		return dao.appWrite(cl_id);
	}

	public ClassesDTO user(String loginId) {
		
		return dao.user(loginId);
	}

	public int classApp(ClassesDTO dto) {
		
	
		
		return dao.classApp(dto);
	}

	public ArrayList<ClassesDTO> appList(String cl_id) {
		
		
		return dao.appList(cl_id);
	}

	public String update(HashMap<String, String> params) {
		
		int cl_id = Integer.parseInt(params.get("cl_id"));		
		int row = dao.update(params);
		
		String page = row>0 ? "redirect:/class.detail.do?cl_id="+cl_id : "redirect:/class.go";
		logger.info("update => "+page);
		
		return page;
	}

	public byte adminChk(String loginId) {
		
		return dao.adminChk(loginId);
	}

}
