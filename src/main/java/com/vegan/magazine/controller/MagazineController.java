package com.vegan.magazine.controller;

import java.util.ArrayList;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.vegan.magazine.dto.MagazineDTO;
import com.vegan.magazine.service.MagazineService;



@Controller(value = "magazineController")
public class MagazineController {

   
Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired MagazineService service;
   
   
   @RequestMapping(value="/magazine")
   public String main() {
      return "magazineList";
   }
   
   @RequestMapping(value="/magazine.ajax", method = RequestMethod.POST)
   @ResponseBody
   public HashMap<String, Object>list(
         @RequestParam String page,   @RequestParam String cnt){
      return service.list(Integer.parseInt(page), Integer.parseInt(cnt));
   }
   
   @RequestMapping(value="/magazineWrite.go")
   public String writeForm() {
      logger.info("write page 이동");
      return "magazineWriteForm";
   }
   
   
   @RequestMapping(value="/magazineWrite.do", method = RequestMethod.POST)
   public String write(MultipartFile photo, MultipartFile[] uploadphoto, 
         @RequestParam HashMap<String, String> params) {
      logger.info("params : "+params);
      return service.write(photo, params);
   }
   
   
    @RequestMapping(value="/magazineDetail.do", method = RequestMethod.GET)
      public String detail(Model model, @RequestParam String board_id, HttpSession session) {
         logger.info("magazineDetail : "+board_id);
         
        
         //String page = "redirect:/magazine.do";      
         MagazineDTO dto = service.detail(board_id,"detail");
         
         model.addAttribute("dto", dto);
         
         ArrayList<MagazineDTO> magacommentlist = service.magacommentlist2(board_id);
         
         model.addAttribute("magacommentlist", magacommentlist);
         
         logger.info("magacommentlist : "+magacommentlist);
         
         logger.info("comment list cnt : "+magacommentlist.size());
         
         /* 
         if(dto != null) {
            page = "magazineDetail";
            model.addAttribute("dto", dto);
         }
         */            
         return "magazineDetail";
      }

   
   @RequestMapping(value="/commentWrite.do")
      public String commentdetail(
            @RequestParam String board_id,@RequestParam String comment_content, HttpSession session) {
         logger.info("board_id param : "+ board_id);
         String page = "";
         String loginId = String.valueOf(session.getAttribute("loginId"));
         //logger.info("content param : "+ comment_content);
         int commwrite = service.commwrite(board_id, comment_content,loginId);
         if (commwrite == 1) {
         page = "redirect:/magazineDetail.do?board_id="+board_id;
         //session.setAttribute("commwrite", commwrite);
      }
         

         return page;
      }
      
   @RequestMapping(value="/commentupdate.go")
   public String commupdateForm(Model model,@RequestParam String board_id, @RequestParam String comment_id , @RequestParam String comment_content, HttpSession session) {
      logger.info("magazine comment UpdateForm Call");

      logger.info("board_id param : "+ board_id);
      logger.info("comment_id param : "+ comment_id);
      logger.info("comment_content param : "+ comment_content);
      
      
      MagazineDTO dto = service.detail(board_id,"detail");  
       model.addAttribute("dto", dto);
      
      
      ArrayList<MagazineDTO> magacommentlist2 = service.magacommentlist2(board_id);
      model.addAttribute("magacommentlist", magacommentlist2);
      
      MagazineDTO magacommentlist = service.magacommentlist(board_id, comment_id, comment_content);
      model.addAttribute("magacommentlist2",magacommentlist);
         
      
      return "magazineCommupdateForm";
   }
   

   
   @RequestMapping(value="/commentupdate.do")
      public String commentupdate(RedirectAttributes redirectAttributes, HttpSession session, @RequestParam String board_id, @RequestParam String comment_id, @RequestParam String comment_content) {
        String page = "";
        String loginId = String.valueOf(session.getAttribute("loginId"));
               
         logger.info("comment Update Call");
         logger.info("comment_id Num :"+ comment_id);
         logger.info("comment_content :"+ comment_content);
         int row = service.commupdate(comment_id, comment_content, loginId);
         
         
         if (row != 1) {
            page = "redirect:/magazineDetail.do?board_id="+board_id;
            redirectAttributes.addFlashAttribute("message", "작성자만 수정 가능합니다.");
         }else {
            page = "redirect:/magazineDetail.do?board_id="+board_id;
         }
         
         return page;
      }
   
      
   @RequestMapping(value="/commentdel.do")
   public String commdelete(@RequestParam String board_id ,@RequestParam String comment_id, HttpSession session) {
      
      logger.info("board_id params : "+board_id);
      logger.info("comment_id params : "+comment_id);

      String page = "";
      String loginId = String.valueOf(session.getAttribute("loginId"));
      service.commdelete(board_id,comment_id,loginId);
      
      page = "redirect:/magazineDetail.do?board_id="+board_id;
      return page;
   }
   
   
   
   /*
   @RequestMapping(value="/commentupdate.do")
   public String commupdateForm(@RequestParam String board_id,@RequestParam String comment_id,@RequestParam String comment_content, HttpSession session) {
      logger.info("board_id param : "+ board_id);
      
      logger.info("comment_id param : "+ comment_id);
      
         String page = "";
         String loginId = String.valueOf(session.getAttribute("loginId"));
         //logger.info("content param : "+ comment_content);
         int commupdate = service.commupdate(board_id, comment_id, comment_content,loginId);
         if (commupdate == 1) {
         page = "redirect:/magazineDetail.do?board_id="+board_id;
       }
      return page;
   }
   */
   
   @RequestMapping(value="/magazineDelete.do")
   public String delete(@RequestParam String board_id) {
      service.delete(board_id);
      return "redirect:/magazine";
   }
   
   @RequestMapping(value="/magazineUpdate.go")
   public String updateForm(Model model, @RequestParam String board_id) {
      logger.info("detail : "+board_id);
      String page = "redirect:/magazine.do";      
      MagazineDTO dto = service.detail(board_id,"detail");
      if(dto != null) {
         page = "magazineUpdateForm";
         model.addAttribute("dto", dto);
      }            
      return page;
   }
   
   @RequestMapping(value="/magazineUpdate.do", method = RequestMethod.POST)
   public String update(MultipartFile photo, 
         @RequestParam HashMap<String, String> params) {
      logger.info("params : "+params);
      return service.update(photo, params);
   }
   
   
   
   /*
   @RequestMapping(value = "/magazine")
   public String list(Model model) {
      logger.info("list call");
      ArrayList<MagazineDTO> list = service.list();      
      logger.info("list cnt : "+list.size());
      model.addAttribute("list", list);
      return "magazineList";
   }
    */
   
   
   
}
