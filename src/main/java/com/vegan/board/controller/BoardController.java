package com.vegan.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.board.dto.BoardDTO;
import com.vegan.board.service.BoardService;


/**
 *  공지사항
 */
@Controller
public class BoardController {

   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired BoardService service;
   
   
   /**
    * 공지사항 리스트
    * @param
    * @return noticeList Page
    */
   @RequestMapping(value = {"/board.go","/boardList.do"}, method = {RequestMethod.POST, RequestMethod.GET})
   public String main( ) {
      
      return "noticeList";
   }
   
   /**
    * 공지사항 리스트 조회
    * @param String page
    * @param String cnt
    * @param String searchText
    * @return HashMap list
    */
   @RequestMapping(value="/noticeList.ajax", method = {RequestMethod.POST, RequestMethod.GET})
   @ResponseBody
   public HashMap<String, Object>list(
         @RequestParam String page,
         @RequestParam String cnt,
         @RequestParam String searchText,
         @RequestParam String loginId
         ) {
      return service.list(Integer.parseInt(page),Integer.parseInt(cnt),searchText,loginId);
   }
   
   /**
    * 공지사항 작성
    * @param MultipartFile board_photo
    * @param HashMap params
    * @return boardDetail
    */
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
      List<BoardDTO> replyList = service.noticecommentList(board_id);
      if(replyList != null) {
         model.addAttribute("commentList",replyList);
      }
      return page;
   }
   
   @RequestMapping(value="/boardUpdate.go")
   public String boardUpdate(Model model,@RequestParam String board_id) {
      logger.info("detail : "+board_id);
      String page = "redirect:/noticeList";
      
      BoardDTO dto = service.detail(board_id,"update");
      if(dto != null) {
         page="boardUpdate";
         model.addAttribute("dto",dto);
      }
      return page;
   }
   
   @RequestMapping(value="/boardUpdate.do", method = RequestMethod.POST)
   public String boardUpdateDo(MultipartFile photo, @RequestParam HashMap<String, String> params) {
      logger.info("params : " +params);
      return service.update(photo, params);
   }
   
   @RequestMapping(value="/boardDelete.go", method = RequestMethod.GET)
   public String boardDelete(Model model, @RequestParam String board_id) {
      logger.info("detail : " + board_id);
      String page = "redirect:/boardList.do";
      
      service.delete(board_id);
      
      return page;
   }
   
   @RequestMapping(value="/hide.ajax")
   @ResponseBody
   public void hide(@RequestParam(value="hideList[]") List<String> hideList) {
      logger.info("hide~~");
      service.hide(hideList);
   }
   
   @RequestMapping(value= "noticecommentList.do", method = RequestMethod.POST)
   public String noticecommentList(@RequestParam String board_id, Model model) {
      
      logger.info(board_id);
      
      ArrayList<BoardDTO> commentList = new ArrayList<BoardDTO>();
      commentList = service.noticecommentList(board_id);
      model.addAttribute("commentList",commentList);
      logger.info("공지사항 코멘트 리스트 : "+commentList);
      
      return "redirect:/noticecommentList.do";
   }
      
   @RequestMapping(value = "noticecommentWrite.do", method = RequestMethod.POST)
   public String noticecommentWrite(@RequestParam HashMap<String, String> params) {

      logger.info("댓글 작성" + params);

      return service.noticecommentWrite(params);
   }
   
   @RequestMapping(value = "noticecommentDelete.do", method = RequestMethod.GET)
   public String noticecommentDelete(@RequestParam int comment_id, @RequestParam int board_id) {
      service.noticecommentDelete(comment_id);
      logger.info(String.valueOf(comment_id));
      return "redirect:/boardDetail.do?board_id="+board_id;
   }
   
   @RequestMapping(value="/commentUpdate.ajax")
   @ResponseBody
   public void commentUpdate( @RequestParam int board_id,
                   @RequestParam int comment_id,
                   @RequestParam String comment_content ) {
      logger.info("commentUpdate~~");
      service.noticecommentUpdate(board_id, comment_id, comment_content);
   }
   
   
   @RequestMapping(value = {"/freeList.go","/freeList.do"}, method = {RequestMethod.POST, RequestMethod.GET})
   public String freeboardGo( ) {
      
      return "freeList";
   }
   
   @RequestMapping(value="/freewrite.go")
   public String freewrite( ) {
      
      return "freewrite";
   }
   
   @RequestMapping(value= "/freewirte.do", method = RequestMethod.POST)
   public String freewirte(MultipartFile board_photo, @RequestParam HashMap<String, String> params) {
      
      logger.info("freeboardparams : " +params);
      return service.freewrite(board_photo, params);
   }
   
   @RequestMapping(value= "/freeDetail.do", method = RequestMethod.GET)
   public String freeDetail(Model model, @RequestParam String board_id) {
      
      
      return "freeList";
   }



}