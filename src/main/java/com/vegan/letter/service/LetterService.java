package com.vegan.letter.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.letter.dao.LetterDAO;
import com.vegan.letter.dto.LetterDTO;

@Service
public class LetterService {
	@Autowired LetterDAO dao;

	public ArrayList<LetterDTO> list(String loginId) {
		return dao.list(loginId);
	}

	public HashMap<String, Object> letterSend(HashMap<String, String> params) {
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("success", dao.letterSend(params));
	      return map;
	   }
	
}
