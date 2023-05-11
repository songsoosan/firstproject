package com.vegan.checkList.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.checkList.dto.CheckListDTO;

public interface CheckListDAO {

	ArrayList<CheckListDTO> list();

	int write(CheckListDTO dto);

	int update(HashMap<String, Object> params);

	// ArrayList<CheckListDTO> resultsave(HashMap<String, Object> params);
	void resultsave(HashMap<String, String> params);
	
	ArrayList<CheckListDTO> getresult(HashMap<String, String> params);

	boolean resultCheck(String user_id);

	void updateStep(CheckListDTO result);

	boolean admincheck(String user_id);

	int delete(int questionnumber);

	

	

	

	


}
