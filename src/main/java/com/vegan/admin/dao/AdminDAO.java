package com.vegan.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.admin.dto.AdminDTO;
import com.vegan.member.dto.MemberDTO;

public interface AdminDAO {



	ArrayList<AdminDTO> userList();
	
	ArrayList<AdminDTO> reportList();

	void adminCommit(String user_id);

	void adminCommit2(String user_id);


}
