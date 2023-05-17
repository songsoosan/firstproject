package com.vegan.magazine.dao;

import java.util.ArrayList;


import java.util.HashMap;

import org.apache.ibatis.annotations.Param;


import com.vegan.magazine.dto.MagazineDTO;

public interface MagazineDAO {
   
   //ArrayList<MagazineDTO> list();

   //int write(MagazineDTO dto);

   MagazineDTO detail(String board_id);

   String findFile(String board_id);

   int delete(String board_id);

   void fileWrite(@Param("cat_id")String cat_id, @Param("board_id") int board_id,  @Param("ori_photo_name")String ori_photo_name, @Param("photo_name")String photo_name);

   int update(HashMap<String, String> params);

   void up_views(String board_id);
   
   
   

   int totalCount();

   ArrayList<MagazineDTO> list(int cnt, int offset);

   ArrayList<MagazineDTO> magacommentlist(String board_id);






    //void commwrite(MagazineDTO dto, String board_id, HashMap<String, String> params);

    int commwrite(String board_id, String comment_content, String loginId);


   int commdelete(String board_id, String comment_id, String loginId);


   MagazineDTO magacommentlist2(String board_id, String comment_id, String comment_content);

   //int commupdate(String board_id, String comment_id, String comment_content);

   //int commupdate(HashMap<String, String> params);

   int commupdate(String comment_id, String comment_content, String loginId);

   byte adminChk(String loginId);



int magazinewrite(MagazineDTO dtoo);

int photoDelete(String photo_name);






   

   



   

   

}