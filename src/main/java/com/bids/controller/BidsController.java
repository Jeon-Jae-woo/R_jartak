package com.bids.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bids.biz.BidsBiz;

@Controller
public class BidsController {

	@Autowired
	private BidsBiz bidsbiz;
	
	//입찰
	@RequestMapping(value="/bid", method = RequestMethod.POST)
	private @ResponseBody Map<String, Object> Bid(HttpServletRequest request, @RequestBody Map<String,Object> bidsdata){
		Map<String,Object> data = new HashMap<String, Object>();
		
		if(request.getSession().getAttribute("nickname")==null) {
			data.put("status", HttpStatus.UNAUTHORIZED);
			return data;
		}
		/*
		if((Integer)request.getSession().getAttribute("level_no")==1) {
			data.put("message", "관리자는 입찰할 수 없습니다");
			return data;
		}*/
		
		String nickname = (String)request.getSession().getAttribute("nickname");
		
		String resultMessage = bidsbiz.BidProcessBiz(nickname, bidsdata); 
		
		System.out.println(resultMessage);
		data.put("message", resultMessage);
		data.put("status", HttpStatus.OK);
		
		return data;
	}
		
	
	
}
