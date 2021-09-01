package com.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.biz.MemberBiz;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

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
	
	
	
	

	@RequestMapping("/mypage.do")
	public String mypage(Model model,String email) {
		
		model.addAttribute("dto",memberbiz.selectOne(email));
		return "mypage_personal_information";
	}
	
	@RequestMapping("/mypage_quit.do")
	public String mypage_quit() {
		
		return "mypage_personal_quit";
	}
	
	@RequestMapping("/mypage_msg_receive.do")
	public String msg_receive() {
		return "mypage_message_receive";
	}
	
	@RequestMapping("/mypage_msg_send.do")
	public String msg_send() {
		return "mypage_message_send";
	}
	
	

	@RequestMapping("/mypage_interest.do")
	public String mypage_interest() {
		
		return "mypage_interest";
		
	}
	
	@RequestMapping("/mypage_bankAcc.do")
	public String mypage_bankAcc() {
		
		return "mypage_bankAccount";
		
	}
	
	@RequestMapping("/mypage_buy.do")
	public String mypage_buy(String money) {
		if(money.equals("end")) {
			return "mypage_buy_end";
		}else if(money.equals("failure")) {
			return "mypage_buy_failure";
		}else if(money.equals("ing")) {
			return "mypage_buy_ing";
		}else{
			return "mypage_buy_trading";
		}
	}
	
	@RequestMapping("/mypage_sale.do")
	public String mypage_sale(String sale) {
		if(sale.equals("end")) {
			return "mypage_sale_end";
		}else if(sale.equals("failure")) {
			return "mypage_sale_failure";
		}else if(sale.equals("ing")) {
			return "mypage_sale_ing";
		}else{
			return "mypage_sale_trading";
		}
	}
	
	@RequestMapping("/mypage_emoney.do")
	public String mypage_emoney(String emoney) {
		if(emoney=="main") {
			return "mypage_emoney_main";
		}else if(emoney=="charge") {
			return "mypage_emoney_charge";
		}else {
			return "mypage_emoney_withdrawal";
		}
	}
	
	@RequestMapping("/mypage_grade.do")
	public String mypage_grade(String grade,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		MemberDto dto = memberbiz.selectOne(email);
		
		int rank_no = dto.getRank_no();
		
		MemberRankDto rankDto = memberbiz.rank(rank_no);
		
		String rank = (String)rankDto.getRank_name();
		
		System.out.println(rank);
		
		model.addAttribute("rankDto", rankDto);
		model.addAttribute("dto", dto);
		
		return "mypage_grade";
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
