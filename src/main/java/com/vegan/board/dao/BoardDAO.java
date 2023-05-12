package com.vegan.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vegan.board.dto.BoardDTO;

public interface BoardDAO {
   
   int totalCount(@Param("searchText")String searchText, @Param("loginId") String loginId);
   
   ArrayList<BoardDTO> list(@Param("cnt")int cnt, @Param("offset")int offset, @Param("searchText")String searchText, @Param("loginId") String loginId);

   int write(BoardDTO dto);

   void upHit(String board_id);

   BoardDTO detail(String board_id);

   void fileWrite(@Param("cat_id")String cat_id, @Param("board_id")int board_id, @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);
   
   void fileUpdate(@Param("board_id")int board_id, @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);

   int update(HashMap<String, String> params);

   void delete(@Param("board_id") String board_id);
   
   void hide(@Param("hideList") List<String> hideList);
   
   int noticecommentWrite(BoardDTO dto);
   
   ArrayList<BoardDTO>noticecommentList(@Param("board_id") String board_id);

   void noticecommentDelete(@Param("comment_id")int comment_id);
   
   void noticecommentUpdate(@Param("board_id")int board_id, @Param("comment_id")int comment_id, @Param("comment_content")String comment_content);
   
   int freewrite(BoardDTO dto);

   BoardDTO freedetail(String fboard_id);
   
   int freetotalCount(@Param("searchText")String searchText, @Param("loginId") String loginId);
   
   ArrayList<BoardDTO> freelist(@Param("cnt")int cnt, @Param("offset")int offset, @Param("searchText")String searchText, @Param("loginId") String loginId);
   
   void freeupHit(String board_id);
   
   int freeupdate(HashMap<String, String> params);
   
   void freedelete(@Param("fboard_id") String fboard_id);
   
   void freefileWrite(@Param("cat_id")String cat_id, @Param("fboard_id")int fboard_id, @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);
   
   void freefileUpdate(@Param("fboard_id")int fboard_id, @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);

   int freecommentWrite(BoardDTO dto);
   
   ArrayList<BoardDTO>freecommentList(@Param("fboard_id") String fboard_id);
   
}