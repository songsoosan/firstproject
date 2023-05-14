package com.vegan.event.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.vegan.event.dto.EventDTO;

public interface EventDAO {
	

	int eventwrite(EventDTO dto);

	EventDTO detail(String event_id);

	String findFile(String event_id);

	int delete(String event_id);

	void fileWrite(@Param("cat_id")String cat_id, @Param("event_id") int board_id,  @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);

	int update(HashMap<String, String> params);

	void up_views(String event_id);
	
	
	

	int totalCount();

	ArrayList<EventDTO> list(int cnt, int offset);

	byte adminChk(String loginId);

	int photoDelete(String photo_name);





}
