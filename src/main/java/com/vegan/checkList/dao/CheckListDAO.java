package com.vegan.checkList.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.checkList.dto.CheckListDTO;

public interface CheckListDAO {

	ArrayList<CheckListDTO> list();

	int write(CheckListDTO dto);

	int update(HashMap<String, Object> params);

	// ArrayList<CheckListDTO> resultsave(HashMap<String, Object> params);

	ArrayList<CheckListDTO> result(HashMap<String, Object> params);

	void resultsave(HashMap<String, Object> params);
	
    CheckListDTO result(String user_id);


	

	

	

	


}
