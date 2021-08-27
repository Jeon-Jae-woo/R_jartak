package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {

	@RequestMapping("/adminForm")
	public String adminForm() {
		return "adminPage";
	}
	
}
