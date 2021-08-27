package com.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping("/test")
	public String test() {
		logger.info("TEST CONTROLLER");
		return "home";
	}
	
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("MAIN CONTROLLER");
		
		return "main";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		
		return "mypage_personal_quit";
	}
	
	
}
