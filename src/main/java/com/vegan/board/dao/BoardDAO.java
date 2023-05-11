package com.vegan.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.vegan.board.dto.BoardDTO;

public interface BoardDAO {
   
   int totalCount(@Param("searchText")String searchText);
   
   ArrayList<BoardDTO> list(@Param("cnt")int cnt, @Param("offset")int offset, @Param("searchText")String searchText);

   int write(BoardDTO dto);

   void upHit(String board_id);

   BoardDTO detail(String board_id);

   void fileWrite(@Param("cat_id")String cat_id, @Param("board_id")int board_id, @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);

   

   

}