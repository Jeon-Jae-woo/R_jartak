package com.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.biz.MemberBiz;
import com.member.dto.MemberDto;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz memberbiz;
	
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
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> login(HttpSession session, @RequestBody MemberDto reqMember) {
		logger.info("LOGIN CONTROLLER");

		MemberDto loginMember = memberbiz.login(reqMember);
		
		Map<String,Object> data = new HashMap<String, Object>();
		
		if(loginMember==null) {
			data.put("status_code", HttpStatus.UNAUTHORIZED); // 401
			return data;
		}else {
			session.setAttribute("email", loginMember.getEmail());
			session.setAttribute("nickname", loginMember.getNickname());
			session.setAttribute("level_no", loginMember.getLevel_no());
			data.put("status_code", HttpStatus.OK); // 200
			return data;
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("LOGOUT");
		session.invalidate();
		return "redirect:main.do";
	}
	
	//로그인 체크(인터셉터 활용)
	@RequestMapping(value="/loginCheck", method=RequestMethod.GET)
	public String loginCheck(Model model) {
		model.addAttribute("msg","로그인 후 이용해주세요");
		model.addAttribute("url","loginForm");
		return "alert";
	}
	
	
	
	@RequestMapping("/mypage.do")
	public String mypage(Model model,String email) {
		
		model.addAttribute("dto",memberbiz.selectOne(email));
		return "mypage_personal_information";
	}
	

}
