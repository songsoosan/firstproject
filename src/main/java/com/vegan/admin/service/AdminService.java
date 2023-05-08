package com.vegan.admin.service;

import java.util.ArrayList;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.dao.AdminDAO;
import com.vegan.admin.dto.AdminDTO;


@Service
public class AdminService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminDAO dao;

	public ArrayList<AdminDTO> list() {
		
		return dao.list();
	}


}
