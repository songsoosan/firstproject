package com.vegan.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.vegan.classes.dto.ClassesDTO;
import com.vegan.member.service.MemberService;
import com.vegan.recipe.dto.RecipeDTO;

@Controller
public class MemberController {

	 Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired MemberService service;
	
	@RequestMapping(value = {"/","/main.go"}, method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		if (session.getAttribute("msg") != null) {
			model.addAttribute("msg", session.getAttribute("msg"));
			session.removeAttribute("msg");
		}
		
		if (session.getAttribute("loginId") != null) {
	         String loginId = String.valueOf(session.getAttribute("loginId"));
	         int admin = (int) service.adminChk(loginId);
	         logger.info("admin" + admin);
	         if (admin == 1) {
	            model.addAttribute("adminChk", admin);
	         }
	      }
		//사진 부분
		ArrayList <RecipeDTO> recipelist = service.rlist();
		model.addAttribute("recipelist",recipelist);
		
		ArrayList <RecipeDTO> photos = service.listPhoto();
		Map<String, String> pho = new HashMap<>();
		 int x=0;
		for (RecipeDTO photo : photos) {

	    	String val = photo.getPhoto_name();
	    	 logger.info(val);
	    	pho.put("photo_name"+x, val);
	    	x++;
		}
		 model.addAttribute("photo", pho);
		 
		 ArrayList<ClassesDTO> classlist = service.clist();
			logger.info("list cnt : " + classlist.size());
			System.out.println("list cnt " + classlist.size());
			model.addAttribute("classlist", classlist);
		
		
		
			return "main";
	}
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginGo(Model model) {


			return "login";

	}
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String login( Model model, @RequestParam String id,@RequestParam String pw, HttpSession session) {
		String page = "login";
		
		logger.info("id :{}/pw:{}",id,pw);
		String loginId = service.login(id,pw);
		logger.info("loginId:"+loginId);
		
		if (loginId != null) {
			page = "redirect:/main.go";
			session.setAttribute("loginId", loginId);
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인 하세요");	
		}
		
		return page;

	}
	
	@RequestMapping(value = "/logout.do")
	public String login(HttpSession session,Model model) {
		String page = "";
		session.removeAttribute("loginId");
		if ((String) session.getAttribute("loginId") == null) {
			
			page = "redirect:/main.go";
			session.setAttribute("msg","로그아웃 되었습니다.");
		}else {
			page = "redirect:/main.go";
			session.setAttribute("msg","다시 시도해주세요!");	
		}
		
		return page;

	}
	 
	@RequestMapping(value="/join.go")
	   public String joinForm() {
	      return "joinForm";      
	   }
	   
	   @RequestMapping(value="/overlayid.ajax")
	   @ResponseBody
	   public HashMap<String, Object> overlay(@RequestParam String user_id){
		   logger.info("overlayid : "+user_id);				   
	      return service.overlayid(user_id);      
	   }
	   
	   @RequestMapping(value="/join.ajax")
	   @ResponseBody
	   public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
		   logger.info("params: {}"+params);
		return service.join(params);		   
	   }
	
	@RequestMapping(value = "/findID.go", method = RequestMethod.GET)
	public String findID(Model model) {
			return "findID";
	}

	@RequestMapping(value="/sendMail.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendMail(@RequestParam HashMap<String, String> params) {
		logger.info("params : " + params);
		return service.sendMail(params);
	}
	
	@RequestMapping(value = "/findPW.go", method = RequestMethod.GET)
	public String findPW(Model model) {
			return "findPW";
	}
	
	@RequestMapping(value="/sendPWMail.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendPWMail(@RequestParam HashMap<String, String> params) {
		logger.info("params : " + params);
		return service.sendPWMail(params);
	}

	
}
