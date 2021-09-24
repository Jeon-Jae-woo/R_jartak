package com;

import java.util.HashMap;
import java.util.List;
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

import com.auction.biz.AuctionBiz;
import com.auction.dto.AuctionDto;
import com.member.biz.MemberBiz;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberBiz memberbiz;
	
	@Autowired
	private AuctionBiz auctionbiz;
	
	@RequestMapping("/main3.do")
	public String main3(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String nickname = (String)session.getAttribute("nickname");
		
		/*
		 * List<AuctionDto> list = auctionbiz.bookmark(nickname);
		 * 
		 * System.out.println(list);
		 */
		
		MemberDto dto = memberbiz.selectOne(email);
		
		int rank_no = dto.getRank_no();
		
		MemberRankDto rankDto = memberbiz.rank(rank_no);
		
		String rank = (String)rankDto.getRank_name();
		
		System.out.println(rank);
		
		model.addAttribute("rankDto", rankDto);
		model.addAttribute("dto", dto);
		
		return "main3";
	}
	
	@RequestMapping("/main2.do")
   	public String main2() {
      logger.info("MAIN CONTROLLER");
  
      return "main2";
	}
	
	
	@RequestMapping(value="/afterlogin.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> afterlogin(HttpSession session, @RequestBody MemberDto reqMember) {
		logger.info("LOGIN CONTROLLER");

		MemberDto loginMember = memberbiz.login(reqMember);
		Map<String,Object> data = new HashMap<String, Object>();
		if(loginMember==null) {
			data.put("status_code", HttpStatus.UNAUTHORIZED); 
			return data;
		}else {
			session.setAttribute("email", loginMember.getEmail());
			session.setAttribute("nickname", loginMember.getNickname());
			session.setAttribute("level_no", loginMember.getLevel_no());
			data.put("status_code", HttpStatus.OK); 
			return data;
			
			
		}
	}
	
	
	
}
