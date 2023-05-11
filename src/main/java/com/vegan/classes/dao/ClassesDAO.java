package com.vegan.classes.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.classes.dto.ClassesDTO;
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

   

}