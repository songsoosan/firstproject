package com.vegan.classes.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.magazine.dto.MagazineDTO;
import com.vegan.mypage.dto.MypageDTO;

public interface ClassesDAO {

   ArrayList<ClassesDTO> list();
   
   int write(ClassesDTO dto);
   
   ClassesDTO detail(String cl_id);
   
   String appWrite(String cl_id);
   
   ClassesDTO appWrite2();
   
	String appWrite4(String string);
	
	int classApp(ClassesDTO dto);
	
   ArrayList<ClassesDTO> appList(String cl_id);
   
   int update(HashMap<String, String> params);
   
	byte adminChk(String loginId);
	
   ClassesDTO user(String loginId);
   
   void fileWrite(int idx, String ori_photo_name, String photo_name);
   
	 MypageDTO profile2(String user_id);
	 
	int reviewWrite(String cl_id, String user_id, String review_content);
	
	ArrayList<ClassesDTO> reviewList(String cl_id);

	String getCl_Part_Id(HashMap<String, Object> params);

	int reviewInsert(HashMap<String, Object> params);


	int reviewDel(String review_id, String cl_id, String loginId);

	void cl_status(int cl_id);

	ClassesDTO cnt(int cl_id); 


   

}