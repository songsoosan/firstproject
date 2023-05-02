package com.vegan.magazine.dao;

import java.util.ArrayList;

import com.vegan.magazine.dto.MagazineDTO;

public interface MagazineDAO {
	
	ArrayList<MagazineDTO> list();

	int write(MagazineDTO dto);

	void fileWrite(int board_id, String ori_photo_name, String photo_name);

	void board_views(int board_id);

	MagazineDTO detail(int board_id);

	String findFile(String board_id);

	int delete(String board_id);

}
