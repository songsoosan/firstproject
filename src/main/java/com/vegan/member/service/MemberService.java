package com.vegan.member.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.member.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> overlayid(String user_id) {
			
			HashMap<String, Object> map = new HashMap<>();
			// 같은 아이디가 있는가? 있으면 1 없으면 0	
			map.put("overlayid", dao.overlayid(user_id));		
			return map;
		}
	
	public HashMap<String, Object> join(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", dao.join(params));		
		String user_id = params.get("user_id");
		dao.creatProfile(user_id);
		
		return map;
	}
	
	
		
		
		

	public String login(String id, String pw) {
		
		return dao.login(id, pw);
	}
}
