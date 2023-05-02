package com.vegan.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.dao.AdminDAO;
import com.vegan.admin.dto.AdminDTO;



@Service
public class AdminService {
	
	@Autowired AdminDAO dao;


}
