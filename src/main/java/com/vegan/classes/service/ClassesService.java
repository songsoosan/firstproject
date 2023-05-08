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
	
	/*
	 * Logger logger = LoggerFactory.getLogger(getClass());
	 * 
	 * public String write(HashMap<String, String> params) { ClassesDTO dto = new
	 * ClassesDTO(); dto.setUser_id(params.get("user_id"));
	 * dto.setCl_subject(params.get("cl_subject"));
	 * dto.setCl_period(params.get("cl_period"));
	 * dto.setCl_deadline(params.get("cl_deadline"));
	 * dto.setCl_teacher(params.get("cl_teacher"));
	 * dto.setCl_date(params.get("cl_date"));
	 * dto.setCl_ing_chk(Boolean.valueOf(params.get("cl_ing_chk")));
	 * dto.setCl_adress(params.get("cl_adress"));
	 * dto.setCl_content(params.get("cl_content"));
	 * 
	 * int row = dao.write(dto); logger.info("update row : "+row); String page =
	 * "redirect:/class.go";
	 * 
	 * return page; }
	 * 
	 * public ArrayList<ClassesDTO> list() {
	 * 
	 * return dao.list(); }
	 * 
	 * public ClassesDTO detail(String cl_id) {
	 * 
	 * return dao.detail(cl_id); }
	 * 
	 * public String appWrite(String cl_id) {
	 * 
	 * return dao.appWrite(cl_id); }
	 * 
	 * public ClassesDTO appWrite2() {
	 * 
	 * return dao.appWrite2(); }
	 * 
	 * public String appWrite3(HashMap<String, String> params) { ClassesDTO dto =
	 * new ClassesDTO();
	 * 
	 * Random random = new Random(); int number = random.nextInt(100000000); // 8자리의
	 * 숫자 생성 int cl_part_id = Math.abs(number); // 생성된 숫자 출력
	 * logger.info(Long.toString(cl_part_id));
	 * 
	 * 
	 * dto.setCl_part_id(cl_part_id);
	 * dto.setCl_id(Integer.parseInt(params.get("cl_id")));
	 * dto.setUser_id(params.get("user_id"));
	 * dto.setUser_adress(params.get("user_adress"));
	 * dto.setUser_name(params.get("user_name"));
	 * dto.setUser_phone(params.get("user_phone"));
	 * 
	 * int row = dao.appWrite5(dto); logger.info("update row : "+row); String page =
	 * "redirect:/class.go";
	 * 
	 * return page; }
	 * 
	 * public ArrayList<ClassesDTO> appList(String cl_id) {
	 * 
	 * 
	 * return dao.appList(cl_id); }
	 * 
	 * public String update(HashMap<String, String> params) {
	 * 
	 * int cl_id = Integer.parseInt(params.get("cl_id")); int row =
	 * dao.update(params);
	 * 
	 * String page = row>0 ? "redirect:/class.detail.do?cl_id="+cl_id :
	 * "redirect:/class.go"; logger.info("update => "+page);
	 * 
	 * return page; }
	 */
}
