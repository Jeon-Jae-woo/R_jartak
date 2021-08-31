package com.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.member.biz.MemberBiz;


@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz biz; 
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
		
		return "main";
	}

	
	@RequestMapping("/mypage.do")
	public String mypage(Model model,String email) {
		
		model.addAttribute("dto",biz.selectOne(email));
		return "mypage_personal_information";
	}
	


	
	
	

}
