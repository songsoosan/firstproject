package com.vegan.letter.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.letter.dto.LetterDTO;

public interface LetterDAO {

	/* ArrayList<LetterDTO> list(String loginId); */
	
	int letterSend(HashMap<String, String> params);

	HashMap<String, Object> detail(String detailId);

	ArrayList<LetterDTO> recieveList(String loginId, int cnt, int offset);

	ArrayList<LetterDTO> sendList(String loginId, int cnt, int offset);

	int delete(String id);

	void read(String detailId, String loginId);

	int totalCount();
}
