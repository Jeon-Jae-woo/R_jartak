package com.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//로그인 폼 전환
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("LOGIN FORM");
		return "login";
	}
	
	//회원가입 폼 전환
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		logger.info("JOIN FORM");
		return "join";
	}
	
	
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("MAIN CONTROLLER");
		
		return "main3";
	}
	
	@RequestMapping("/main2.do")
	   public String main2() {
	      logger.info("MAIN CONTROLLER");
	      
	      return "main2";
	   }
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		
		return "mypage_personal_quit";
	}
	
	

}
