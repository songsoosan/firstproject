package com.vegan.classes.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.classes.dto.ClassesDTO;

public interface ClassesDAO {

	ArrayList<ClassesDTO> list();

	int write(ClassesDTO dto);

	ClassesDTO detail(String cl_id);

	String appWrite(String cl_id);

	ClassesDTO appWrite2();


	String appWrite4(String string);
	
	int appWrite5(ClassesDTO dto);

	ArrayList<ClassesDTO> appList(String cl_id);

	int update(HashMap<String, String> params);

	

}
