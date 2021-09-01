package com.amount.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AmountController {
	
	Logger logger = LoggerFactory.getLogger(AmountController.class);
	
	//관리자, 출금 리스트 목록
	@RequestMapping(value="adminWithdrawList")
	public String adminWithdrawList() {
		
		return "adminWithdrawBoard";
	}
}
