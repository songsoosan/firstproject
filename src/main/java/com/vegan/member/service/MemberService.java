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
	
	public String join(HashMap<String, String> params) {
		String id = params.get("user_id");
		String msg = "회원 가입에 실패 했습니다.";
		if(dao.join(params) == 1){
			msg = "회원가입에 성공 했습니다.";
			dao.creatProfile(id);
		}
		
		
		return msg;
	}

	public String login(String id, String pw) {
		
		return dao.login(id, pw);
	}
}
