package com.vegan.member.controller;

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

import com.vegan.member.service.MemberService;

@Controller
public class MemberController {

	 Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 @Autowired MemberService service;
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) {
			return "login";
	}
	@RequestMapping(value = "/main.go", method = RequestMethod.GET)
	public String main(Model model) {
			return "main";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login( Model model, @RequestParam String id,@RequestParam String pw, HttpSession session) {
		String page = "login";
		
		logger.info("id :{}/pw:{}",id,pw);
		String loginId = service.login(id,pw);
		logger.info("loginId:"+loginId);
		
		if (loginId != null) {
			page = "main";
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
			
			page = "login";
			model.addAttribute("msg","로그아웃 되었습니다.");
		}else {
			page = "main";
			model.addAttribute("msg","다시 시도해주세요!");	
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

	

	
}
