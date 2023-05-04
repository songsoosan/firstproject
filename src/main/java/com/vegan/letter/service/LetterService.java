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

	/*
	 * public ArrayList<LetterDTO> list(String loginId) { return dao.list(loginId);
	 * }
	 */
	public HashMap<String, Object> letterSend(HashMap<String, String> params) {
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("success", dao.letterSend(params));
	      return map;
	   }

	public HashMap<String, Object> detail(String detailId) {
		return dao.detail(detailId);
	}

	public ArrayList<LetterDTO> recieveList(String loginId) {
		// TODO Auto-generated method stub
		return dao.recieveList(loginId);
	}

	public ArrayList<LetterDTO> sendList(String loginId) {
		// TODO Auto-generated method stub
		return dao.sendList(loginId);
	}

	public HashMap<String, Object> delete(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = delList.size();
		int successCnt = 0;
		for (String id : delList) {
			successCnt += dao.delete(id);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}
	
}
