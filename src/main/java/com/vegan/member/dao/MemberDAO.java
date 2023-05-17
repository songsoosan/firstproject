package com.vegan.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.member.dto.MemberDTO;
import com.vegan.recipe.dto.RecipeDTO;
public interface MemberDAO {

	int overlayid(String user_id);

	int join(HashMap<String, String> params);

	String login(String id, String pw);

	void creatProfile(String user_id);

	MemberDTO getUserInfo(HashMap<String, String> params);
	
	MemberDTO getUserInfoPW(HashMap<String, String> params);

	int adminChk(String loginId);

	ArrayList<RecipeDTO> listPhoto();

	ArrayList<RecipeDTO> rlist();

	ArrayList<ClassesDTO> clist();


}
