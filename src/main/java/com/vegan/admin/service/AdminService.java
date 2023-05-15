package com.vegan.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.vegan.admin.dao.AdminDAO;
import com.vegan.admin.dto.AdminDTO;
import com.vegan.board.dto.BoardDTO;
import com.vegan.member.dto.MemberDTO;


@Service
public class AdminService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminDAO dao;

	
	public ArrayList<AdminDTO> userList() {
		
		return dao.userList();
	}



	public ArrayList<AdminDTO> reportList() {

		return dao.reportList();
	}



	public void adminCommit(String user_id) {
		
		dao.adminCommit(user_id);
	}



	public void adminCommit2(String user_id) {
		// TODO Auto-generated method stub
		dao.adminCommit2(user_id);
	}
	
}
	
