package com.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.biz.AdminMemberBiz;
import com.member.dto.MemberDto;
import com.util.pagingDto;

@Controller
public class AdminMemberController {
	Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private AdminMemberBiz adminbiz;
	
	
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminForm() {
		logger.info("ADMIN PAGE CONTROLLER");
		return "adminPage";
	}
	
	//회원목록
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public String adminMemberList(Model model,@RequestParam("pageNum")int pageNum) {
		logger.info("[ADMIN MEMBERLIST CONTROLLER]");
		
		List<MemberDto> memberlist = adminbiz.memberList(pageNum);
		pagingDto paging = adminbiz.memberListPaging(pageNum);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("paging", paging);
		
		return "adminMemberList";
	}
	
	//회원 상태변경
	@RequestMapping(value="/adminChangeStatus", method=RequestMethod.POST)
	public String adminChangeStatus(Model model, @RequestParam("email")String email, @RequestParam("status")int status,
			@RequestParam("pageNum")int pageNum) {
		
		if(status == 0) {
			model.addAttribute("msg", "상태를 선택해주세요");
			model.addAttribute("url", "adminMemberList?pageNum="+pageNum);
			return "alert";
		}
		
		int result = adminbiz.changeStatus(email, status);
		
		if(result>0) {
			model.addAttribute("msg", "변경되었습니다");
			model.addAttribute("url", "adminMemberList?pageNum="+pageNum);	
		}else {
			model.addAttribute("msg", "실패했습니다");
			model.addAttribute("url", "adminMemberList?pageNum="+pageNum);	
		}
		return "alert";
	}
	
	
}
