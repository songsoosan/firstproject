package com.vegan.board.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.board.dto.BoardDTO;
import com.vegan.board.service.BoardService;


@Controller
public class BoardController {

   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired BoardService service;
   
   @RequestMapping(value = {"/board.go","/boardList.do"}, method = {RequestMethod.POST, RequestMethod.GET})
   public String main( ) {
      
      return "noticeList";
   }
   
   @RequestMapping(value="/noticeList.ajax", method = {RequestMethod.POST, RequestMethod.GET})
   @ResponseBody
   public HashMap<String, Object>list(
         @RequestParam String page,
         @RequestParam String cnt,
         @RequestParam String searchText
         ) {
      return service.list(Integer.parseInt(page),Integer.parseInt(cnt),searchText);
   }
   
   
   @RequestMapping(value= "/wirte.do", method = RequestMethod.POST)
   public String write(MultipartFile board_photo, @RequestParam HashMap<String, String> params) {
      
      logger.info("params : " +params);
      return service.write(board_photo, params);
   }
   
   @RequestMapping(value="/boardDetail.do")
   public String boardDetail(Model model, @RequestParam String board_id) {
      logger.info("detail : "+board_id);
      String page = "redirect:/noticeList";
      
      BoardDTO dto = service.detail(board_id,"detail");
      if(dto != null) {
         page="boardDetail";
         model.addAttribute("dto",dto);
      }
      return page;
   }
   
}