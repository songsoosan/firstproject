package com.vegan.member.dao;

import java.util.HashMap;

import com.vegan.member.dto.MemberDTO;
public interface MemberDAO {

	int join(HashMap<String, String> params);

	String login(String id, String pw);

	void creatProfile(String id);

	
	
}
