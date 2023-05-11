package com.vegan.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.mypage.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO profile(String id);

	MypageDTO profileDetail(String id);

	int update(HashMap<String, String> params);

	int pwChk(String id, String pw);

	int del(String idx);

	int proUpdate(String loginId, String introduction);

	int profilePhoto(String oriFileName, String newFileName, String loginId);

	int changePW(String loginId, String newPW);

	ArrayList<ClassesDTO> mclist(String loginId);

	

	

	

}
