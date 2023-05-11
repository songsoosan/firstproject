package com.vegan.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.board.dao.BoardDAO;
import com.vegan.board.dto.BoardDTO;

@Service
public class BoardService {
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired BoardDAO dao;
   
   public HashMap<String,Object> list(int page, int cnt, String searchText){
      logger.info(page+"페이지 보여줘");
      logger.info("한페이지에"+cnt+"개씩 보여줄거야");
      HashMap<String, Object> map = new HashMap<String, Object>(); 
         // 1page = offset : 0
         // 2page = offset : 5
         // 3page = offset : 10
         int offset = (page-1)*cnt;
         
         // 만들 수 있는 총 페이지 수 
         // 전체 게시물 / 페이지당 보여줄 수
         int total = dao.totalCount(searchText);
         int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
         logger.info("전체 게시물 수 : "+total);
         logger.info("총 페이지 수 : "+range);
         
         page = page > range ? range : page;
         
         map.put("currPage", page);
         map.put("pages", range);
               
         ArrayList<BoardDTO> list = dao.list(cnt, offset, searchText);
         map.put("list", list);
         return map;

      
   }

   public String write(MultipartFile board_photo, HashMap<String, String> params) {
      
      String page = "redirect:/boardList.do";
      
      //1. 게시글만 작성한 경우
      BoardDTO dto = new BoardDTO();
      dto.setCat_id("not");
      dto.setBoard_title(params.get("board_title")); //파라메터 DTO로 보내기
      dto.setUser_id(params.get("user_id"));
      dto.setBoard_content(params.get("board_content"));
      
      int row = dao.write(dto);
      logger.info("update row :" + row);
      
      int idx = dto.getBoard_id();
      String cat_id = dto.getCat_id();
      logger.info("방금 insert한 idx : "+idx);
      logger.info("방금 insert한 cat_id: "+cat_id);
      
      page = "redirect:/boardDetail.do?board_id="+idx;
      
      //2. 파일도 업로드 한 경우
      if(!board_photo.getOriginalFilename().equals("")) {
         logger.info("파일 업로드 작업");
         fileSave(cat_id,idx,board_photo);
      }
      return page;
   }

   private void fileSave(String cat_id, int board_id, MultipartFile file) {
      //1. 파일은 c:/img/upload/ 에 저장

      String ori_photo_name = file.getOriginalFilename();
      String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
      String photo_name=System.currentTimeMillis()+ext;
      logger.info(ori_photo_name+"=>"+photo_name);
      
      try {
         byte[] bytes = file.getBytes();
         Path path = Paths.get("C:/img/upload/"+photo_name);
         Files.write(path, bytes);
         logger.info(photo_name+"save OK");
         //DB에 저장 board_id 는 식별번호로 들어감
         dao.fileWrite(cat_id, board_id, ori_photo_name, photo_name);
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }

   
   public BoardDTO detail(String board_id, String flag) {
      if(flag.equals("detail")) {
         dao.upHit(board_id); //조회수 증가
      }
      return dao.detail(board_id);
   }
   
}