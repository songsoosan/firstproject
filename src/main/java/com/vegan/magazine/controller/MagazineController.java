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
   public String main(Model model, HttpSession session) {
	   String page = "magazineList";

	   if(session.getAttribute("loginId") != null) {
		   page = "magazineList";
		   String loginId = String.valueOf(session.getAttribute("loginId"));
		   int admin = (int)service.adminChk(loginId);
		   logger.info("admin" + admin);
		   if(admin == 1) {
			   model.addAttribute("adminChk", admin);
		   }
	   }
      return page;
   }
   
   @RequestMapping(value="/magazine.ajax", method = RequestMethod.POST)
   @ResponseBody
   public HashMap<String, Object>list(
         @RequestParam String page,   @RequestParam String cnt){
      return service.list(Integer.parseInt(page), Integer.parseInt(cnt));
   }
   
   @RequestMapping(value="/magazineWrite.go")
   public String writeForm() {
	   
	   return "magazineWriteForm";
   }
   
   
   @RequestMapping(value="/magazinewrite.do", method = RequestMethod.POST)
   public String write(HttpSession session ,MultipartFile photo, MultipartFile[] uploadphoto, 
         @RequestParam HashMap<String, String> params) {
		
		//String loginId = String.valueOf(session.getAttribute("loginId"));
		//logger.info("loginid : "+loginId);
		 
	   //params.put("user_id", loginId);
       logger.info("params : "+params);
       //logger.info("cat_id : "+ cat_id);
       return service.magazinewrite(photo, params);
   }
   
   
    @RequestMapping(value="/magazineDetail.do", method = RequestMethod.GET)
      public String detail(Model model, HttpSession session, @RequestParam String board_id) {
    	String page = "magazineDetail";
         logger.info("magazineDetail : "+board_id);
      
         //String page = "redirect:/magazine.do";      
         MagazineDTO dto = service.detail(board_id,"detail");
         model.addAttribute("dto", dto);
         
         ArrayList<MagazineDTO> magacommentlist = service.magacommentlist2(board_id);
         model.addAttribute("magacommentlist", magacommentlist);
         
         logger.info("magacommentlist : "+magacommentlist);
         
         logger.info("comment list cnt : "+magacommentlist.size());
         
         // 디테일에 세션을 추가해야 관리자 로그인 아이디가 세션에 저장이 되서 로그인 했을경우 수정삭제 버튼 뜨고 일반회원일경우 안뜸
         if(session.getAttribute("loginId") != null) {
        	 page = "magazineDetail";
        	 String loginId = String.valueOf(session.getAttribute("loginId"));
        	 int admin = (int)service.adminChk(loginId);
        	 logger.info("admin" + admin);
        	 if(admin == 1) {
        		 model.addAttribute("adminChk", admin);
        	 }
         }
         
         return page;
      }

   
   @RequestMapping(value="/commentWrite.do")
      public String commentdetail(
    		  RedirectAttributes redirectAttributes, Model model, @RequestParam String board_id,@RequestParam String comment_content, HttpSession session) {
         logger.info("board_id param : "+ board_id);
         String page = "";
         String loginId = String.valueOf(session.getAttribute("loginId"));

         
         int commwrite = service.commwrite(board_id, comment_content,loginId);
         if (commwrite == 1) {
        	 page = "redirect:/magazineDetail.do?board_id="+board_id;
        	 //session.setAttribute("commwrite", commwrite);
         }
         
         	if(session.getAttribute("loginId") != null) {
         	 page = "redirect:/magazineDetail.do?board_id="+board_id;
         	 String loginId1 = String.valueOf(session.getAttribute("loginId"));
         	 int admin = (int)service.adminChk(loginId1);
         	 logger.info("admin" + admin);
         	 if(admin == 1 || admin == 0) {
         		 model.addAttribute("adminChk", admin);
         	 }
         	 
         	}
          
         
         return page;
      }
      
   @RequestMapping(value="/commentupdate.go")
   public String commupdateForm(RedirectAttributes redirectAttributes,Model model,@RequestParam String board_id, @RequestParam String comment_id , @RequestParam String comment_content, HttpSession session) {
      logger.info("magazine comment UpdateForm Call");
      
      String page = "magazineCommupdateForm";    
      logger.info("board_id param : "+ board_id);
      logger.info("comment_id param : "+ comment_id);
      logger.info("comment_content param : "+ comment_content);
      
      MagazineDTO dto = service.detail(board_id,"detail");  
      model.addAttribute("dto", dto);
      
      ArrayList<MagazineDTO> magacommentlist2 = service.magacommentlist2(board_id);
      model.addAttribute("magacommentlist", magacommentlist2);
      
      MagazineDTO magacommentlist = service.magacommentlist(board_id, comment_id, comment_content);
      model.addAttribute("magacommentlist2",magacommentlist);
      
      
      
      if(session.getAttribute("loginId") != null) {
     	 page = "magazineCommupdateForm";
     	 String loginId = String.valueOf(session.getAttribute("loginId"));
     	 int admin = (int)service.adminChk(loginId);
     	 logger.info("admin" + admin);
     	 if(admin == 1) {
     		 model.addAttribute("adminChk", admin);
     	 }
      }

      
      return page;
   }
   

   
   @RequestMapping(value="/commentupdate.do")
      public String commentupdate(HttpSession session, @RequestParam String board_id, @RequestParam String comment_id, @RequestParam String comment_content) {
         String page = "";
         String loginId = String.valueOf(session.getAttribute("loginId"));
               
         logger.info("comment Update Call");
         logger.info("comment_id Num :"+ comment_id);
         logger.info("comment_content :"+ comment_content);
         int row = service.commupdate(comment_id, comment_content, loginId);
         
         
         if (row != 1) {
            page = "redirect:/magazineDetail.do?board_id="+board_id;
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
      int raw = service.commdelete(board_id,comment_id,loginId);
      logger.info("delete comm data : "+raw);
      if (raw != 1) {
    	  page = "redirect:/magazineDetail.do?board_id="+board_id;
      }else {
    	  page = "redirect:/magazineDetail.do?board_id="+board_id;
      }
      return page;
   }
   
   
   
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
