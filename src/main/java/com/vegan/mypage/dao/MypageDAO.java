package com.vegan.mypage.dao;

import java.util.HashMap;

import com.vegan.mypage.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO profile();

	MypageDTO detail();

	int update(HashMap<String, String> params);

	

}
